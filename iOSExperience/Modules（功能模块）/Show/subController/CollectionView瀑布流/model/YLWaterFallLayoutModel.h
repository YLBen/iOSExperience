//
//  YLWaterFallLayoutModel.h
//  iOSExperience
//
//  Created by Ben Lv on 2018/12/12.
//  Copyright © 2018年 avatar. All rights reserved.
//

#import "YLBaseModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface YLWaterFallLayoutModel : YLBaseModel
@property(nonatomic,strong)NSString *imageUrl;
@property(nonatomic,strong)NSString *width;
@property(nonatomic,strong)NSString *height;

+ (NSArray <YLWaterFallLayoutModel *> *)decodeFromArray:(id)array;
@end

NS_ASSUME_NONNULL_END
