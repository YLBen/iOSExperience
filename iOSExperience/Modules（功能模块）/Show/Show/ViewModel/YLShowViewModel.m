//
//  YLShowViewModel.m
//  iOSExperience
//
//  Created by Ben Lv on 2018/5/27.
//  Copyright © 2018年 avatar. All rights reserved.
//

#import "YLShowViewModel.h"

#import "YLShowListCellModel.h"


@implementation YLShowViewModel

+ (NSArray *)getDataSouce {
    
    NSArray *dicArr = [self ProduceDicArr];
    NSArray *dataArray = [YLShowListCellModel decodeFromDicArray:dicArr];
    return dataArray;
}



+ (NSArray *)ProduceDicArr {
    NSArray *dicArr = @[
                        @{
                            YLLetfTitle : @"加载网络图片&Gif",
                            YLRightTitle : @"SDWebImage",
//                            YLIsShowTitle : @(1),
                            YLTag : @"0"
                          },
                        
                        @{
                            YLLetfTitle : @"拍照与相册图片上传",
//                            YLRightTitle : @"SDWebImage",
                              YLIsShowTitle : @(1),
                            YLTag : @"1"
                            },
                        @{
                            YLLetfTitle : @"本地通知",
                            YLIsShowTitle : @(1),
                            YLTag : @"2"
                            },
//                        @{
//                            YLLetfTitle : @"可折叠的Cell",
//                            YLIsShowTitle : @(1),
//                            YLTag : @"3"
//                            },
                        @{
                            YLLetfTitle : @"CollectionView 9宫格式布局",
                            YLIsShowTitle : @(1),
                            YLTag : @"4"
                            },
                        @{
                            YLLetfTitle : @"背景高斯模糊",
                            YLRightTitle : @"右滑返回",
                            YLIsShowTitle : @(0),
                            YLTag : @"5"
                            },
                        @{
                            YLLetfTitle : @"可编辑的tableView",
                            YLIsShowTitle : @(1),
                            YLTag : @"6"
                            },
                        @{
                            YLLetfTitle : @"行高自适应",
                            YLIsShowTitle : @(1),
                            YLTag : @"7"
                            },
                        @{
                            YLLetfTitle : @"时间选择器",
                            YLRightTitle : @"datePicker",
                            YLIsShowTitle : @(0),
                            YLTag : @"8"
                            },
                        @{
                            YLLetfTitle : @"加载网页",
                            YLRightTitle : @"带进度条",
                            YLIsShowTitle : @(0),
                            YLTag : @"9"
                            },
//                        @{
//                            YLLetfTitle : @"球型立体滚动标签",
//                            YLIsShowTitle : @(1),
//                            YLTag : @"10"
//                            },
//                        @{
//                            YLLetfTitle : @"仿今日头条滚动列表",
//                            YLIsShowTitle : @(1),
//                            YLTag : @"11"
//                            },
//                        @{
//                            YLLetfTitle : @"cell的折叠和展开",
//                            YLIsShowTitle : @(1),
//                            YLTag : @"12"
//                            },
//                        @{
//                            YLLetfTitle : @"无限滚动的tableView",
//                            YLIsShowTitle : @(1),
//                            YLTag : @"13"
//                            },
//                        @{
//                            YLLetfTitle : @"网络文件下载",
//                            YLIsShowTitle : @(1),
//                            YLRightTitle : @"断点续传",
//                            YLTag : @"14"
//                            },
                        @{
                            YLLetfTitle : @"一些按钮",
                            YLIsShowTitle : @(1),
//                            YLRightTitle : @"",
                            YLTag : @"15"
                            },
                        @{
                            YLLetfTitle : @"简单下载进度条",
                            YLRightTitle : @" Quartz2D",
                             YLIsShowTitle : @(0),
                            YLTag : @"16"
                            },
                        @{
                            YLLetfTitle : @"饼状图",
                            YLRightTitle : @" Quartz2D",
                            YLIsShowTitle : @(0),
                            YLTag : @"17"
                            },
                        @{
                            YLLetfTitle : @"柱状图",
                            YLRightTitle : @" Quartz2D",
                            YLIsShowTitle : @(0),
                            YLTag : @"18"
                            },
                        @{
                            YLLetfTitle : @"图片平铺",
                            YLRightTitle : @" Quartz2D",
                            YLIsShowTitle : @(0),
                            YLTag : @"19"
                            },
//                        @{
//                            YLLetfTitle : @"tableView二级联动",
////                            YLRightTitle : @" Quartz2D",
//                            YLIsShowTitle : @(1),
//                            YLTag : @"20"
//                            },
//                        @{
//                            YLLetfTitle : @"仿微信actionSheet",
//                            //                            YLRightTitle : @" Quartz2D",
//                            YLIsShowTitle : @(1),
//                            YLTag : @"21"
//                            },
//                        @{
//                            YLLetfTitle : @"动态矢量库",
////                            YLRightTitle : @"lottie-ios",
//                            YLIsShowTitle : @(1),
//                            YLTag : @"22"
//                            },
//                        @{
//                            YLLetfTitle : @"特效输入",
////                            YLRightTitle : @"lottie-ios",
//                            YLIsShowTitle : @(1),
//                            YLTag : @"23"
//                            },
//                        @{
//                            YLLetfTitle : @"模拟下载进度过场动画",
//                            //                            YLRightTitle : @"lottie-ios",
//                            YLIsShowTitle : @(1),
//                            YLTag : @"24"
//                            },
                        @{
                            YLLetfTitle : @"label复制.粘贴.剪切",
                            //                            YLRightTitle : @"lottie-ios",
                            YLIsShowTitle : @(1),
                            YLTag : @"25"
                            },
                        @{
                            YLLetfTitle : @"图文环绕",
                            //                            YLRightTitle : @"lottie-ios",
                            YLIsShowTitle : @(1),
                            YLTag : @"26"
                            },
                        @{
                            YLLetfTitle : @"图片轮播器",
                            //                            YLRightTitle : @"lottie-ios",
                            YLIsShowTitle : @(1),
                            YLTag : @"27"
                            },
                        @{
                            YLLetfTitle : @"标准CollectionView",
                            //                            YLRightTitle : @"lottie-ios",
                            YLIsShowTitle : @(1),
                            YLTag : @"28"
                            },
                        @{
                            YLLetfTitle : @"新手引导页",
                            //                            YLRightTitle : @"lottie-ios",
                            YLIsShowTitle : @(1),
                            YLTag : @"29"
                            },
                        @{
                            YLLetfTitle : @"带特效的图片浏览器",
                            YLRightTitle : @"colloectionView",
                            YLIsShowTitle : @(0),
                            YLTag : @"30"
                            },
                        @{
                            YLLetfTitle : @"iOS逆向传值的7种方式",
                            
                            YLIsShowTitle : @(1),
                            YLTag : @"31"
                            },
                        @{
                            YLLetfTitle : @"网址生成二维码",
                            
                            YLIsShowTitle : @(1),
                            YLTag : @"32"
                            },

                        ];
    
    return dicArr;
}

@end
