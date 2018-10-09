//
//  NSDictionary+ATHelper.h
//  AttendanceDemo
//
//  Created by SimonMiao on 2017/12/22.
//  Copyright © 2017年 Avatar. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (ATHelper)

- (id)at_safeValueForKey:(NSString *)key;

- (id)at_safeValueArrayForKey:(NSString *)key;
- (id)at_safeValueMutableArrayForKey:(NSString *)key;
- (id)at_safeValueDictonaryForKey:(NSString *)key;
- (id)at_safeValueMutableDictionaryForKey:(NSString *)key;
- (id)at_safeValueDateForKey:(NSString *)key;

@end
