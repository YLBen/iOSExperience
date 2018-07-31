//
//  shony.h
//  超文本链接
//
//  Created by Ben Lv on 2018/7/12.
//  Copyright © 2018年 avatar. All rights reserved.
//   高光按钮

#import <UIKit/UIKit.h>

@interface shony : UIButton
@property(nonatomic,strong)UIColor *myColor;

- (instancetype)initWithFrame:(CGRect)frame withBackgroundColor:(UIColor *)backgroundColor;

- (void)wasPressed;
- (void)endedPressed;

- (void)makeButtonShiny:(shony *)button WithBackgroundClolr:(UIColor *)backgroundClolr;

@end
