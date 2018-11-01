//
//  YL56ViewController.h
//  iOSExperience
//
//  Created by Ben Lv on 2018/10/27.
//  Copyright © 2018年 avatar. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol YL56ViewControllerDelegate<NSObject>
- (void)yyyuy:(NSString *_Nullable)str;

@end

NS_ASSUME_NONNULL_BEGIN

@interface YL56ViewController : UIViewController
@property(nonatomic,weak)id <YL56ViewControllerDelegate> delegate;
@end

NS_ASSUME_NONNULL_END
