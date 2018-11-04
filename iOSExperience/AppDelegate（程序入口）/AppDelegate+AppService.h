//
//  AppDelegate+AppService.h
//  iOSExperience
//
//  Created by Ben Lv on 2018/5/30.
//  Copyright © 2018年 avatar. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate (AppService)
- (void)initWindow;

- (void)appStart;

-(void)networkStatusChangeAFN;
@end
