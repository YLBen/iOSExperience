//
//  AppDelegate.m
//  iOSExperience
//
//  Created by Ben Lv on 2018/5/23.
//  Copyright © 2018年 avatar. All rights reserved.
//

/**
 *      ┌─┐       ┌─┐ + +
 *   ┌──┘ ┴───────┘ ┴──┐++
 *   │                 │
 *   │       ───       │++ + + +
 *   ███████───███████ │+
 *   │                 │+
 *   │       ─┴─       │
 *   │                 │
 *   └───┐         ┌───┘
 *       │         │
 *       │         │   + +
 *       │         │
 *       │         └──────────────┐
 *       │                        │
 *       │                        ├─┐
 *       │                        ┌─┘
 *       │                        │
 *       └─┐  ┐  ┌───────┬──┐  ┌──┘  + + + +
 *         │ ─┤ ─┤       │ ─┤ ─┤
 *         └──┴──┘       └──┴──┘  + + + +
 *                神兽保佑
 *               代码无BUG!
 */

#import "AppDelegate.h"
#import "YLTabBarControllerConfig.h"
#import <UIView+YYAdd.h>
#import <Bugly/Bugly.h>

#import "AppDelegate+AppService.h"
#import "AppDelegate+PushService.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    //接入腾讯bugly
    [Bugly startWithAppId:@"89f9662ded"];
    
//    注册本地通知
    [self RegisteredNotification];
    NSLog(@"%@",[NSHomeDirectory() stringByAppendingFormat:@"/tmp"]);
    [self initWindow];
//    广告页
    [self appStart];
//    设置应用角标
    [self showAppCount];
//    网络状态监听
    [self networkStatusChangeAFN];
    
    return YES;
}



+ (AppDelegate *)shareAppDelegate{
    return (AppDelegate *)[[UIApplication sharedApplication] delegate];
}
- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
   
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}




@end
