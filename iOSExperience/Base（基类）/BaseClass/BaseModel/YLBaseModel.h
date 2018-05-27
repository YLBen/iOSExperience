//
//  YLBaseModel.h
//  iOSExperience
//
//  Created by Ben Lv on 2018/5/27.
//  Copyright © 2018年 avatar. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MJExtension/MJExtension.h>
@interface YLBaseModel : NSObject

+ (YLBaseModel *)decodeFromDic:(NSDictionary *)dic;

+ (NSArray <YLBaseModel *>*)decodeFromDicArray:(NSArray *)dicArray;

@end
