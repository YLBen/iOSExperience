//
//  UITabBar+YLBadge.h
//  iOSExperience
//
//  Created by Ben Lv on 2018/5/26.
//  Copyright © 2018年 avatar. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITabBar (YLBadge)
- (void)av_showBadgeOnItemIndex:(int)index;   //显示小红点

- (void)av_hideBadgeOnItemIndex:(int)index; //隐藏小红点
@end
