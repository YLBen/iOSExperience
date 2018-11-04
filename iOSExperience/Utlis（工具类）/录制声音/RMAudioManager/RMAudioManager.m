//
//  RMAudioManager.m
//  Titans
//
//  Created by Remon Lv on 14/12/19.
//  Copyright (c) 2014年 Remon Lv. All rights reserved.
//

#import "RMAudioManager.h"

#define WAVE_UPDATE_FREQUENCY   0.05
#define DURATION_RECORD 60          // 默认录音最大时长

@implementation RMAudioManager

#pragma mark - Interface Method

- (id)init
{
    if (self = [super init])
    {
        _audioSession = [AVAudioSession sharedInstance];
    }
    return self;
}

// 开始录音
- (void)startRecordWithPath:(NSString *)path ShowInView:(UIView *)targetView
{
    NSError * error = nil;
    
    [_audioSession setCategory :AVAudioSessionCategoryPlayAndRecord error:&error];
    
    if(error)
    {
        if ([self.delegate respondsToSelector:@selector(RMAudioManagerDelegateCallBack_AudioFailedRecordWithError:)])
        {
            [self.delegate RMAudioManagerDelegateCallBack_AudioFailedRecordWithError:error];
        }
        return;
    }
    
    [_audioSession setActive:YES error:&error];
    error = nil;
    if(error)
    {
        if ([self.delegate respondsToSelector:@selector(RMAudioManagerDelegateCallBack_AudioFailedRecordWithError:)])
        {
            [self.delegate RMAudioManagerDelegateCallBack_AudioFailedRecordWithError:error];
        }
        return;
    }
    
    NSMutableDictionary * recordSetting = [NSMutableDictionary dictionary];
    
    //设置录音格式  AVFormatIDKey == WAV
    [recordSetting setValue:[NSNumber numberWithInt:kAudioFormatLinearPCM] forKey:AVFormatIDKey];
    //设置录音采样率(Hz) 如：AVSampleRateKey==8000/44100/96000（影响音频的质量）
    [recordSetting setValue:[NSNumber numberWithFloat:8000] forKey:AVSampleRateKey];
    //录音通道数  1 或 2
    [recordSetting setValue:[NSNumber numberWithInt:1] forKey:AVNumberOfChannelsKey];
    //线性采样位数  8、16、24、32
    [recordSetting setValue:[NSNumber numberWithInt:16] forKey:AVLinearPCMBitDepthKey];
    //录音的质量
    [recordSetting setValue:[NSNumber numberWithInt:AVAudioQualityMedium] forKey:AVEncoderAudioQualityKey];
    
    /*CAF格式
     [recordSetting setValue :[NSNumber numberWithInt:kAudioFormatAppleIMA4] forKey:AVFormatIDKey];
     [recordSetting setValue:[NSNumber numberWithFloat:16000.0] forKey:AVSampleRateKey];
     [recordSetting setValue:[NSNumber numberWithInt: 1] forKey:AVNumberOfChannelsKey];
     */
    
    /*
     [recordSetting setValue :[NSNumber numberWithInt:16] forKey:AVLinearPCMBitDepthKey];
     [recordSetting setValue :[NSNumber numberWithBool:NO] forKey:AVLinearPCMIsBigEndianKey];
     [recordSetting setValue :[NSNumber numberWithBool:NO] forKey:AVLinearPCMIsFloatKey];
     */
    
    // 路径
    _recordPath = path;
    NSURL * url = [NSURL fileURLWithPath:_recordPath];
    
    // 保存录音
    error = nil;
    NSData * audioData = [NSData dataWithContentsOfFile:[url path] options: 0 error:&error];
    if(audioData)
    {
        NSFileManager *fm = [NSFileManager defaultManager];
        [fm removeItemAtPath:[url path] error:&error];
    }
    
    error = nil;
    if(_recorder)
    {
        [_recorder stop];
        _recorder = nil;
    }
    
    _recorder = [[AVAudioRecorder alloc] initWithURL:url settings:recordSetting error:&error];
    
    if(!_recorder)
    {
        if ([self.delegate respondsToSelector:@selector(RMAudioManagerDelegateCallBack_AudioFailedRecordWithError:)])
        {
            [self.delegate RMAudioManagerDelegateCallBack_AudioFailedRecordWithError:error];
        }
        return;
    }
    
    [_recorder setDelegate:self];
    [_recorder prepareToRecord];
    _recorder.meteringEnabled = YES;
    
    if (! _audioSession.inputAvailable)
    {
        if ([self.delegate respondsToSelector:@selector(RMAudioManagerDelegateCallBack_AudioFailedRecordWithError:)])
        {
            [self.delegate RMAudioManagerDelegateCallBack_AudioFailedRecordWithError:error];
        }
        return;
    }
    
    [_recorder recordForDuration:(NSTimeInterval) DURATION_RECORD];
    _recordDuration = 0;
    _isFromTimeOut = YES;           // 超时标记
    _isFromCancel = NO;               // 标记取消
    _isFinishRecord = NO;             // 标记未完成
    _viewTarget = targetView;       // 动画UI加载到目标的View
    [self resetTimer];
    
    // 每隔0.05秒去检测音量
    timer_ = [NSTimer scheduledTimerWithTimeInterval:WAVE_UPDATE_FREQUENCY target:self selector:@selector(updateMeters) userInfo:nil repeats:YES];
    
    // 加上遮罩
    [self showVoiceHudOrHide:YES];
}

