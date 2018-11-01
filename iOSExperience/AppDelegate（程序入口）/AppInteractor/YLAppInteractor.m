//
//  YLAppInteractor.m
//  iOSExperience
//
//  Created by Ben Lv on 2018/10/17.
//  Copyright © 2018年 avatar. All rights reserved.
//

#import "YLAppInteractor.h"

#import "AppDelegate.h"
#import "YLTabBarControllerConfig.h"
#import "YLUserMannger.h"

#import "YLLoginViewController.h"
@interface YLAppInteractor()
{
    UINavigationController *_loginNavCtr;
    YLTabBarControllerConfig *_tabBarCtr;
}

@end

@implementation YLAppInteractor
- (void)startUIFlow {
    if ([[YLUserMannger shareInstance] getCurrentUserModel]) {
        [self startLogin];
    }else {
        [self startLogin];
    }
    
}

- (void)startMain {
    if (_loginNavCtr) {
        _loginNavCtr = nil;
    }
    
    _tabBarCtr = [[YLTabBarControllerConfig alloc] init];
    CATransition *anima = [CATransition animation];
    anima.type = @"cube";//设置动画的类型
    anima.subtype = kCATransitionFromRight; //设置动画的方向
    anima.duration = 0.3f;
    self.keyWindow.rootViewController = _tabBarCtr.tabBarController;
    [self.keyWindow.layer addAnimation:anima forKey:@"keyWindow"];
    
    
}

- (void)startLogin {
    [[YLUserMannger shareInstance] setLoginedCurrentUser:nil];
    if (!_loginNavCtr) {
        YLLoginViewController *loginCtr = [[YLLoginViewController alloc] init];
        _loginNavCtr = [[UINavigationController alloc] initWithRootViewController:loginCtr];
    }
    self.keyWindow.rootViewController = _loginNavCtr;
}

- (void)destructorTabbar {
    _tabBarCtr = nil;
    
}
@end
