//
//  ATNetworkManager.m
//  Regulatory
//
//  Created by SimonMiao on 2018/1/24.
//  Copyright © 2018年 Avatar. All rights reserved.
//

#import "ATNetworkManager.h"

static NSInteger at_progressCount = 0;

@implementation ATNetworkManager

+ (void)addNetworkProgress {
    at_progressCount ++;
    dispatch_async(dispatch_get_main_queue(), ^{
        [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
    });
}

+ (void)removeNetworkProgress {
    at_progressCount --;
    if (at_progressCount < 0) {
        at_progressCount = 0;
    }
    if (at_progressCount <= 0) {
        dispatch_async(dispatch_get_main_queue(), ^{
            [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
        });
    }
}

@end
