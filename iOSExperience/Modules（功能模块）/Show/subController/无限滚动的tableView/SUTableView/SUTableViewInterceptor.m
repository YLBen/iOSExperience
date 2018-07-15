//
//  SUTableViewInterceptor.m
//  ZHIBO
//
//  Created by 万众科技 on 16/7/28.
//  Copyright © 2016年 WanZhong. All rights reserved.
//

#import "SUTableViewInterceptor.h"

@implementation SUTableViewInterceptor

#pragma mark - forward & response override
- (id)forwardingTargetForSelector:(SEL)aSelector {
//    判断某个方法实现，那么就去调用
    if ([self.middleMan respondsToSelector:aSelector]) return self.middleMan;
    if ([self.receiver respondsToSelector:aSelector]) return self.receiver;
//    否者从其父类中 寻找返回自身
    return [super forwardingTargetForSelector:aSelector];
}

- (BOOL)respondsToSelector:(SEL)aSelector {
    if ([self.middleMan respondsToSelector:aSelector]) return YES;
    if ([self.receiver respondsToSelector:aSelector]) return YES;
    return [super respondsToSelector:aSelector];
}


@end
