//
//  YLScratchableLatexModel.m
//  iOSExperience
//
//  Created by Ben Lv on 2018/6/5.
//  Copyright © 2018年 avatar. All rights reserved.
//

#import "YLScratchableLatexModel.h"

@implementation YLScratchableLatexModel
+ (NSArray<YLBaseModel *> *)decodeFromDicArray:(NSArray *)dicArray {
    NSArray *modelArray = [YLScratchableLatexModel mj_objectArrayWithKeyValuesArray:dicArray];
    return modelArray;
}
@end
