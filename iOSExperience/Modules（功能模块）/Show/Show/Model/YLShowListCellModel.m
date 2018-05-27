//
//  YLShowListCellModel.m
//  iOSExperience
//
//  Created by Ben Lv on 2018/5/27.
//  Copyright © 2018年 avatar. All rights reserved.
//

#import "YLShowListCellModel.h"

@implementation YLShowListCellModel
+ (NSArray<YLBaseModel *> *)decodeFromDicArray:(NSArray *)dicArray {
    
    NSArray *modelArray = [YLShowListCellModel mj_objectArrayWithKeyValuesArray:dicArray];
    return modelArray;
}
@end
