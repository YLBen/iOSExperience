//
//  YLSelectTimeViewController.m
//  iOSExperience
//
//  Created by Ben Lv on 2018/6/11.
//  Copyright © 2018年 avatar. All rights reserved.
//

#import "YLSelectTimeViewController.h"
#import "YLSelectTimeView.h"

#import <Masonry.h>
@interface YLSelectTimeViewController ()<YLSelectTimeViewDelegate>
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property(nonatomic,strong)YLSelectTimeView *deadlineSheetView;
@end

@implementation YLSelectTimeViewController
#pragma mark - life cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"时间选择器";
}

#pragma mark - public methods

#pragma mark - private methods

#pragma mark - getter && setter

#pragma mark - lazy loading
- (YLSelectTimeView *)deadlineSheetView {
    if (!_deadlineSheetView) {
        _deadlineSheetView = [[YLSelectTimeView alloc] init];
        _deadlineSheetView.alpha = 0;
        _deadlineSheetView.delegate = self;
        _deadlineSheetView.isHideSwitch = YES;
    }
    return _deadlineSheetView;
}
#pragma mark - dataSouce

#pragma mark - delegate
/** 选择时间点数据回调 */
- (void)selectDeadlineSheetView:(YLSelectTimeView *)deadlineSheetView selectDate:(NSDate *)selectDate isAllDay:(BOOL)isAllDay {
     NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"yyyy/M/d HH:mm:ss";
    NSString *dateStr = [formatter stringFromDate:selectDate];
    self.timeLabel.text = dateStr;
    
    [_deadlineSheetView removeFromSuperview];
    _deadlineSheetView = nil;
}



- (IBAction)btnClick:(id)sender {
    if (_deadlineSheetView) {
        [_deadlineSheetView removeFromSuperview];
        _deadlineSheetView = nil;
    }
    [self.view addSubview:self.deadlineSheetView];
    self.deadlineSheetView.dateType = ATSelectDeadlineDateType_dateAndTime;
    [self.deadlineSheetView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self.view);
    }];
    [UIView animateWithDuration:0.15 animations:^{
        self.deadlineSheetView.alpha = 1.0;
    }];
}

@end
