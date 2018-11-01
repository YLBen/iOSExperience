//
//  YLUserModel.m
//  iOSExperience
//
//  Created by Ben Lv on 2018/10/16.
//  Copyright © 2018年 avatar. All rights reserved.
//

#import "YLUserModel.h"
#import <MJExtension.h>
@implementation YLUserModel
- (NSData *)encodeToDBData {
    NSDictionary *dic = self.mj_keyValues; // 模型转字典
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dic options:NSJSONWritingPrettyPrinted error:nil];
    return jsonData;
}

+ (YLUserModel *)decodeFromDic:(id)dic; {
    YLUserModel *userModel = [YLUserModel mj_objectWithKeyValues:dic];
    return userModel;
}
@end
