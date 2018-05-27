//
//  UIButton+YLHelper.m
//  iOSExperience
//
//  Created by Ben Lv on 2018/5/26.
//  Copyright © 2018年 avatar. All rights reserved.
//

#import "UIButton+YLHelper.h"

@implementation UIButton (YLHelper)

+ (UIButton *)av_buttonWithTarget:(id)target action:(SEL)action titleFont:(UIFont *)font titleColor:(UIColor *)color title:(NSString *)title {
    UIButton *btn = [self av_buttonWithTarget:target action:action imageNamed:nil titleFont:font titleColor:color title:title];
    
    return btn;
}

+ (UIButton *)av_buttonWithTarget:(id)target action:(SEL)action imageNamed:(NSString *)imageName {
    UIButton *btn = [self av_buttonWithTarget:target action:action imageNamed:imageName titleFont:nil titleColor:nil title:nil];
    return btn;
}

+ (UIButton *)av_buttonWithTarget:(id)target action:(SEL)action imageNamed:(NSString *)imageName borderColor:(UIColor *)bordercolor {
    UIButton *btn = [self av_buttonWithTarget:target action:action imageNamed:imageName borderColor:bordercolor borderWidth:1 titleFont:nil titleColor:nil title:nil];
    return btn;
}

+ (UIButton *)av_buttonWithTarget:(id)target action:(SEL)action imageNamed:(NSString *)imageName titleFont:(UIFont *)font titleColor:(UIColor *)color title:(NSString *)title {
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    if (action) {
        [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    }
    
    // 设置图片
    if (imageName) {
        [btn setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    }
    
    if (title) {
        [btn setTitle:title forState:UIControlStateNormal];
        
    }
    
    [btn setTitleColor:color forState:UIControlStateNormal];
    btn.titleLabel.font = font;
    return btn;
}

+ (UIButton *)av_buttonWithTarget:(id)target action:(SEL)action imageNamed:(NSString *)imageName borderColor:(UIColor *)bordercolor borderWidth:(int)borderWidth titleFont:(UIFont *)font titleColor:(UIColor *)color title:(NSString *)title {
    UIButton *btn= [self av_buttonWithTarget:target action:action imageNamed:imageName titleFont:font titleColor:color title:title];
    btn.layer.borderColor = bordercolor.CGColor;
    btn.layer.borderWidth = borderWidth;
    return btn;
}

@end
