//
//  UIViewController+YLHelper.m
//  iOSExperience
//
//  Created by Ben Lv on 2018/5/26.
//  Copyright © 2018年 avatar. All rights reserved.
//

#import "UIViewController+YLHelper.h"
#import "objc/runtime.h"
@implementation UIViewController (YLHelper)

+ (UIViewController *)av_getCurrentVC {
    UIWindow *keyWindow  = [UIApplication sharedApplication].keyWindow;
    UIViewController *vc = keyWindow.rootViewController;
    while (vc.presentedViewController)
    {
        vc = vc.presentedViewController;
        
        if ([vc isKindOfClass:[UINavigationController class]])
        {
            vc = [(UINavigationController *)vc visibleViewController];
        }
        else if ([vc isKindOfClass:[UITabBarController class]])
        {
            vc = [(UITabBarController *)vc selectedViewController];
        }
    }
    return vc;
    
    //    UIWindow *window = [[UIApplication sharedApplication].windows firstObject];
    //    if (!window) {
    //        return nil;
    //    }
    //    UIView *tempView;
    //    for (UIView *subview in window.subviews) {
    //        if ([[subview.classForCoder description] isEqualToString:@"UILayoutContainerView"]) {
    //            tempView = subview;
    //            break;
    //        }
    //    }
    //    if (!tempView) {
    //        tempView = [window.subviews lastObject];
    //    }
    //
    //    id nextResponder = [tempView nextResponder];
    //    while (![nextResponder isKindOfClass:[UIViewController class]] || [nextResponder isKindOfClass:[UINavigationController class]] || [nextResponder isKindOfClass:[UITabBarController class]]) {
    //        tempView =  [tempView.subviews firstObject];
    //
    //        if (!tempView) {
    //            return nil;
    //        }
    //        nextResponder = [tempView nextResponder];
    //    }
    //    return  (UIViewController *)nextResponder;
}

- (void)setTag:(NSString *)tag {
    objc_setAssociatedObject(self, @selector(tag), tag, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSString *)tag {
    return objc_getAssociatedObject(self, @selector(tag));
}
@end
