//
//  YLAdvancedViewModel.h
//  iOSExperience
//
//  Created by Ben Lv on 2018/10/9.
//  Copyright © 2018年 avatar. All rights reserved.
//

#import "YLBaseViewModel.h"
static NSString *const YLLetfTitle= @"letfTitle";
static NSString *const YLRightTitle= @"rightTitle";
static NSString *const YLIsShowTitle= @"isShow";
static NSString *const YLTag = @"tag";
NS_ASSUME_NONNULL_BEGIN

@interface YLAdvancedViewModel : YLBaseViewModel
+ (NSArray *)getDataSouce;
@end

NS_ASSUME_NONNULL_END
