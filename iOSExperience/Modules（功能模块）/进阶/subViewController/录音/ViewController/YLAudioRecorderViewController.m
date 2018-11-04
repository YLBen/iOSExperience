//
//  YLAudioRecorderViewController.m
//  iOSExperience
//
//  Created by Ben Lv on 2018/11/4.
//  Copyright © 2018年 avatar. All rights reserved.
//

#import "YLAudioRecorderViewController.h"
#import "RMAudioManager.h"
#import <Masonry.h>
#import "YLFileMannger.h"
#import "UIView+YLLoading.h"
#import "UIColor+YLHelper.h"
@interface YLAudioRecorderViewController ()<RMAudioManagerDelegate>
{
//    NSInteger _default_needVoice_msgId = -1;
}
@property (nonatomic, strong)  RMAudioManager  *audioManager; // 录音manager
@property(nonatomic,strong)UIButton *inputBtn,*playAudioBtn,*stopPlay;
@property (nonatomic, assign) long long currentPlayingVoiceMsgId;
//录制成功后wav全路径
@property(nonatomic,strong)NSString *strPathWav;
@end

@implementation YLAudioRecorderViewController


#pragma mark - life cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.inputBtn];
    [self.view addSubview:self.stopPlay];
    [self.view addSubview:self.playAudioBtn];
    [self initConstraints];
}
#pragma mark - public methods

#pragma mark - private methods
- (void)playAudio{
    if (self.strPathWav.length>0) {
        
        
        [self.audioManager playAudioWithPath:self.strPathWav];
    }else{
        [self.view av_postMessage:@"请先录音"];
    }
    
}

- (void)stopPlayVoice{
    if (self.strPathWav.length>0) {
        if (self.audioManager.isPlaying) {
            [self.audioManager stopPlayAudio];
        }

    }else{
        [self.view av_postMessage:@"请先录音"];
    }
    
}

-(void)voiceBtnTouchUpInsideClick {
    long long timeStamp = [[NSDate date] timeIntervalSince1970] * 1000;
    NSString *strDate = [NSString stringWithFormat:@"%lld",timeStamp];
    NSString *WavPath = [self getFilePathWithFileName:strDate];
    NSLog(@"%@",WavPath);
//    // 得到路径
//    NSString *strPathWav = [[MsgFilePathMgr share] getMessageDirFilePathWithFileName:strDate extension:extension_wav uid:self.strUid];
    
    // 开始录制声音到文件夹
    [self.audioManager startRecordWithPath:WavPath ShowInView:self.view];
}
-(void)voiceBtnTouchUpOutsideClick {
    [self.audioManager stopRecord];
}

- (void)voiceBtnTouchDragOutsideClick {
    [self.audioManager cancelRecord];
    
    // 防御，判断是否已超时
    if (self.audioManager.isFromCancel && !self.audioManager.isFinishRecord)
    {
        NSLog(@"时间太短，不能录音");
    }
    
}
- (void)initConstraints {
    [self.inputBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.view).offset(-20);
        make.left.equalTo(self.view).offset(40);
        make.right.equalTo(self.view).offset(-40);
        make.height.mas_equalTo(100);
    }];
    [self.playAudioBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.top.equalTo(self.view).offset(50);
        make.width.mas_equalTo(100);
        make.height.mas_equalTo(50);
    }];
    [self.stopPlay mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.width.mas_equalTo(100);
        make.height.mas_equalTo(50);
        make.top.equalTo(self.playAudioBtn.mas_bottom).offset(20);
    }];
    
}
#pragma mark - getter && setter

#pragma mark - lazy loading
- (UIButton *)inputBtn {
    
    if (!_inputBtn) {
        _inputBtn = [[UIButton alloc] init];
        [_inputBtn setTitle:@"按住说话" forState:UIControlStateNormal];
        [_inputBtn setTitle:@"正在录音" forState:UIControlStateHighlighted];
        _inputBtn.titleLabel.font = [UIFont systemFontOfSize:17];
        [_inputBtn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
         _inputBtn.titleLabel.font = [UIFont systemFontOfSize:15];
        [_inputBtn addTarget:self action:@selector(voiceBtnTouchUpInsideClick) forControlEvents:UIControlEventTouchDown];
        [_inputBtn addTarget:self action:@selector(voiceBtnTouchUpOutsideClick) forControlEvents:UIControlEventTouchUpInside];
        [_inputBtn addTarget:self action:@selector(voiceBtnTouchDragOutsideClick) forControlEvents:UIControlEventTouchUpOutside];
        _inputBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _inputBtn;
}
- (UIButton *)stopPlay {
    if (!_stopPlay) {
        _stopPlay = [[UIButton alloc] init];
        [_stopPlay setTitle:@"停止播放音频" forState:UIControlStateNormal];
        [_stopPlay setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_stopPlay addTarget:self action:@selector(stopPlayVoice) forControlEvents:UIControlEventTouchUpInside];
    }
    return _stopPlay;
    
}

- (UIButton *)playAudioBtn{
    if (!_playAudioBtn) {
        _playAudioBtn = [[UIButton alloc] init];
        [_playAudioBtn setTitle:@"播放录音" forState:UIControlStateNormal];
        [_playAudioBtn setTitleColor:[UIColor at_themeBlueColor] forState:UIControlStateNormal];
        [_playAudioBtn addTarget:self action:@selector(playAudio) forControlEvents:UIControlEventTouchUpInside];
    }
    return _playAudioBtn;
    
}

- (RMAudioManager *)audioManager
{
    if (!_audioManager)
    {
        _audioManager = [[RMAudioManager alloc] init];
        [_audioManager setDelegate:self];
    }
    return _audioManager;
}
#pragma mark - dataSouce

#pragma mark - delegate
/**
 *  播放完成的委托
 */
- (void)RMAudioManagerDelegateCallBack_AudioDidFinishPlaying {
    // 标记
//    self.currentPlayingVoiceMsgId = wz_default_needVoice_msgId;
}

/**
 *  录音完成的委托
 *
 *  @param duration 音频时长
 *  @param path     音频路径
 */
- (void)RMAudioManagerDelegateCallBack_AudioFinishedRecordWithDuration:(CGFloat)duration Path:(NSString *)path {
    if (self.audioManager.recordDuration <= 1.0f) {
        // 时间过短
        NSLog(@"时间太短，无法录音，请重试");
        [self.view av_postMessage:@"时间太短，无法录音，请重试"];
        return;
    }
    NSString *strPathWav = self.audioManager.recordPath;
    self.strPathWav = strPathWav;
}


/**
 *  录音失败的委托
 */
- (void)RMAudioManagerDelegateCallBack_AudioFailedRecordWithError:(NSError *)error {
    UIAlertView *cantRecordAlert =
    [[UIAlertView alloc] initWithTitle: @"无法录音"
                               message: @"麦克风可能损坏或者其他原因"
                              delegate: nil
                     cancelButtonTitle: @"确定"
                     otherButtonTitles:nil];
    [cantRecordAlert show];
    
}

#pragma mark - 得到路径
- (NSString *)getFilePathWithFileName:(NSString *)fileName {
    
    NSString *strPathName  = [NSString stringWithFormat:@"%@.wav",fileName];
    NSString *path = [[YLFileMannger instance] directoryForAttatchment];
    NSString *allPath = [path stringByAppendingPathComponent:strPathName];
    return allPath;
    
}
@end
