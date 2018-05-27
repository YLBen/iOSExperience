//
//  YLShowListCellModel.h
//  iOSExperience
//
//  Created by Ben Lv on 2018/5/27.
//  Copyright © 2018年 avatar. All rights reserved.
//

#import "YLBaseModel.h"

@interface YLShowListCellModel : YLBaseModel
@property(nonatomic,strong)NSString *letfTitle;
@property(nonatomic,strong)NSString *rightTitle;
@property(nonatomic,strong) NSNumber *isShow;
@property(nonatomic,strong)NSString *tag;
+ (NSArray<YLBaseModel *> *)decodeFromDicArray:(NSArray *)dicArray;
@end
