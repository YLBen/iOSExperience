//
//  NSDate+ATHelper.h
//  Regulatory
//
//  Created by SimonMiao on 2018/2/9.
//  Copyright © 2018年 Avatar. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (ATHelper)


/**
 获取格式化时间

 @param timestamp 时间戳
 @param formart 例如：yyyy/MM/dd HH:mm
 @return 时间字符串
 */
+ (NSString *)at_formartTimeStrWithTimestamp:(NSNumber *)timestamp formart:(NSString *)formart;

/** 获取显示的时间字符串
 * timestamp:传入时间戳 NSNumber
 */
+ (NSString *)at_formartTimeStrWithTimestamp:(NSNumber *)timestamp;

/**
 获取日期字符串

 @param timestamp 传入时间戳 NSNumber
 @return 日程字符串
 */
+ (NSString *)at_formartDateStrWithTimestamp:(NSNumber *)timestamp;

/** 获取申请格式化时间
 * timestamp:传入时间戳 NSNumber
 * isAllDay:是否是全天
 */
+ (NSString *)at_applyFormartTimeStrWithTimestamp:(NSNumber *)timestamp isAllDay:(BOOL)isAllDay;


/**
 获取日程格式化时间

 @param startTime 开始时间
 @param endTime 结束时间
 @param isAllDay 是否是全天
 @return 格式化时间段
 */
+ (NSString *)at_scheduleFormartTimeStrWithStartTime:(NSNumber *)startTime
                                             endTime:(NSNumber *)endTime
                                            isAllDay:(BOOL)isAllDay;

/**
 获取日程格式化时间

 @param startDate NSDate对象
 @param endDate NSDate对象
 @param isAllDay 是否是全天
 @return 格式化时间段
 */
+ (NSString *)at_scheduleFormartTimeStrWithStartDate:(NSDate *)startDate
                                             endDate:(NSDate *)endDate
                                            isAllDay:(BOOL)isAllDay;

/** 获取网络时间 */
+ (NSDate *)at_getInternetDate;

/** NSDate转时间戳*/
+ (long long)getDateTimeTOMilliSeconds:(NSDate *)datetime;
/*和当前时间做比较*/
+(NSComparisonResult)at_compareCurrentDateWithTimestamp:(NSNumber *)timestamp;







@end
