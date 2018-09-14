//
//  YLSettingModel.m
//  iOSExperience
//
//  Created by Ben Lv on 2018/9/13.
//  Copyright © 2018年 avatar. All rights reserved.
//

#import "YLSettingModel.h"

@implementation YLSettingModel
+ (YLSettingModel *)decodeFromDic:(id)dic {
    YLSettingModel *model = [YLSettingModel mj_objectWithKeyValues:dic];
    return model;
}
@end
