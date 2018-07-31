//
//  imageView.m
//  绘图片
//
//  Created by Ben Lv on 2018/7/29.
//  Copyright © 2018年 avatar. All rights reserved.
//

#import "imageView.h"

@implementation imageView

- (void)drawRect:(CGRect)rect {
    
    UIImage *image = [UIImage imageNamed:self.imageName];
    //拉伸效果
//    [image drawInRect:rect];

    //在什么范围内（原图大小）
//    [image drawAtPoint:CGPointMake(0, 0)];
//    平铺效果
    [image drawAsPatternInRect:rect];
    
    
    
}

@end
