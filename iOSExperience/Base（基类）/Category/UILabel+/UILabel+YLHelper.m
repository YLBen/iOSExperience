//
//  UILabel+YLHelper.m
//  iOSExperience
//
//  Created by Ben Lv on 2018/5/26.
//  Copyright © 2018年 avatar. All rights reserved.
//

#import "UILabel+YLHelper.h"

@implementation UILabel (YLHelper)

+ (UILabel *)av_labelWithtextColor:(UIColor *)color font:(UIFont *)font
{
    UILabel *label = [self av_labelWithtextColor:color font:font text:nil];
    return label;
}

+ (UILabel *)av_labelWithtextColor:(UIColor *)color font:(UIFont *)font text:(NSString *)text
{
    UILabel *label = [[UILabel alloc] init];
    if (color) {
        label.textColor = color;
    }
    if (font) {
        label.font = font;
    }
    if (text) {
        label.text = text;
    }
    
    return label;
}

@end
