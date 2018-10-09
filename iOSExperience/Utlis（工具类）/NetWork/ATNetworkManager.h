//
//  ATNetworkManager.h
//  Regulatory
//
//  Created by SimonMiao on 2018/1/24.
//  Copyright © 2018年 Avatar. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ATNetworkManager : NSObject

/**
 *  进行网络进程时调用
 */
+ (void)addNetworkProgress;
/**
 *  网络进程结束时调用
 */
+ (void)removeNetworkProgress;

@end
