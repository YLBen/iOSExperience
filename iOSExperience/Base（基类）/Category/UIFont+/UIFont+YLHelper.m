//
//  UIFont+YLHelper.m
//  iOSExperience
//
//  Created by Ben Lv on 2018/5/26.
//  Copyright © 2018年 avatar. All rights reserved.
//

#import "UIFont+YLHelper.h"

@implementation UIFont (YLHelper)

#pragma mark - public

+ (UIFont *)av_font_18 {
    return [self av_fontOfSize:18];
}

+ (UIFont *)av_font_15 {
    return [self av_fontOfSize:15];
}

+ (UIFont *)av_font_12 {
    return [self av_fontOfSize:12];
}

+ (UIFont *)av_font_11 {
    return [self av_fontOfSize:11];
}

+ (UIFont *)av_boldFont_18 {
    return [self av_boldFontOfSize:18];
}

#pragma mark - private

+ (UIFont *)av_fontOfSize:(CGFloat)size {
    return [UIFont systemFontOfSize:size];
}

+ (UIFont *)av_boldFontOfSize:(CGFloat)size {
    return [UIFont boldSystemFontOfSize:size];
}

@end
