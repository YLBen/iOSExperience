//
//  NSData+AES.h
//  EncodeDemo
//
//  Created by Andrew Shen on 15/6/12.
//  Copyright (c) 2015年 Andrew Shen. All rights reserved.
//  Aes加密

#import <Foundation/Foundation.h>

@interface NSData (AES)
// 加密
+ (NSString *)AES256EncryptWithContent:(NSString *)content key:(NSString *)key;

// 解密
+ (NSString *)AES256DecryptWithContent:(NSString *)content key:(NSString *)key;

@end
