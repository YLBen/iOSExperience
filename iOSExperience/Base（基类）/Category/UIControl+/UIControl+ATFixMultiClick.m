//
//  UIControl+ATFixMultiClick.m
//  ESCenter
//
//  Created by SimonMiao on 2018/6/25.
//  Copyright © 2018年 avatar. All rights reserved.
//

#import "UIControl+ATFixMultiClick.h"
#import <objc/runtime.h>

@interface UIControl ()

@property (nonatomic, assign) NSTimeInterval at_acceptEventTime;

@end

@implementation UIControl (ATFixMultiClick)

// 因category不能添加属性，只能通过关联对象的方式。
static const char *UIControl_acceptEventInterval = "UIControl_acceptEventInterval";
static const char *UIControl_acceptEventTime = "UIControl_acceptEventTime";

- (NSTimeInterval)at_acceptEventInterval {
    return [objc_getAssociatedObject(self, UIControl_acceptEventInterval) doubleValue];
}

- (void)setAt_acceptEventInterval:(NSTimeInterval)at_acceptEventInterval {
    objc_setAssociatedObject(self, UIControl_acceptEventInterval, @(at_acceptEventInterval), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSTimeInterval)at_acceptEventTime {
    return [objc_getAssociatedObject(self, UIControl_acceptEventTime) doubleValue];
}

- (void)setAt_acceptEventTime:(NSTimeInterval)at_acceptEventTime {
    objc_setAssociatedObject(self, UIControl_acceptEventTime, @(at_acceptEventTime), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

// 在load时执行hook
+ (void)load {
    SEL sysSEL = @selector(sendAction:to:forEvent:);
    Method systemMethod   = class_getInstanceMethod(self, sysSEL);
    
    SEL mySEL = @selector(at_sendAction:to:forEvent:);
    Method myMethod    = class_getInstanceMethod(self, mySEL);
    //    method_exchangeImplementations(before, after);
    
    
    //添加方法进去
    BOOL didAddMethod = class_addMethod(self, sysSEL, method_getImplementation(myMethod), method_getTypeEncoding(myMethod));
    
    //如果方法已经存在了
    if (didAddMethod) {
        class_replaceMethod(self, mySEL, method_getImplementation(systemMethod), method_getTypeEncoding(systemMethod));
    }
    else {
        method_exchangeImplementations(systemMethod, myMethod);
    }
}

- (void)at_sendAction:(SEL)action to:(id)target forEvent:(UIEvent *)event {
    if ([NSDate date].timeIntervalSince1970 - self.at_acceptEventTime < self.at_acceptEventInterval) {
        return;
    }
    
    if (self.at_acceptEventInterval > 0) {
        self.at_acceptEventTime = [NSDate date].timeIntervalSince1970;
    }
    
    [self at_sendAction:action to:target forEvent:event];
}

@end
