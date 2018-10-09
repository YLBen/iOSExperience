//
//  NSData+AES.m
//  EncodeDemo
//
//  Created by Andrew Shen on 15/6/12.
//  Copyright (c) 2015年 Andrew Shen. All rights reserved.
//

#import "NSData+AES.h"
#import <CommonCrypto/CommonCryptor.h>

@implementation NSData (AES)
static Byte ivBuff[] = {0xC, 1, 0xB, 3, 0x5B, 0xD, 5, 4, 0xF, 7, 9, 0x17, 1, 0xA, 6, 8};                                  // 加密向量

+ (NSString *)AES256EncryptWithContent:(NSString *)content key:(NSString *)key
{
    //加密
    NSData *plainText = [content dataUsingEncoding:NSUTF8StringEncoding];
    
    char keyPtr[kCCKeySizeAES256+1];
    bzero(keyPtr, sizeof(keyPtr));
    [key getCString:keyPtr maxLength:sizeof(keyPtr) encoding:NSUTF8StringEncoding];
    NSUInteger dataLength = [plainText length];
    size_t bufferSize = dataLength + kCCBlockSizeAES128;
    void *buffer = malloc(bufferSize);
    size_t numBytesEncrypted = 0;
    CCCryptorStatus cryptStatus = CCCrypt(kCCEncrypt, kCCAlgorithmAES128,
                                          kCCOptionPKCS7Padding,
                                          [key UTF8String], kCCBlockSizeAES128,
                                          ivBuff,
                                          [plainText bytes], dataLength,
                                          buffer, bufferSize,
                                          &numBytesEncrypted);
    if (cryptStatus == kCCSuccess) {
        NSData *dateTemp = [NSData dataWithBytesNoCopy:buffer length:numBytesEncrypted];
        return [dateTemp base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength];
    }
    free(buffer);
    return nil;
}


+ (NSString *)AES256DecryptWithContent:(NSString *)content key:(NSString *)key
{
    //解密
    NSData *cipherData = [[NSData alloc] initWithBase64EncodedString:content options:NSDataBase64DecodingIgnoreUnknownCharacters];
    
    char keyPtr[kCCKeySizeAES256+1];
    bzero(keyPtr, sizeof(keyPtr));
    [key getCString:keyPtr maxLength:sizeof(keyPtr) encoding:NSUTF8StringEncoding];
    NSUInteger dataLength = [cipherData length];
    size_t bufferSize = dataLength + kCCBlockSizeAES128;
    void *buffer = malloc(bufferSize);
    size_t numBytesDecrypted = 0;
    CCCryptorStatus cryptStatus = CCCrypt(kCCDecrypt, kCCAlgorithmAES128,
                                          kCCOptionPKCS7Padding,
                                          [key UTF8String], kCCBlockSizeAES128,
                                          ivBuff,
                                          [cipherData bytes], dataLength,
                                          buffer, bufferSize,
                                          &numBytesDecrypted);
    if (cryptStatus == kCCSuccess) {
        NSData *dateTemp = [NSData dataWithBytesNoCopy:buffer length:numBytesDecrypted];
        return [[NSString alloc] initWithData:dateTemp encoding:NSUTF8StringEncoding];
    }
    free(buffer);
    return nil;
}

@end
