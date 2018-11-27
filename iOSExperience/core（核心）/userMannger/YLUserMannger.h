//
//  YLUserMannger.h
//  iOSExperience
//
//  Created by Ben Lv on 2018/10/16.
//  Copyright © 2018年 avatar. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YLUserModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface YLUserMannger : NSObject
+ (YLUserMannger *)shareInstance;
- (void)setLoginedCurrentUser:(YLUserModel *)userModel;
- (YLUserModel *)getCurrentUserModel;

@end

NS_ASSUME_NONNULL_END
