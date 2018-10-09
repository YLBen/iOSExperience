//
//  ATCommonProcessTool.h
//  launcher 下城1call
//
//  Created by SimonMiao on 2017/10/9.
//  Copyright © 2017年 Avatar. All rights reserved.
//

#import <Foundation/Foundation.h>

//@class ContactPersonDetailInformationModel;

//typedef NS_ENUM(NSUInteger, ATFileType) {
//    ATFileType_img = 0,
//    ATFileType_Officexlsandxlsx = 1,
//    ATFileType_officedocanddocx = 2,
//    ATFileType_officepptandpptx = 3,
//    ATFileType_html = 4,
//    ATFileType_pdf = 5,
//    ATFileType_txt = 6,
//
//    ATFileType_rar = 7,
//    ATFileType_word = 6,
//    ATFileType_wps = 6,
//    ATFileType_xml = 6,
//    ATFileType_unknown = 6,
//};

@interface ATCommonProcessTool : NSObject

/**
 *  @"●" 格式转化成 @"、"的字符串
 */
+ (NSString *)at_getDisplayStrByReplacingWithFormartStr:(NSString *)formartStr;
/**
 *  @"、" 格式转化成 @"●"的字符串
 */
+ (NSString *)at_getFormartStrByReplacingWithDisplayStr:(NSString *)displayStr;

/**
 *  数组转化成 @"、"的字符串
 */
+ (NSString *)at_getDisplayStrByJoinWithArr:(NSArray *)arr;

/** 添加审批路径格式化字符串
 *  数组转化成 @"->"的字符串
 */
+ (NSString *)at_getApprovePathDisplayStrByJoinWithArr:(NSArray *)arr;

/**
 *  数组转化成 @"●"的字符串
 */
+ (NSString *)at_getFormartStrByJoinWithArr:(NSArray *)arr;

/** @"●"格式化字符串分离成为数组
 */
+ (NSArray *)at_getSeparateArrWithFormartStr:(NSString *)formartStr;

/** 数字星期转化成中文星期 如：日、一、二、三... */
+ (NSString *)at_getChineseWeekWithWeekday:(NSInteger)weekday;
/**
 * 获取@"●"格式化数组123●456●789
 * @[showId,name]
 */
//+ (NSArray *)at_getFormartStrArrWithSelectUserArr:(NSArray <ContactPersonDetailInformationModel *>*)userArr;

/**
 * 计算缓存或者文件大小
 */
+ (NSString *)getCacheSizeWithSize:(NSUInteger)cacheSize;
/**
 * 获取文件类型图片名
 */
+ (NSString *)at_getFileIconPathWithFileName:(NSString *)fileName;
        
/** 获取指定的loginName
 * 判断顺序 loginName -> 邮箱 -> 手机号
 */
+ (NSString *)at_getSpecifiedLoginNameFromLoginInfo;

@end
