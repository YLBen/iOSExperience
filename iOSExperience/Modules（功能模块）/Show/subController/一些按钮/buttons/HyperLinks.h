//
//  HyperLinks.h
//  超文本链接
//
//  Created by Ben Lv on 2018/7/12.
//  Copyright © 2018年 avatar. All rights reserved.
//  btton 带下划线  实现超链接

#import <UIKit/UIKit.h>

@interface HyperLinks : UIButton
{
    UIColor *lineColor;  //颜色对象
    BOOL isHighlight;    //实例变量
    
}

+ (HyperLinks *)hyperlinksButton;
@end
