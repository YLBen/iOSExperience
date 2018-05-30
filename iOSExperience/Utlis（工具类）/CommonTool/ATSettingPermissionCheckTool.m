//
//  ATSettingPermissionCheckTool.m
//  CPPCC_iOS
//
//  Created by SimonMiao on 2017/11/3.
//  Copyright © 2017年 Avatar. All rights reserved.
//

#import "ATSettingPermissionCheckTool.h"

@implementation ATSettingPermissionCheckTool

/**
 * title:@"相机权限未开启"
 * message:@"相机权限未开启，请进入系统【设置】>【隐私】>【相机】中打开开关,开启相机功能"
 */
+ (void)at_showAlertAndjumpToSettingPageWithTitle:(NSString *)title message:(NSString *)message currentCtr:(UIViewController *)currentCtr {
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
    UIAlertAction *sureAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:UIApplicationOpenSettingsURLString]]) {
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:UIApplicationOpenSettingsURLString]];
        }
    }];
    [alertController addAction:cancelAction];
    [alertController addAction:sureAction];
    [currentCtr presentViewController:alertController animated:YES completion:nil];
}

@end
