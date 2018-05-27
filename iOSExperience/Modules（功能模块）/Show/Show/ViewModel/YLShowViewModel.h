//
//  YLShowViewModel.h
//  iOSExperience
//
//  Created by Ben Lv on 2018/5/27.
//  Copyright © 2018年 avatar. All rights reserved.
//

#import "YLBaseViewModel.h"
static NSString *const YLLetfTitle= @"letfTitle";
static NSString *const YLRightTitle= @"rightTitle";
static NSString *const YLIsShowTitle= @"isShow";
static NSString *const YLTag = @"tag";
@interface YLShowViewModel : YLBaseViewModel
+ (NSArray *)getDataSouce;
@end
