//
//  UILabel+YLHelper.h
//  iOSExperience
//
//  Created by Ben Lv on 2018/5/26.
//  Copyright © 2018年 avatar. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (YLHelper)

+ (UILabel *)av_labelWithtextColor:(UIColor *)color font:(UIFont *)font;
+ (UILabel *)av_labelWithtextColor:(UIColor *)color font:(UIFont *)font text:(NSString *)text;

@end
