//
//  YLSelectTimeView.h
//  iOSExperience
//
//  Created by Ben Lv on 2018/6/11.
//  Copyright © 2018年 avatar. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, ATSelectDeadlineDateType) {
    ATSelectDeadlineDateType_date,
    ATSelectDeadlineDateType_dateAndTime
};

@class YLSelectTimeView;
@protocol YLSelectTimeViewDelegate <NSObject>

@optional
- (void)selectDeadlineSheetView:(YLSelectTimeView *)deadlineSheetView selectDate:(NSDate *)selectDate isAllDay:(BOOL)isAllDay;

- (void)removeSelectDeadlineSheetViewFromSuperView:(YLSelectTimeView *)deadlineSheetView;

@end

@interface YLSelectTimeView : UIView

@property (nonatomic, weak) id <YLSelectTimeViewDelegate>delegate;

@property (nonatomic, assign) ATSelectDeadlineDateType dateType;
@property (nonatomic, assign) BOOL isHideSwitch;//!<是否隐藏全天按钮

@end
