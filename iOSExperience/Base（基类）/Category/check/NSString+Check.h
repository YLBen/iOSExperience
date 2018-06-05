//
//  NSString+Check.h
//  launcher
//
//  Created by Dee on 16/11/16.
//  Copyright © 2016年 William Zhang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Check)

/*手机号*/
+ (BOOL)isMobileNumber:(NSString *)mobileNum;
/*浮点数*/
+ (BOOL)isFloatNumber:(NSString *)numberString;
/*正整数*/
+ (BOOL)isPositiveNum:(NSString *)numberString;
/*邮箱*/
+ (BOOL)validateEmail:(NSString *)email;
/*身份证*/
+ (BOOL)validateIdentityCard: (NSString *)identityCard;

@end
