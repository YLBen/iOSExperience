//
//  CustomProgressView.m
//  简单下载进度条
//
//  Created by Ben Lv on 2018/7/29.
//  Copyright © 2018年 avatar. All rights reserved.
//

#import "CustomProgressView.h"

@implementation CustomProgressView

- (void)setProgressValue:(CGFloat)progressValue {
    _progressValue = progressValue;
    [self setNeedsDisplay];
    
}

- (void)drawRect:(CGRect)rect {
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:self.center radius:100 startAngle:-M_PI_2 endAngle:(_progressValue / 100.0) * (2 * M_PI) -M_PI_2 clockwise:YES];
    
    [[UIColor redColor] set];
    [path setLineWidth:10];
    [path setLineCapStyle:kCGLineCapRound];
    [path stroke];
    
}

@end
