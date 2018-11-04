//
//  YLQuickCreateManager.h
//  iOSExperience
//
//  Created by Ben Lv on 2018/11/2.
//  Copyright © 2018年 avatar. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface YLQuickCreateManager : NSObject
//label
+ (UILabel *)creatLableWithFrame:(CGRect)rect Text:(NSString *)text Font:(UIFont *)font Alignment:(NSTextAlignment)alignment Color:(UIColor *)color;
//button
+ (UIButton *)creatWithFrame:(CGRect)rect Target:(id)target action:(SEL)action imageNamed:(NSString *)imageName titleFont:(UIFont *)font titleColor:(UIColor *)color title:(NSString *)title;
// UITextField
+ (UITextField *)creatTextFieldWithFrame:(CGRect)rect Placeholder:(NSString *)title TextFont:(UIFont *)font TextColor:(UIColor *)textColor BgImage:(UIImage *)imgae BgColor:(UIColor *)bgColor Tag:(NSInteger)tag Secure:(BOOL)secure;
@end

NS_ASSUME_NONNULL_END
