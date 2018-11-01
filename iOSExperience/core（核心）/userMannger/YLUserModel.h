//
//  YLUserModel.h
//  iOSExperience
//
//  Created by Ben Lv on 2018/10/16.
//  Copyright © 2018年 avatar. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface YLUserModel : NSObject
@property(nonatomic,strong)NSString *name;
@property(nonatomic,strong)NSString *userId;
@property(nonatomic,strong)NSString *mail;

- (NSData *)encodeToDBData;

+ (YLUserModel *)decodeFromDic:(id)dic;
@end

NS_ASSUME_NONNULL_END
