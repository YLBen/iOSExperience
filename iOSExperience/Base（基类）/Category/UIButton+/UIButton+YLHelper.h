//
//  UIButton+YLHelper.h
//  iOSExperience
//
//  Created by Ben Lv on 2018/5/26.
//  Copyright © 2018年 avatar. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (YLHelper)

+ (UIButton *)av_buttonWithTarget:(id)target action:(SEL)action titleFont:(UIFont *)font titleColor:(UIColor *)color title:(NSString *)title;

+ (UIButton *)av_buttonWithTarget:(id)target action:(SEL)action imageNamed:(NSString *)imageName;
+ (UIButton *)av_buttonWithTarget:(id)target action:(SEL)action imageNamed:(NSString *)imageName borderColor:(UIColor *)bordercolor;

+ (UIButton *)av_buttonWithTarget:(id)target action:(SEL)action imageNamed:(NSString *)imageName titleFont:(UIFont *)font titleColor:(UIColor *)color title:(NSString *)title;
+ (UIButton *)av_buttonWithTarget:(id)target action:(SEL)action imageNamed:(NSString *)imageName borderColor:(UIColor *)bordercolor borderWidth:(int)borderWidth titleFont:(UIFont *)font titleColor:(UIColor *)color title:(NSString *)title;

@end