// 停止录音
- (void)stopRecord
{
    [self cancelRecording];
    _isFromTimeOut = NO;
    _isFromCancel = NO;
}

// 取消录音
- (void)cancelRecord
{
    [self cancelRecording];
    _isFromTimeOut = NO;
    _isFromCancel = YES;
}

// 播放声音
- (void)playAudioWithPath:(NSString *)path
{
    if (_avPlay.playing)
    {
        [_avPlay stop];
    }
    
    // 打开传感器监听
    [self setProximityMonitoringEnabled:YES];
    
    // 默认开启扬声器
    [_audioSession setCategory:AVAudioSessionCategoryPlayback error:nil];
    [_audioSession setActive:YES error:nil];
    
    NSData *audio = [NSData dataWithContentsOfFile:path];
    _avPlay = [[AVAudioPlayer alloc] initWithData:audio error:nil];
    _avPlay.delegate = self;
    
    [_avPlay play];
}

/**
 *  停止播放音频
 */
- (void)stopPlayAudio
{
    [_avPlay stop];
    
    // 移除传感器
    [self setProximityMonitoringEnabled:NO];
}

- (BOOL)isPlaying {
    return _avPlay.isPlaying;
}

// 计算音频长度
+ (CGFloat)calculateAudioDurationWithPath:(NSString *)path
{
    NSData *data = [NSData dataWithContentsOfFile:path];
    AVAudioPlayer *play_tmp = [[AVAudioPlayer alloc] initWithData:data error:nil];
    NSTimeInterval k = play_tmp.duration;
    if (k < 1)
    {
        k = 1;
    }
    return k;
}

#pragma mark - Timer Update
// 音量指示器
- (void)updateMeters
{
    _recordDuration += WAVE_UPDATE_FREQUENCY;
    
    if (voiceHud_)
    {
        /*  发送updateMeters消息来刷新平均和峰值功率。
         *  此计数是以对数刻度计量的，-160表示完全安静，
         *  0表示最大输入值
         */
        
        if (_recorder)
        {
            [_recorder updateMeters];
        }
        
        float peakPower = [_recorder averagePowerForChannel:0];
        double ALPHA = 0.05;
        double peakPowerForChannel = pow(10, (ALPHA * peakPower));
        
        // 有声音输入就显示动画
        [voiceHud_ setAnimationEnable:(peakPowerForChannel > 0.01)];
    }
}

#pragma mark - Private Method

/** UI显隐 */
- (void)showVoiceHudOrHide:(BOOL)yesOrNo
{
    
    if (voiceHud_)
    {
        [voiceHud_ hide];
        voiceHud_ = nil;
    }
    
    if (yesOrNo)
    {
        voiceHud_ = [[RMAudioHud alloc] initWithFrame:_viewTarget.bounds];
                
        [voiceHud_ showInView:_viewTarget];
    }
}

