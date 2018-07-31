//
//  shony.m
//  超文本链接
//
//  Created by Ben Lv on 2018/7/12.
//  Copyright © 2018年 avatar. All rights reserved.
//

#import "shony.h"

@implementation shony
- (instancetype)initWithFrame:(CGRect)frame withBackgroundColor:(UIColor *)backgroundColor {
    self = [super initWithFrame:frame];
    if (self) {
        _myColor = backgroundColor;
        [self makeButtonShiny:self WithBackgroundClolr:backgroundColor];
        [self addTarget:self action:@selector(wasPressed) forControlEvents:UIControlEventTouchDown];
        [self addTarget:self action:@selector(endedPressed) forControlEvents:UIControlEventTouchUpInside];
    }
    return self;
}

- (void)makeButtonShiny:(shony *)button WithBackgroundClolr:(UIColor *)backgroundClolr {
    CALayer *layer = button.layer;
    
    layer.cornerRadius = 8.0;
    layer.masksToBounds = YES;
    layer.borderWidth = 2.0f;
    layer.borderColor = [UIColor colorWithWhite:0.4f alpha:0.2f].CGColor;
//    绘制渐变色
    CAGradientLayer *shineLayer = [CAGradientLayer layer];
    shineLayer.frame = button.layer.bounds;
//    抛光的颜色
    shineLayer.colors = [NSArray arrayWithObjects:
                         (id) [UIColor colorWithWhite:1.0f alpha:0.4f].CGColor,
                         (id) [UIColor colorWithWhite:1.0f alpha:0.2f].CGColor,
                         (id) [UIColor colorWithWhite:0.75f alpha:0.2f].CGColor,
                         (id) [UIColor colorWithWhite:0.4f alpha:0.2f].CGColor,
                         (id) [UIColor colorWithWhite:1.0 alpha:0.4].CGColor,
                         
                         nil];
//    抛光的位置
    shineLayer.locations = [NSArray
                            arrayWithObjects:[NSNumber numberWithFloat:0.0f],
                            [NSNumber numberWithFloat:0.5f],
                            [NSNumber numberWithFloat:0.5f],
                            [NSNumber numberWithFloat:0.8f],
                            [NSNumber numberWithFloat:1.0f],
                            nil];
    [button.layer addSublayer:shineLayer];
    
}

- (void)wasPressed {
    UIColor *newColor;
    CGFloat red = 0.0,green = 0.0,blue = 0.0 ,alpha = 0.0,white = 0.0;
    if ([self.myColor respondsToSelector:@selector(getRed:green:blue:alpha:)]) {
        [self.myColor getRed:&red green:&green blue:&blue alpha:&alpha];
        [self.myColor getWhite:&white alpha:&alpha];
    }
    self.backgroundColor = newColor;
}

- (void)endedPressed {
    self.backgroundColor  = self.myColor;
}

@end
