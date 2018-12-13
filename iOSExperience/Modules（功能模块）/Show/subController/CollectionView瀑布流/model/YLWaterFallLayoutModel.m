//
//  YLWaterFallLayoutModel.m
//  iOSExperience
//
//  Created by Ben Lv on 2018/12/12.
//  Copyright © 2018年 avatar. All rights reserved.
//

#import "YLWaterFallLayoutModel.h"

@implementation YLWaterFallLayoutModel
+ (NSArray <YLWaterFallLayoutModel *> *)decodeFromArray:(id)array {
    NSArray *dataSourceArr = [YLWaterFallLayoutModel mj_objectArrayWithKeyValuesArray:array];
    return dataSourceArr;
    
}
@end
