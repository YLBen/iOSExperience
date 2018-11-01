//
//  YLLoginInfoModel.h
//  iOSExperience
//
//  Created by Ben Lv on 2018/10/16.
//  Copyright © 2018年 avatar. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface YLLoginInfoModel : NSObject

@property (nonatomic, copy) NSString *account;
@property (nonatomic, copy) NSString *pwd;

@property (nonatomic, copy) NSString *loginAction;//!<登录回调到控制器方法名
@property (nonatomic, copy) NSString *forgetPwdAction;//!<忘记密码回调到控制器方法名
@property (nonatomic, copy) NSString *registerAction;//!<注册回调到控制器方法名

@end

NS_ASSUME_NONNULL_END
