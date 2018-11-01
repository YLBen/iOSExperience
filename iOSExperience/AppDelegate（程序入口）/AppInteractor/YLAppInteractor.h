//
//  YLAppInteractor.h
//  iOSExperience
//
//  Created by Ben Lv on 2018/10/17.
//  Copyright © 2018年 avatar. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface YLAppInteractor : NSObject
@property(nonatomic,strong)UIWindow *keyWindow;

/** 进入UI界面 */
- (void)startUIFlow;
- (void)startMain;
- (void)startLogin;

- (void)destructorTabbar;
@end

NS_ASSUME_NONNULL_END
