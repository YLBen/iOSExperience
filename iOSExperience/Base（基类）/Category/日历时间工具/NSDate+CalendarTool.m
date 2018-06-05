//
//  NSDate+CalendarTool.m
//  launcher
//
//  Created by kylehe on 16/3/7.
//  Copyright © 2016年 William Zhang. All rights reserved.
//

#import "NSDate+CalendarTool.h"
@implementation NSDate (CalendarTool)
/**
 *  获取当前时间的日期（day）
 *
 *  @param date NSDate类型数据
 *
 *  @return 每月第几天
 */
+ (NSInteger)day:(NSDate *)date{
    NSDateComponents *components = [[NSCalendar currentCalendar] components:(NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay) fromDate:date];
    return [components day];
}

/**
 *  获取当前时间的月份
 *
 *  @param date NSDate类型
 *
 *  @return 返回月份
 */
+ (NSInteger)month:(NSDate *)date{
    NSDateComponents *components = [[NSCalendar currentCalendar] components:(NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay) fromDate:date];
    return [components month];
}

/**
 *  获取当前时间的年份
 *
 *  @param date NSDate类型
 *
 *  @return 返回年份
 */
+ (NSInteger)year:(NSDate *)date{
    NSDateComponents *components = [[NSCalendar currentCalendar] components:(NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay) fromDate:date];
    return [components year];
}

/**
 *  获取当前时间所在月的总天数
 *
 *  @param date NSDate类型
 *
 *  @return 总天数
 */
+ (NSInteger)totalDaysInMonth:(NSDate *)date
{
    NSRange totaldaysInMonth = [[NSCalendar currentCalendar] rangeOfUnit:NSCalendarUnitDay inUnit:NSCalendarUnitMonth forDate:date];
    return totaldaysInMonth.length;
}
/**
 *  获取上个月的某一天
 *
 *  @param date NSDate类型
 *
 *  @return 上个月的某一天
 */
+ (NSDate *)lastMonth:(NSDate *)date
{
    NSDateComponents *dateComponents = [[NSDateComponents alloc] init];
    dateComponents.month = -1;
    NSDate *newDate =[[NSCalendar currentCalendar] dateByAddingComponents:dateComponents toDate:date options:0];
    return newDate;
}
/**
 *  获取下个月的某一天
 *
 *  @param date NSDate类型
 *
 *  @return 下个月的某一天
 */
+ (NSDate *)nextMonth:(NSDate *)date
{
    NSDateComponents *dateComponents = [[NSDateComponents alloc] init];
    dateComponents.month = +1;
    NSDate *newDate =[[NSCalendar currentCalendar] dateByAddingComponents:dateComponents toDate:date options:0];
    return newDate;
}

/**
 *  获取第一天是周几
 *
 *  @param date NSDate类型
 *
 *  @return 返回第一天是周几
 */
+ (NSInteger)firstWeekdayInThisMonth:(NSDate *)date{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
    [calendar setFirstWeekday:1];
    NSDateComponents *comp = [calendar components:(NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay) fromDate:date];
    [comp setDay:1];
    NSDate *firstDayOfMonthDate = [calendar dateFromComponents:comp];
    
    NSUInteger firstWeekday = [calendar ordinalityOfUnit:NSCalendarUnitWeekday inUnit:NSCalendarUnitWeekOfMonth forDate:firstDayOfMonthDate];
    return firstWeekday - 1;
}

@end
