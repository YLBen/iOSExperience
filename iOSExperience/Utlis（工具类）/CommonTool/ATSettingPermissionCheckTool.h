//
//  ATSettingPermissionCheckTool.h
//  CPPCC_iOS
//
//  Created by SimonMiao on 2017/11/3.
//  Copyright © 2017年 Avatar. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ATSettingPermissionCheckTool : NSObject

/**
 * 跳转到app权限设置界面
 */
+ (void)at_showAlertAndjumpToSettingPageWithTitle:(NSString *)title message:(NSString *)message currentCtr:(UIViewController *)currentCtr;

@end
