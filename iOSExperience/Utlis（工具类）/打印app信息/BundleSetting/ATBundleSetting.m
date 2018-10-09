//
//  ATBundleSetting.m
//  Regulatory
//
//  Created by SimonMiao on 2018/1/14.
//  Copyright © 2018年 Avatar. All rights reserved.
//

#import "ATBundleSetting.h"
//#import "ATUserDefaultsMgr.h"

@implementation ATBundleSetting

+ (ATBundleSetting *)shareInstance {
    static ATBundleSetting *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[ATBundleSetting alloc] init];
    });
    
    return instance;
}

- (NSString *)description {
    NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
    
    //app名称
    NSString *app_Name = [infoDictionary objectForKey:@"CFBundleDisplayName"];
    //bundleName
    NSString *app_bundleName = [infoDictionary objectForKey:@"CFBundleName"];
    NSString *app_bundleIdentifier = [infoDictionary objectForKey:@"CFBundleIdentifier"];
    // app版本
    NSString *app_Version = [infoDictionary objectForKey:@"CFBundleShortVersionString"];
    // app build版本
    NSString *app_build = [infoDictionary objectForKey:@"CFBundleVersion"];
    
    NSString *appInfoStr = [NSString stringWithFormat:
                            @"\n\n\n" \
                            "app_Name:%@\n" \
                            "app_bundleName:%@\n" \
                            "app_bundleIdentifier:%@\n" \
                            "app_Version:%@\n" \
                            "app_build:%@\n" \
                            "\n\n\n",
                            app_Name,
                            app_bundleName,
                            app_bundleIdentifier,
                            app_Version,
                            app_build];
    
    UIDevice *currentDevice = [UIDevice currentDevice];
    
//    NSString *deviceToken = [ATUserDefaultsMgr getRemoteNoticeDeviceToken];
    //系统识别码
    NSString* device_UUID = [currentDevice identifierForVendor].UUIDString;
    //手机别名： 用户定义的名称
    NSString* device_name = [currentDevice name];
    //设备运行的系统
    NSString* device_systemName = [currentDevice systemName];
    //手机系统版本
    NSString* device_systemVersion = [currentDevice systemVersion];
    //手机型号
    NSString* device_model = [currentDevice model];
    //设备本地化版本  （国际化区域名称）
    NSString* device_localizedModel = [currentDevice localizedModel];
    
    NSString *deviceInfoStr = [NSString stringWithFormat:
                               @"\n\n\n" \
                               "deviceToken:%@\n" \
                               "device_UUID:%@\n" \
                               "device_name:%@\n" \
                               "device_systemName:%@\n" \
                               "device_systemVersion:%@\n" \
                               "device_model:%@\n" \
                               "device_localizedModel:%@\n" \
                               "\n\n\n",
//                               deviceToken,
                               device_UUID,
                               device_name,
                               device_systemName,
                               device_systemVersion,
                               device_model,
                               device_localizedModel];
    
    NSString *formartText = [NSString stringWithFormat:@"%@ %@",appInfoStr,deviceInfoStr];
    return formartText;
}

@end
