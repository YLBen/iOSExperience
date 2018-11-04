//
//  RMAudioManager.h
//  Titans
//
//  Created by Remon Lv on 14/12/19.
//  Copyright (c) 2014年 Remon Lv. All rights reserved.
//  音频录制 + 音频播放

#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>
#import "RMAudioHud.h"

@protocol RMAudioManagerDelegate <NSObject>

@required
/**
 *  播放完成的委托
 */
- (void)RMAudioManagerDelegateCallBack_AudioDidFinishPlaying;

/**
 *  录音完成的委托
 *
 *  @param duration 音频时长
 *  @param path     音频路径
 */
- (void)RMAudioManagerDelegateCallBack_AudioFinishedRecordWithDuration:(CGFloat)duration Path:(NSString *)path;


@optional
/**
 *  录音失败的委托
 */
- (void)RMAudioManagerDelegateCallBack_AudioFailedRecordWithError:(NSError *)error;

@end

@interface RMAudioManager : NSObject <AVAudioPlayerDelegate,AVAudioRecorderDelegate>
{
    NSTimer * timer_;
    RMAudioHud * voiceHud_;
    AVAudioSession *_audioSession;
    UIView *_viewTarget;                        // UI显示到的目标View
}
@property (nonatomic,strong) NSString *recordPath;      // 录制路径
@property (nonatomic) CGFloat recordDuration;             // 录制时长
@property (nonatomic,strong) AVAudioRecorder *recorder;
@property (nonatomic,strong) AVAudioPlayer *avPlay;
@property (nonatomic,weak) id <RMAudioManagerDelegate> delegate;
@property (nonatomic) BOOL isFromTimeOut;          // 是否是超时的标记
@property (nonatomic) BOOL isFromCancel;             // 是否是取消录音的标记
@property (nonatomic) BOOL isFinishRecord;           // 是否完成录音的标记

@property (nonatomic, assign, readonly) BOOL isPlaying;

// 开始录音
- (void)startRecordWithPath:(NSString *)path ShowInView:(UIView *)targetView;
// 停止录音
- (void)stopRecord;
// 取消录音
- (void)cancelRecord;

// 播放声音
- (void)playAudioWithPath:(NSString *)path;

/**
 *  停止播放音频
 */
- (void)stopPlayAudio;

// 计算音频长度
+ (CGFloat)calculateAudioDurationWithPath:(NSString *)path;

@end
