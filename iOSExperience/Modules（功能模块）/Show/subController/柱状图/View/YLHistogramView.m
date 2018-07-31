//
//  YLHistogramView.m
//  柱状图
//
//  Created by Ben Lv on 2018/7/29.
//  Copyright © 2018年 avatar. All rights reserved.
//

#import "YLHistogramView.h"

@implementation YLHistogramView

- (void)drawRect:(CGRect)rect {
    
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    CGFloat margin = 30;
    
    if (self.nums.count > 5) {
        margin = 10;
    }
    
    //柱状图的宽度 = （ view的宽度 - 间隔的总宽度 ）/ 柱状图的个数
    CGFloat width = (rect.size.width - (self.nums.count + 1) *margin) / self.nums.count;
    
    
    for (int i = 0; i < self.nums.count; i++) {
        
        //求出 每一个数字所占的比例
        CGFloat num = [self.nums[i] floatValue]/100;
        //起点位置
        CGFloat x = margin + (width + margin) * i ;
        CGFloat y = rect.size.height * (1 - num);
        CGFloat height = rect.size.height * num;
        
        CGRect rectA = CGRectMake(x, y, width, height);
        CGContextAddRect(ctx, rectA);
        
        CGFloat randRed = arc4random_uniform(256)/255.0;
        CGFloat randGreen = arc4random_uniform(256)/255.0;
        CGFloat randBlue = arc4random_uniform(256)/255.0;
        UIColor *randomColor = [UIColor colorWithRed:randRed green:randGreen blue:randBlue alpha:1];
        
        [randomColor set];
        //渲染
        CGContextFillPath(ctx);
        
    }

    
    
}

@end
