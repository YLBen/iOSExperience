//
//  RMAudioHud.h
//  Titans
//
//  Created by Remon Lv on 14/12/22.
//  Copyright (c) 2014年 Remon Lv. All rights reserved.
//  音频录制UI指示器

#import <UIKit/UIKit.h>

@interface RMAudioHud : UIView
{
    UIImageView *_imgViewRecord;          // 录音指示器View
}

/**
 *  显示录音的动画到目标View
 *
 *  @param viewTarget 目标View
 */
- (void)showInView:(UIView *)viewTarget;

/**
 *  隐藏录音动画View
 */
- (void)hide;

/**
 *  设置声波输入动画
 *
 *  @param enable 动画开关
 */
- (void)setAnimationEnable:(BOOL)enable;

@end
