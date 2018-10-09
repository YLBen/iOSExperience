//
//  NSDictionary+ATHelper.m
//  AttendanceDemo
//
//  Created by SimonMiao on 2017/12/22.
//  Copyright © 2017年 Avatar. All rights reserved.
//

#import "NSDictionary+ATHelper.h"

@implementation NSDictionary (ATHelper)

#pragma mark - public method

- (id)at_safeValueForKey:(NSString *)key {
    id value = [self valueForKey:key];
    if([value isKindOfClass:[NSNull class]]){
        value = nil;
    }
    return value;
}

- (id)at_safeValueArrayForKey:(NSString *)key {
    return [self at_safeValueForKey:key originalClass:[NSArray class]];
}

- (id)at_safeValueMutableArrayForKey:(NSString *)key {
    return [self at_safeValueForKey:key originalClass:[NSMutableArray class]];
}

- (id)at_safeValueDictonaryForKey:(NSString *)key {
    return [self at_safeValueForKey:key originalClass:[NSDictionary class]];
}

- (id)at_safeValueMutableDictionaryForKey:(NSString *)key {
    return [self at_safeValueForKey:key originalClass:[NSMutableDictionary class]];
}

- (id)at_safeValueDateForKey:(NSString *)key {
    return [self at_safeValueForKey:key originalClass:[NSDate class]];
}

#pragma mark - private method
- (id)at_safeValueForKey:(NSString *)key originalClass:(Class)aClass {
    id value = [self valueForKeyPath:key];
    if ([value isKindOfClass:[NSNull class]]) {
        value = nil;
    }
    
    if (value) {
        return value;
    }
    
    if (aClass == [NSString class]) {
        return @"";
    }
    
    if (aClass == [NSNumber class]) {
        return @0;
    }
    
    NSArray *array = @[@"NSArray",
                       @"NSMutaleArray",
                       @"NSDictionary",
                       @"NSMutableDictionary",
                       @"NSDate"];
    
    for (NSString *className in array) {
        Class bClass = NSClassFromString(className);
        if (aClass != bClass) {
            continue;
        }
        
        value = [[bClass alloc] init];
        break;
    }
    
    return value;
}

@end
