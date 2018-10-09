//
//  NSDate+ATHelper.m
//  Regulatory
//
//  Created by SimonMiao on 2018/2/9.
//  Copyright © 2018年 Avatar. All rights reserved.
//

#import "NSDate+ATHelper.h"
#import <DateTools/DateTools.h>
#import "ATCommonProcessTool.h"

@implementation NSDate (ATHelper)

+ (NSString *)at_formartTimeStrWithTimestamp:(NSNumber *)timestamp formart:(NSString *)formart {
    if (!timestamp) {
        return @"";
    }
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:timestamp.longLongValue / 1000.0];
    NSString *formartStr = [date formattedDateWithFormat:formart];
    
    return formartStr;
}

+ (NSString *)at_formartTimeStrWithTimestamp:(NSNumber *)timestamp {
    if (!timestamp) {
        return nil;
    }
    
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:timestamp.longLongValue / 1000.0];
    NSString *formartStr;
    if (date.isToday) {
        formartStr = [date formattedDateWithFormat:@"今天 HH:mm"];
    }
    else if(date.year != [[NSDate date] year]) {
        formartStr = [date formattedDateWithFormat:@"yyyy年MM月dd日"];
    }
    else {
        formartStr = [date formattedDateWithFormat:@"MM月dd日 HH:mm"];
    }
    return formartStr;
}

+ (NSString *)at_formartDateStrWithTimestamp:(NSNumber *)timestamp {
    if (!timestamp) {
        return nil;
    }
    
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:timestamp.longLongValue / 1000.0];
    NSString *formartStr;
    if (date.isToday) {
        formartStr = [date formattedDateWithFormat:@"今天"];
    }
    else if(date.year != [[NSDate date] year]) {
        formartStr = [date formattedDateWithFormat:@"yyyy年MM月dd日"];
    }
    else {
        formartStr = [date formattedDateWithFormat:@"MM月dd日"];
    }
    return formartStr;
}

+ (NSString *)at_applyFormartTimeStrWithTimestamp:(NSNumber *)timestamp isAllDay:(BOOL)isAllDay {
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:timestamp.longLongValue / 1000.0];
    
    NSString *chineseWeekDay = [ATCommonProcessTool at_getChineseWeekWithWeekday:date.weekday];
    
    NSString *formartStr;
    if (isAllDay) {
        if (date.isToday) {
            formartStr = [NSString stringWithFormat:@"今天(%@)",chineseWeekDay];
        }
        else if(date.year != [[NSDate date] year]) {
            formartStr = [date formattedDateWithFormat:[NSString stringWithFormat:@"yyyy/MM/dd (%@)",chineseWeekDay]];
        }
        else {
            formartStr = [date formattedDateWithFormat:[NSString stringWithFormat:@"MM/dd(%@)",chineseWeekDay]];
        }
    }
    else {
        if (date.isToday) {
            formartStr = [date formattedDateWithFormat:[NSString stringWithFormat:@"今天 HH:mm(%@)",chineseWeekDay]];
        }
        else if(date.year != [[NSDate date] year]) {
            formartStr = [date formattedDateWithFormat:[NSString stringWithFormat:@"yyyy/MM/dd HH:mm(%@)",chineseWeekDay]];
        }
        else {
            formartStr = [date formattedDateWithFormat:[NSString stringWithFormat:@"MM/dd HH:mm(%@)",chineseWeekDay]];
        }
    }
    
    return formartStr;
}

+ (NSString *)at_scheduleFormartTimeStrWithStartTime:(NSNumber *)startTime
                                             endTime:(NSNumber *)endTime
                                            isAllDay:(BOOL)isAllDay {
    NSDate *startDate;
    if (startTime) {
        startDate = [NSDate dateWithTimeIntervalSince1970:startTime.longLongValue / 1000];
    }
    NSDate *endDate;
    if (endTime) {
        endDate = [NSDate dateWithTimeIntervalSince1970:endTime.longLongValue / 1000];
    }
    NSString *timeSlot = [self at_scheduleFormartTimeStrWithStartDate:startDate endDate:endDate isAllDay:isAllDay];
    
    return timeSlot;
    
//    NSString *dateFormart;
//    if (startDate.year == endDate.year) {
//        dateFormart = @"MM月dd日";
//    }
//    else {
//        dateFormart = @"yyyy年MM月dd日";
//    }
//    if (!isAllDay) {
//        dateFormart = [NSString stringWithFormat:@"%@ HH:mm",dateFormart];
//    }
//    NSString *startStr = [startDate formattedDateWithFormat:dateFormart];
//    NSString *endStr = [endDate formattedDateWithFormat:dateFormart];
//    
//    if (isAllDay) {
//        if (startDate) {
//            NSString *startWeek = [ATCommonProcessTool at_getChineseWeekWithWeekday:startDate.weekday];
//            startStr = [NSString stringWithFormat:@"%@(周%@)",startStr, startWeek];
//        }
//        
//        if (endDate) {
//            NSString *endWeek = [ATCommonProcessTool at_getChineseWeekWithWeekday:endDate.weekday];
//            endStr = [NSString stringWithFormat:@"%@(周%@)",endStr, endWeek];
//        }
//    }
//    
//    if (!startStr) {
//        startStr = @"";
//    }
//    if (!endStr) {
//        endStr = @"";
//    }
//    NSString *timeSlot = [NSString stringWithFormat:@"%@~%@",startStr,endStr];
//    
//    return timeSlot;
}

