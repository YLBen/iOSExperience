//
//  YLQuickCreateManager.m
//  iOSExperience
//
//  Created by Ben Lv on 2018/11/2.
//  Copyright © 2018年 avatar. All rights reserved.
//

#import "YLQuickCreateManager.h"

@implementation YLQuickCreateManager

+ (UILabel *)creatLableWithFrame:(CGRect)rect Text:(NSString *)text Font:(UIFont *)font Alignment:(NSTextAlignment)alignment Color:(UIColor *)color
{
    UILabel *lable = [[UILabel alloc] initWithFrame:rect];
    [lable setText:text];
    [lable setFont:font];
    [lable setTextAlignment:alignment];
    [lable setTextColor:color];
    return lable;
}

+ (UIButton *)creatWithFrame:(CGRect)rect Target:(id)target action:(SEL)action imageNamed:(NSString *)imageName titleFont:(UIFont *)font titleColor:(UIColor *)color title:(NSString *)title {
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = rect;
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
// UITextField
+ (UITextField *)creatTextFieldWithFrame:(CGRect)rect Placeholder:(NSString *)title TextFont:(UIFont *)font TextColor:(UIColor *)textColor BgImage:(UIImage *)imgae BgColor:(UIColor *)bgColor Tag:(NSInteger)tag Secure:(BOOL)secure
{
    UITextField *txfd = [[UITextField alloc] initWithFrame:rect];
    if (imgae != nil)
    {
        [txfd setBackground:imgae];
    }
    if (bgColor != nil)
    {
        [txfd setBackgroundColor:bgColor];
    }
    [txfd setTag:tag];
    [txfd setPlaceholder:title];
    [txfd setTextColor:textColor];
    [txfd setFont:font];
    [txfd setSecureTextEntry:secure];
    
    // 左侧不顶格变相设置
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 5, rect.size.height)];
    txfd.leftView = view;
    txfd.leftViewMode = UITextFieldViewModeAlways;
    
    return txfd;
}
@end