/** 重设定时器 */
- (void)resetTimer
{
    if (timer_)
    {
        [timer_ invalidate];
        timer_ = nil;
    }
}

/** 停止录音器 */
- (void)cancelRecording
{
    [self showVoiceHudOrHide:NO];
    [self resetTimer];
    
    if (self.recorder.isRecording)
    {
        [self.recorder stop];
    }
    
    self.recorder = nil;
    
    // 防御性编程
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

/** 近距离传感器监听开关 */
- (void)setProximityMonitoringEnabled:(BOOL)enabled
{
    UIDevice *myDevice = [UIDevice currentDevice];
    
    if (enabled)
    {
        // 判断是否有传感器
        [myDevice setProximityMonitoringEnabled:YES];
        if (myDevice.proximityMonitoringEnabled)
        {
            // 增加近距离事件监听
            [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(sensorStateChange:)name:UIDeviceProximityStateDidChangeNotification object:nil];
        }
    }
    else
    {
        // 判断是否有传感器
        [myDevice setProximityMonitoringEnabled:YES];
        if (myDevice.proximityMonitoringEnabled)
        {
            // 删除近距离事件监听
            [[NSNotificationCenter defaultCenter] removeObserver:self name:UIDeviceProximityStateDidChangeNotification object:nil];
        }
        [myDevice setProximityMonitoringEnabled:NO];
    }
}

/** 收到传感器变化的通知 */
- (void)sensorStateChange:(NSNotificationCenter *)notification;
{
    // 如果此时手机靠近面部放在耳朵旁，那么声音将通过听筒输出，并将屏幕变暗（省电啊）
    if ([[UIDevice currentDevice] proximityState])    // 黑屏--听筒
    {
        [_audioSession setCategory:AVAudioSessionCategoryPlayAndRecord error:nil];
        
    }
    else    // 没黑屏幕--扬声器
    {
        [_audioSession setCategory:AVAudioSessionCategoryPlayback error:nil];
    }
}

#pragma mark - AVAudioPlayer delegate

// 播放完成的委托回调
- (void)audioPlayerDidFinishPlaying:(AVAudioPlayer *)player successfully:(BOOL)flag
{
    // 打开传感器监听
    [self setProximityMonitoringEnabled:NO];
    
    // 转发委托
    if ([self.delegate respondsToSelector:@selector(RMAudioManagerDelegateCallBack_AudioDidFinishPlaying)])
    {
        [self.delegate RMAudioManagerDelegateCallBack_AudioDidFinishPlaying];
    }

    // 恢复后台音乐播放
    [_audioSession setActive:NO error:nil];
}

#pragma mark - AVAudioRecord delegate

// 录音完成的回调(包含超时的操作)
- (void)audioRecorderDidFinishRecording:(AVAudioRecorder *)recorder successfully:(BOOL)flag
{
    // 区分是否来自超时的委托
    if (_isFromTimeOut)
    {
        // 取消UI
        [self cancelRecording];
    }
    else
    {
        // 判断是否是取消录音
        if (_isFromCancel)
        {
            return;
        }
    }
    
    // 发送委托
    if ([self.delegate respondsToSelector:@selector(RMAudioManagerDelegateCallBack_AudioFinishedRecordWithDuration:Path:)])
    {
        [self.delegate RMAudioManagerDelegateCallBack_AudioFinishedRecordWithDuration:_recordDuration Path:_recordPath];
        
        _isFinishRecord = YES;
    }
    
    // 恢复后台音乐播放
    [_audioSession setActive:NO error:nil];
}

- (void)audioRecorderEncodeErrorDidOccur:(AVAudioRecorder *)recorder error:(NSError *)error
{
    if ([self.delegate respondsToSelector:@selector(RMAudioManagerDelegateCallBack_AudioFailedRecordWithError:)])
    {
        [self.delegate RMAudioManagerDelegateCallBack_AudioFailedRecordWithError:error];
    }
    
    // 恢复后台音乐播放
    [_audioSession setActive:NO error:nil];
}

@end
