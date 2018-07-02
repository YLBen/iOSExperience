//
//  YLCommonDefine.h
//  iOSExperience
//
//  Created by Ben Lv on 2018/5/28.
//  Copyright © 2018年 avatar. All rights reserved.
//  一些常用宏

#ifndef YLCommonDefine_h
#define YLCommonDefine_h

//开发宏 0:正式版本 1:开发版本
#ifndef AV_DEV     /*假如没有定义宏 AV_DEV*/
#define AV_DEV 1    /* 定义AV_DEV为1  */
#endif

#ifdef DEBUG // 处于开发阶段
#define YLLog(...) NSLog(__VA_ARGS__)
#else // 处于发布阶段
#define YLLog(...)
#endif

// block 宏

typedef void(^PCParas0Callback)(void);
typedef void(^PCParas1Callback)(id para);
typedef void(^PCParas2Callback)(id para, id para2);
typedef void(^PCParas3Callback)(id para, id para2, id para3);
typedef void(^PCParas4Callback)(id para, id para2, id para3, id para4);

// 弱引用
#define PCWeakSelf __weak typeof(self) weakSelf = self;
#define PC_IS_IPHONE (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
#define PC_IS_IPHONE_X (PC_IS_IPHONE && [[UIScreen mainScreen] bounds].size.height == 812.0f)
// 屏幕宽度
#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
// 屏幕高度
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height
// 系统版本
#define kDeviceVersion [[[UIDevice currentDevice] systemVersion] floatValue]
// app版本
#define kAppVersion [[NSBundle mainBundle] infoDictionary][@"CFBundleShortVersionString"]

#define kScreenWidthRatio  (UIScreen.mainScreen.bounds.size.width / 375.0)
#define kScreenHeightRatio (UIScreen.mainScreen.bounds.size.height / 667.0)
#define AdaptedFontSize(R)     [UIFont systemFontOfSize:AdaptedWidth(R)]
#define AdaptedWidth(x)  ceilf((x) * kScreenWidthRatio)
#define AdaptedHeight(x) ceilf((x) * kScreenHeightRatio)

#define kStatusBarHeight [[UIApplication sharedApplication] statusBarFrame].size.height
#define kNavBarHeight 44.0
#define kTabBarHeight ([[UIApplication sharedApplication] statusBarFrame].size.height>20?83:49)
#define kTopHeight (kStatusBarHeight + kNavBarHeight)

#define kUserDefaults       [NSUserDefaults standardUserDefaults]

#define ViewRadius(View, Radius)\
\
[View.layer setCornerRadius:(Radius)];\
[View.layer setMasksToBounds:YES]
#endif /* YLCommonDefine_h */
