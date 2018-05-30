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
                            }
                        
                        
                        ];
    
    return dicArr;
}

@end
