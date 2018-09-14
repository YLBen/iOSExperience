//
//  YLSettingModel.h
//  iOSExperience
//
//  Created by Ben Lv on 2018/9/13.
//  Copyright © 2018年 avatar. All rights reserved.
//

#import "YLBaseModel.h"

@interface YLSettingModel : YLBaseModel
@property(nonatomic,strong)NSString *title;
@property(nonatomic,strong)NSString *detail;
@property(nonatomic,strong)NSNumber *isShow;

+ (YLSettingModel *)decodeFromDic:(id)dic;
@end
