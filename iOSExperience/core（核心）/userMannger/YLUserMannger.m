//
//  YLUserMannger.m
//  iOSExperience
//
//  Created by Ben Lv on 2018/10/16.
//  Copyright © 2018年 avatar. All rights reserved.
//

#import "YLUserMannger.h"


#define USER_DEFAULT [NSUserDefaults standardUserDefaults]
//用于存储自己的登录注册信息
static NSString *const kUserDefaultKey_currUserJson = @"userDefaultKeyCurrUserJson";

@interface YLUserMannger()
@property(nonatomic,strong)YLUserModel *userModel;


@end
@implementation YLUserMannger
+ (YLUserMannger *)shareInstance {
    static YLUserMannger *s_ins = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        s_ins = [YLUserMannger new];
    });
    return s_ins;
}

#pragma mark - private methods

- (void)setLoginedCurrentUser:(YLUserModel *)userModel {
    if (userModel) {
        _userModel = userModel;
        NSData *userData = [userModel encodeToDBData];
        [self setCurrentUserJson:userData];
    }
    else {
        [self removeCurrentUserJson];
        self.userModel = nil;
    }
    
}
- (YLUserModel *)getCurrentUserModel {
    if (self.userModel) {
        return self.userModel;
    }
    NSData *userData =  [self getCurrentUserJson];
    if (0 == userData.length) {
        return nil;
    }
    NSDictionary *jsonDic = [NSJSONSerialization JSONObjectWithData:userData options:0 error:nil];
    YLUserModel *usreModel = [YLUserModel decodeFromDic:jsonDic];
    return usreModel;
    
}


#pragma mark - private methods


- (void)setCurrentUserJson:(NSData *)jsonData {
    [USER_DEFAULT setObject:jsonData forKey:kUserDefaultKey_currUserJson];
    [USER_DEFAULT synchronize];
}
- (NSData *)getCurrentUserJson {
    NSData *userJson = [USER_DEFAULT objectForKey:kUserDefaultKey_currUserJson];
    return userJson;
}
- (void)removeCurrentUserJson {
    [USER_DEFAULT removeObjectForKey:kUserDefaultKey_currUserJson];
}
@end
