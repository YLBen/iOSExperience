//
//  YLAdvancedViewModel.m
//  iOSExperience
//
//  Created by Ben Lv on 2018/10/9.
//  Copyright © 2018年 avatar. All rights reserved.
//

#import "YLAdvancedViewModel.h"

#import "YLShowListCellModel.h"
@implementation YLAdvancedViewModel
+ (NSArray *)getDataSouce {
    
    NSArray *dicArr = [self ProduceDicArr];
    NSArray *dataArray = [YLShowListCellModel decodeFromDicArray:dicArr];
    return dataArray;
}

+ (NSArray *)ProduceDicArr {
    NSArray *dicArr = @[

                        @{
                            YLLetfTitle : @"可折叠的Cell",
                            YLIsShowTitle : @(1),
                            YLTag : @"0"
                            },


                        @{
                            YLLetfTitle : @"球型立体滚动标签",
                            YLIsShowTitle : @(1),
                            YLTag : @"1"
                            },
                        @{
                            YLLetfTitle : @"仿今日头条滚动列表",
                            YLIsShowTitle : @(1),
                            YLTag : @"2"
                            },
                        @{
                            YLLetfTitle : @"cell的折叠和展开",
                            YLIsShowTitle : @(1),
                            YLTag : @"3"
                            },
                        @{
                            YLLetfTitle : @"无限滚动的tableView",
                            YLIsShowTitle : @(1),
                            YLTag : @"4"
                            },
                        @{
                            YLLetfTitle : @"网络文件下载",
                            YLIsShowTitle : @(1),
                            YLRightTitle : @"断点续传",
                            YLTag : @"5"
                            },

                        @{
                            YLLetfTitle : @"tableView二级联动",
                            //                            YLRightTitle : @" Quartz2D",
                            YLIsShowTitle : @(1),
                            YLTag : @"6"
                            },
                        @{
                            YLLetfTitle : @"仿微信actionSheet",
                            //                            YLRightTitle : @" Quartz2D",
                            YLIsShowTitle : @(1),
                            YLTag : @"7"
                            },
                        @{
                            YLLetfTitle : @"动态矢量库",
                            //                            YLRightTitle : @"lottie-ios",
                            YLIsShowTitle : @(1),
                            YLTag : @"8"
                            },
                        @{
                            YLLetfTitle : @"特效输入",
                            //                            YLRightTitle : @"lottie-ios",
                            YLIsShowTitle : @(1),
                            YLTag : @"9"
                            },
                        @{
                            YLLetfTitle : @"模拟下载进度过场动画",
                            //                            YLRightTitle : @"lottie-ios",
                            YLIsShowTitle : @(1),
                            YLTag : @"10"
                            },

                        @{
                            YLLetfTitle : @"自定义控制器转场动画",
                            //                            YLRightTitle : @"lottie-ios",
                            YLIsShowTitle : @(1),
                            YLTag : @"11"
                            },
                        
                        @{
                            YLLetfTitle : @"多图上传",
                            //                            YLRightTitle : @"lottie-ios",
                            YLIsShowTitle : @(1),
                            YLTag : @"12"
                            },
                        @{
                            YLLetfTitle : @"裁剪图片",
                            //                            YLRightTitle : @"lottie-ios",
                            YLIsShowTitle : @(1),
                            YLTag : @"13"
                            },
                        
                        ];
    
    return dicArr;
}
@end
