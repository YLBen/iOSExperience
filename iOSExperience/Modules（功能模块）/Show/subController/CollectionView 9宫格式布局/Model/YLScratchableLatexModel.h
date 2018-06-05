//
//  YLScratchableLatexModel.h
//  iOSExperience
//
//  Created by Ben Lv on 2018/6/5.
//  Copyright © 2018年 avatar. All rights reserved.
//

#import "YLBaseModel.h"

@interface YLScratchableLatexModel : YLBaseModel
@property(nonatomic,strong)NSString *image;
@property(nonatomic,strong)NSString *title;

+ (NSArray<YLBaseModel *> *)decodeFromDicArray:(NSArray *)dicArray;
@end
