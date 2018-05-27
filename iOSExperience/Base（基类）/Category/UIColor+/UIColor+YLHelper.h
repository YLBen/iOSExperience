//
//  UIColor+YLHelper.h
//  iOSExperience
//
//  Created by Ben Lv on 2018/5/26.
//  Copyright © 2018年 avatar. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (YLHelper)
/**
 设置十六进制颜色和透明度
 
 @param hexValue 十六进制值
 @param alphaValue 透明度
 @return 颜色
 */
+ (UIColor *)av_colorWithHex:(NSInteger)hexValue alpha:(CGFloat)alphaValue;
+ (UIColor *)av_colorWithHex:(NSInteger)hexValue;


/**
 设置RGB颜色
 
 @param red 红
 @param green 绿
 @param blue 蓝
 @param alpha 透明度
 */
+ (UIColor *)av_colorWithRed:(CGFloat)red
                       green:(CGFloat)green
                        blue:(CGFloat)blue
                       alpha:(CGFloat)alpha;

+ (UIColor *)av_colorWithRed:(CGFloat)red
                       green:(CGFloat)green
                        blue:(CGFloat)blue;

/** 主题颜色 */
+ (UIColor *)av_themeOrangeColor;
/** 背景颜色 */
+ (UIColor *)av_bgLightGrayColor;
+ (UIColor *)av_bgGrayColor;


/// 字体颜色
+ (UIColor *)av_fontBlackColor;//标题、正文
+ (UIColor *)av_fontDarkGrayColor;//辅助内容、提示文案、按钮置灰
+ (UIColor *)av_fontOrangeColor;//选中状态
+ (UIColor *)av_fontBlueColor;
+ (UIColor *)av_fontGreenColor;

//+ (UIColor *)av_lightGrayColor;
//+ (UIColor *)av_blueColor;
//+ (UIColor *)av_lavenderColor;
//+ (UIColor *)av_ghostWhiteColor;
//+ (UIColor *)av_goldColor;
//+ (UIColor *)av_redColor;
//+ (UIColor *)av_greenColor;
@end
