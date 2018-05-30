//
//  AVExportContectsTool.m
//  CPPCC_iOS
//
//  Created by SimonMiao on 2017/6/30.
//  Copyright © 2017年 Avatar. All rights reserved.
//

#import "AVExportContectsTool.h"
#import <AddressBook/AddressBook.h>
//#import <AddressBookUI/AddressBookUI.h>

@implementation AVExportContectsTool

+ (BOOL)av_exportToPhoneWithFirstName:(NSString *)firstName
                           department:(NSString *)department
                               mobile:(NSString *)mobile
                            telephone:(NSString *)telephone
                              u_email:(NSString *)u_email
{
    // 读取通讯录
    ABAddressBookRef addressBook = ABAddressBookCreateWithOptions(NULL, NULL);
    
    ABRecordRef newPerson = ABPersonCreate();
    CFErrorRef error = NULL;
    // 写入名字
    ABRecordSetValue(newPerson, kABPersonFirstNameProperty, (__bridge CFStringRef)firstName, &error);
    // 部门
    ABRecordSetValue(newPerson, kABPersonDepartmentProperty, (__bridge CFStringRef)department, &error);
    
    // 手机
    ABMultiValueRef phone = ABMultiValueCreateMutable(kABPersonPhoneProperty);
    ABMultiValueAddValueAndLabel(phone, (__bridge CFStringRef)mobile, kABPersonPhoneMobileLabel, NULL);
    
    // 固定电话
    ABMultiValueAddValueAndLabel(phone, (__bridge CFStringRef)(telephone), (__bridge CFStringRef)@"固定电话", NULL);
    
    //邮箱
    ABMultiValueRef email = ABMultiValueCreateMutable(kABPersonEmailProperty);
    ABMultiValueAddValueAndLabel(email, (__bridge CFStringRef)(u_email), (__bridge CFStringRef)@"电子邮箱", NULL);
    
    
    ABRecordSetValue(newPerson, kABPersonPhoneProperty, phone, &error);
    ABRecordSetValue(newPerson, kABPersonEmailProperty, email, &error);
    // 请求通讯录
    if ([[UIDevice currentDevice].systemVersion floatValue] >= 6.0)
    {
        //等待同意后向下执行
        dispatch_semaphore_t sema = dispatch_semaphore_create(0);
        ABAddressBookRequestAccessWithCompletion(addressBook, ^(bool granted, CFErrorRef error){
            dispatch_semaphore_signal(sema);
        });
        dispatch_semaphore_wait(sema, DISPATCH_TIME_FOREVER);
    }
    
    // 写入通讯录
    BOOL sucess =  ABAddressBookAddRecord(addressBook, newPerson, &error);
    if (sucess)
    {
        sucess = ABAddressBookSave(addressBook, &error);
    }
    return sucess;
    
//    if (error != NULL)
//    {
//        AVLog(@"写入失败");
//    }
//    // 释放
//    CFRelease(addressBook);
//    CFRelease(phone);
//    CFRelease(email);
//    CFRelease(newPerson);
//    
//    return sucess;
}

@end
