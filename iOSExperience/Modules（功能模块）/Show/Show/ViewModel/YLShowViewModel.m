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
                        @{
                            YLLetfTitle : @"可折叠的Cell",
                            YLIsShowTitle : @(1),
                            YLTag : @"3"
                            },
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
                        @{
                            YLLetfTitle : @"球型立体滚动标签",
                            YLIsShowTitle : @(1),
                            YLTag : @"10"
                            },
                        @{
                            YLLetfTitle : @"仿今日头条滚动列表",
                            YLIsShowTitle : @(1),
                            YLTag : @"11"
                            },
                        @{
                            YLLetfTitle : @"cell的折叠和展开",
                            YLIsShowTitle : @(1),
                            YLTag : @"12"
                            },
                        ];
    
    return dicArr;
}

@end
