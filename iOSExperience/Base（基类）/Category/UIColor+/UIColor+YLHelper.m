//
//  UIColor+YLHelper.m
//  iOSExperience
//
//  Created by Ben Lv on 2018/5/26.
//  Copyright © 2018年 avatar. All rights reserved.
//

#import "UIColor+YLHelper.h"

@implementation UIColor (YLHelper)

+ (UIColor *)av_colorWithHex:(NSInteger)hexValue alpha:(CGFloat)alphaValue
{
    return [UIColor colorWithRed:((float)((hexValue & 0xFF0000) >> 16))/255.0
                           green:((float)((hexValue & 0xFF00) >> 8))/255.0
                            blue:((float)(hexValue & 0xFF))/255.0 alpha:alphaValue];
}

+ (UIColor *)av_colorWithHex:(NSInteger)hexValue
{
    return [UIColor av_colorWithHex:hexValue alpha:1.0];
}

+ (UIColor *)av_colorWithRed:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue
{
    return [self av_colorWithRed:red green:green blue:blue alpha:1];
}

+ (UIColor *)av_colorWithRed:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue alpha:(CGFloat)alpha
{
    return [UIColor colorWithRed:red / 255.0 green:green / 255.0 blue: blue / 255.0 alpha:alpha];
}

#pragma mark - 主题颜色
+ (UIColor *)av_themeOrangeColor {
    return [UIColor av_colorWithHex:0xf6540c];
}
+ (UIColor *)at_themeBlueColor {
    return [UIColor av_colorWithHex:0x0099ff];
}
#pragma mark - 背景颜色

+ (UIColor *)av_bgLightGrayColor {
    return [UIColor av_colorWithHex:0xefeff4];
}

+ (UIColor *)av_bgGrayColor {
    return [UIColor av_colorWithHex:0xb2b2b2];
}

#pragma mark - 字体颜色

+ (UIColor *)av_fontBlackColor {
    return [UIColor av_colorWithHex:0x333333];
}

+ (UIColor *)av_fontDarkGrayColor {
    return [UIColor av_colorWithHex:0x888888];
}

+ (UIColor *)av_fontOrangeColor {
    return [UIColor av_colorWithHex:0xf6540c];
}

+ (UIColor *)av_fontBlueColor {
    return [UIColor av_colorWithHex:0x0099ff];
}

+ (UIColor *)av_fontGreenColor {
    return [UIColor av_colorWithHex:0x23d28a];
}

//+ (UIColor *)av_lightGrayColor {
//    return [UIColor av_colorWithHex:0xdddddd];
//}
//
//+ (UIColor *)av_blueColor {
//    return [UIColor av_colorWithHex:0x0199FF];//0x0099ff
//}
//
//+ (UIColor *)av_lavenderColor {
//    return [UIColor av_colorWithHex:0xcde1ff];
//}
//
//+ (UIColor *)av_ghostWhiteColor {
//    return [UIColor av_colorWithHex:0xf1f7ff];
//}
//
//+ (UIColor *)av_goldColor {
//    return [UIColor av_colorWithHex:0xffb86c];
//}
//
//+ (UIColor *)av_redColor {
//    return [UIColor av_colorWithHex:0xff6c6c];
//}
//
//+ (UIColor *)av_greenColor {
//    return [UIColor av_colorWithHex:0x22C064];
//}

@end
