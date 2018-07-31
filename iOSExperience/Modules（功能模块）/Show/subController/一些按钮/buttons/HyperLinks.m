//
//  HyperLinks.m
//  超文本链接
//
//  Created by Ben Lv on 2018/7/12.
//  Copyright © 2018年 avatar. All rights reserved.
//

#import "HyperLinks.h"

@implementation HyperLinks

+ (HyperLinks *)hyperlinksButton {
    HyperLinks *button = [[HyperLinks alloc] init];
    return button;
}

-(void)drawRect:(CGRect)rect {
    CGRect textRect = self.titleLabel.frame;
    //获得当前上下文
    CGContextRef contectRef = UIGraphicsGetCurrentContext();
//    获取基准线以下的高度
    CGFloat descender = self.titleLabel.font.descender;
    if ([lineColor isKindOfClass:[UIColor class]]) {
        //设置画笔颜色
        CGContextSetStrokeColorWithColor(contectRef, lineColor.CGColor);
    }
    CGContextSetStrokeColorWithColor(contectRef, [UIColor redColor].CGColor);
//    设置初始点
    CGContextMoveToPoint(contectRef, textRect.origin.x, textRect.origin.y+textRect.size.height+descender+5);//取点 y+控件高度 +基准线高度
    
//    设置结束点
    CGContextAddLineToPoint(contectRef, textRect.origin.x + textRect.size.width, textRect.origin.y +textRect.size.height + descender + 5);
    
//    关闭路径
    CGContextClosePath(contectRef);
    CGContextDrawPath(contectRef, kCGPathStroke);
    
    
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [super touchesBegan:touches withEvent:event];
//    设置标题颜色
    [self.titleLabel setTextColor:[UIColor yellowColor]];
    
    NSLog(@"触发了");
    
}
- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [super touchesMoved:touches withEvent:event];
    
}
-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    [super touchesEnded:touches withEvent:event];
    
}

- (void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [super touchesCancelled:touches withEvent:event];
}


@end
