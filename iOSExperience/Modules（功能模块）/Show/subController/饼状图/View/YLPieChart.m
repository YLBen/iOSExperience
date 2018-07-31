//
//  YLPieChart.m
//  饼状图
//
//  Created by Ben Lv on 2018/7/29.
//  Copyright © 2018年 avatar. All rights reserved.
//

#import "YLPieChart.h"

@implementation YLPieChart


- (NSInteger)total
{
    if (_total == 0) {
        for (int i = 0; i < self.nums.count ; i ++) {
            _total += [self.nums[i] integerValue];
        }
    }
    return _total;
}


- (void)drawRect:(CGRect)rect {
    
    CGFloat radius = 150;
    CGFloat startA = 0;
    CGFloat endA = 0;
    
    for (int i = 0; i < self.nums.count; i++) {
        NSNumber *num = self.nums[i];
        startA = endA;
        
        endA = startA + [num floatValue]/self.total * (2 * M_PI);
        UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:self.center radius:radius startAngle:startA endAngle:endA clockwise:YES];
        [path addLineToPoint:self.center];
        
        CGFloat randRed = arc4random_uniform(256)/255.0;
        CGFloat randGreen = arc4random_uniform(256)/255.0;
        CGFloat randBlue = arc4random_uniform(256)/255.0;
        UIColor *randomColor = [UIColor colorWithRed:randRed green:randGreen blue:randBlue alpha:1];
        [randomColor set];
        
        [path fill];
    }

    
    
}

@end
