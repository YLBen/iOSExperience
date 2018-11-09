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

#import <UserNotifications/UserNotifications.h>
#import <UMCommon/UMCommon.h>
#import <UMPush/UMessage.h>
@interface AppDelegate ()<UNUserNotificationCenterDelegate>

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
    [self RegisterForRemote];

    
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
#pragma mark - UNUserNotificationCenterDelegate

- (void)userNotificationCenter:(UNUserNotificationCenter *)center willPresentNotification:(UNNotification *)notification withCompletionHandler:(void (^)(UNNotificationPresentationOptions options))completionHandler{
    NSLog(@"%s", __func__);
}

- (void)userNotificationCenter:(UNUserNotificationCenter *)center didReceiveNotificationResponse:(UNNotificationResponse *)response withCompletionHandler:(void(^)(void))completionHandler{
    NSLog(@"%s", __func__);
}



- (void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken {
    //保存deviceToken
    NSString *token = [[deviceToken description] stringByTrimmingCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:@"<>"]];
    token = [token stringByReplacingOccurrencesOfString:@" " withString:@""];
    YLLog(@"\n>>>[DeviceToken Success]:%@\n\n", token);
    
}

-(void) application:(UIApplication *)application didFailToRegisterForRemoteNotificationsWithError:(NSError *)error
{
    YLLog(@"%s\n[无法注册远程提醒, 错误信息]\nline:%@\n-----\n%@\n\n", __func__, @(__LINE__), error);
    YLLog(@"%s\n[无法注册远程提醒, 错误信息]\nline:%@\n-----\n%@\n\n", __func__, @(__LINE__), error);
}



- (void)RegisterForRemote {
   
    
    // 消息推送注册
    if (@available(iOS 10.0, *))
    {
        UNUserNotificationCenter *center =  [UNUserNotificationCenter currentNotificationCenter];
        [center requestAuthorizationWithOptions:(UNAuthorizationOptionAlert | UNAuthorizationOptionBadge | UNAuthorizationOptionSound)  completionHandler:^(BOOL granted, NSError * _Nullable error) {
            if (granted) {
                [center getNotificationSettingsWithCompletionHandler:^(UNNotificationSettings * _Nonnull settings) {
                    dispatch_async(dispatch_get_main_queue(), ^{
                        [[UIApplication sharedApplication] registerForRemoteNotifications];
                        YLLog(@"注册远程通知");
                    });
                }];
            } else {
                //点击不允许
                //                NSLog(@"注册通知失败");
                YLLog(@"注册通知失败");
            }
        }];
    }
    else if(@available(iOS 8.0, *))
    {
        
        [[UIApplication sharedApplication] registerUserNotificationSettings:[UIUserNotificationSettings
                                                                             
                                                                             settingsForTypes:(UIUserNotificationTypeSound|UIUserNotificationTypeAlert|UIUserNotificationTypeBadge)
                                                                             
                                                                             categories:nil]];
        
    }
    else {//8.0以下版本
        //注册启用push
        [[UIApplication sharedApplication] registerForRemoteNotificationTypes:UIRemoteNotificationTypeSound|UIRemoteNotificationTypeAlert|UIRemoteNotificationTypeBadge];
        
    }
    [[UIApplication sharedApplication] registerForRemoteNotifications];

    
}


/* Required for iOS 7+
 */
- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo {
    //TODO:处理远程推送内容
    NSString *str = [NSString stringWithFormat:@"%ld",(long)application.applicationState];
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:str message:@"" delegate:self cancelButtonTitle:@"" otherButtonTitles:nil];
    [alert show];
//    DDLogInfo(@"-------------->%@,%s,%d",NSStringFromClass(self.class),__FUNCTION__,__LINE__);
//    DDLogInfo(@"%@", userInfo);
    //[[UIApplication sharedApplication] setApplicationIconBadgeNumber:0];
}

/** iOS10以下收到通知处理
 */
- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo fetchCompletionHandler:(nonnull void (^)(UIBackgroundFetchResult))completionHandler {
    //TODO:处理远程推送内容
    YLLog(@"-------------->%@,%s,%d",NSStringFromClass(self.class),__FUNCTION__,__LINE__);
//    DDLogInfo(@"%@", userInfo);
    
    if (application.applicationState == UIApplicationStateActive) {
        //应用程序在前台
        //        [self createAlertViewControllerWithPushDict:userInfo];
        YLLog(@"应用在前台");
    }
    else {
        //其他两种情况，一种在后台程序没有被杀死，另一种是在程序已经杀死。用户点击推送的消息进入app的情况处理。
        //        [self handlePushMessage:userInfo];
        YLLog(@"应用在后台");
    }
    //[[UIApplication sharedApplication] setApplicationIconBadgeNumber:0];
    // Must be called when finished
    completionHandler(UIBackgroundFetchResultNewData);
}


@end