+ (NSString *)at_scheduleFormartTimeStrWithStartDate:(NSDate *)startDate
                                             endDate:(NSDate *)endDate
                                            isAllDay:(BOOL)isAllDay {
//    NSDate *startDate = [NSDate dateWithTimeIntervalSince1970:startTime.longLongValue / 1000];
//    NSDate *endDate = [NSDate dateWithTimeIntervalSince1970:endTime.longLongValue / 1000];
    
    NSString *dateFormart;
    if (startDate.year == endDate.year && startDate.year == [NSDate date].year) {
        dateFormart = @"MM月dd日";
    }
    else {
        dateFormart = @"yyyy年MM月dd日";
    }
    if (!isAllDay) {
        dateFormart = [NSString stringWithFormat:@"%@ HH:mm",dateFormart];
    }
    NSString *startStr = [startDate formattedDateWithFormat:dateFormart];
    NSString *endStr = [endDate formattedDateWithFormat:dateFormart];
    
    if (isAllDay) {
        if (startDate) {
            NSString *startWeek = [ATCommonProcessTool at_getChineseWeekWithWeekday:startDate.weekday];
            startStr = [NSString stringWithFormat:@"%@(周%@)",startStr, startWeek];
        }
        
        if (endDate) {
            NSString *endWeek = [ATCommonProcessTool at_getChineseWeekWithWeekday:endDate.weekday];
            endStr = [NSString stringWithFormat:@"%@(周%@)",endStr, endWeek];
        }
    }
    
    if (!startStr) {
        startStr = @"";
    }
    if (!endStr) {
        endStr = @"";
    }
    NSString *timeSlot = [NSString stringWithFormat:@"%@~%@",startStr,endStr];
    
    return timeSlot;
}

+ (NSDate *)at_getInternetDate
{
    //NSString *urlString = @"https://www.baidu.com";
    NSString *urlString = @"http://www.beijing-time.org/time.asp";
    urlString = [urlString stringByAddingPercentEscapesUsingEncoding: NSUTF8StringEncoding];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    [request setURL:[NSURL URLWithString: urlString]];
    [request setCachePolicy:NSURLRequestReloadIgnoringCacheData];
    [request setTimeoutInterval: 2];
    [request setHTTPShouldHandleCookies:FALSE];
    [request setHTTPMethod:@"GET"];
    NSHTTPURLResponse *response;
    [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:nil];
//    NSLog(@">>>>> response :%@",response);
    NSString *date = [[response allHeaderFields] objectForKey:@"Date"];
    
//    NSLog(@">>>>> date :%@",date);
    date = [date substringFromIndex:5];
    date = [date substringToIndex:[date length]-4];
//    NSLog(@">>>>> date :%@",date);
    NSDateFormatter *dMatter = [[NSDateFormatter alloc] init];
    dMatter.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"en_US"];
    //    dMatter.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"zh-CHS"];
    [dMatter setDateFormat:@"dd MMM yyyy HH:mm:ss"];
    NSDate *netDate = [[dMatter dateFromString:date] dateByAddingTimeInterval:60*60*8];
    NSTimeZone *zone = [NSTimeZone systemTimeZone];
    NSInteger interval = [zone secondsFromGMTForDate: netDate];
    NSDate *localeDate = [netDate dateByAddingTimeInterval: interval];
//    NSLog(@">>>>> localeDate :%@",localeDate);
    NSString *tmpDate = [NSString stringWithFormat:@"%@",localeDate];
    tmpDate = [tmpDate stringByReplacingOccurrencesOfString:@" +0000" withString:@""];
//    NSLog(@">>>>> localeDate :%@",tmpDate);
    
    NSDateFormatter *format1 = [[NSDateFormatter alloc]init];
    [format1 setDateFormat:@"yyyy/MM/dd HH:mm:ss"];
    NSDate *nowDate = [format1 dateFromString:tmpDate];
    
    return nowDate;
}

+ (long long)getDateTimeTOMilliSeconds:(NSDate *)datetime

{
    
    NSTimeInterval interval = [datetime timeIntervalSince1970];
    
//    NSLog(@"转换的时间戳=%f",interval);
    
   long long totalMilliseconds = interval*1000 ;
    
//    NSLog(@"totalMilliseconds=%llu",totalMilliseconds);
    
    return totalMilliseconds;
    
}
+(NSComparisonResult)at_compareCurrentDateWithTimestamp:(NSNumber *)timestamp{
    NSString *endTimeString = [NSDate at_formartTimeStrWithTimestamp:timestamp formart:@"yyyy-MM-dd HH:mm"];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm"];
    NSString *currentTimeString = [formatter stringFromDate:[NSDate date]];
    NSDate *compareDate =  [formatter dateFromString:endTimeString];
    NSDate *currentDate =  [formatter dateFromString:currentTimeString];
    return [currentDate compare:compareDate];
}





@end
