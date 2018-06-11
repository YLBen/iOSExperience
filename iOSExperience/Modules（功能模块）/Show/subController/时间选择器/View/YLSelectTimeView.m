//
//  YLSelectTimeView.m
//  iOSExperience
//
//  Created by Ben Lv on 2018/6/11.
//  Copyright © 2018年 avatar. All rights reserved.
//

#import "YLSelectTimeView.h"
#import <Masonry.h>
#import "UILabel+YLHelper.h"
#import "UIButton+YLHelper.h"
#import "UIColor+YLHelper.h"
@interface YLSelectTimeView()

@property (nonatomic, strong) UIView *bgView;
@property (nonatomic, strong) UILabel *allDayLab;
@property (nonatomic, strong) UISwitch *allDaySwitch;
@property (nonatomic, strong) UIButton *sureBtn;
@property (nonatomic, strong) UIDatePicker *datePicker;

@property (nonatomic, strong) UIButton *cancelBtn;

@end

@implementation YLSelectTimeView
#pragma mark - life cycle
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.backgroundColor = [UIColor colorWithWhite:0.0 alpha:0.5];
        [self addSubview:self.bgView];
        [self.bgView addSubview:self.allDayLab];
        [self.bgView addSubview:self.allDaySwitch];
        [self.bgView addSubview:self.sureBtn];
        [self.bgView addSubview:self.datePicker];
        [self addSubview:self.cancelBtn];
        
        [self initConstraints];
    }
    return self;
}
#pragma mark - public methods
- (void)setDateType:(ATSelectDeadlineDateType)dateType {
    _dateType = dateType;
    switch (dateType) {
        case ATSelectDeadlineDateType_date:
            self.datePicker.datePickerMode = UIDatePickerModeDate;
            self.allDaySwitch.on = YES;
            break;
        case ATSelectDeadlineDateType_dateAndTime:
            self.datePicker.datePickerMode = UIDatePickerModeDateAndTime;
            self.allDaySwitch.on = NO;
            break;
            
        default:
            break;
    }
}

- (void)setIsHideSwitch:(BOOL)isHideSwitch {
    _isHideSwitch = isHideSwitch;
    
    self.allDaySwitch.hidden = isHideSwitch;
    self.allDayLab.hidden = isHideSwitch;
}

#pragma mark - private methods
- (void)initConstraints {
    [self.bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(self.cancelBtn.mas_top).offset(-10);
        make.left.mas_equalTo(self).offset(5);
        make.right.mas_equalTo(self).offset(-5);
        make.height.mas_equalTo(230);
    }];
    [self.cancelBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(self.bgView);
        make.bottom.mas_equalTo(self).offset(-5);
        make.height.mas_equalTo(50);
    }];
    
    [self.allDayLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.bgView).offset(15);
        make.left.mas_equalTo(self.bgView).offset(10);
    }];
    [self.allDaySwitch mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.allDayLab);
        make.left.mas_equalTo(self.allDayLab.mas_right).offset(10);
    }];
    [self.sureBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.bgView).offset(5);
        make.right.mas_equalTo(self.bgView);
        make.size.mas_equalTo(40);
    }];
    [self.datePicker mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.bgView).offset(70);
        make.left.mas_equalTo(self.bgView).offset(20);
        make.bottom.mas_equalTo(self.bgView).offset(-10);
        make.right.mas_equalTo(self.bgView).offset(-20);
    }];
}

- (void)allDaySwitchClicked:(UISwitch *)sender {
    if (sender.isOn) {
        self.datePicker.datePickerMode = UIDatePickerModeDate;
    }
    else {
        self.datePicker.datePickerMode = UIDatePickerModeDateAndTime;
    }
}

- (void)sureBtnClicked:(UIButton *)btn {
    YLLog(@"self.datePicker.date:%@",self.datePicker.date);
    if ([_delegate respondsToSelector:@selector(selectDeadlineSheetView:selectDate:isAllDay:)]) {
        [_delegate selectDeadlineSheetView:self selectDate:self.datePicker.date isAllDay:self.allDaySwitch.isOn];
    }
}

- (void)cancelBtnClicked:(UIButton *)btn {
    if ([_delegate respondsToSelector:@selector(removeSelectDeadlineSheetViewFromSuperView:)]) {
        [_delegate removeSelectDeadlineSheetViewFromSuperView:self];
    }
    [self removeFromSuperview];
}
#pragma mark - getter && setter

#pragma mark - lazy loading
- (UIView *)bgView {
    if (!_bgView) {
        _bgView = [[UIView alloc] init];
        _bgView.backgroundColor = [UIColor whiteColor];
        _bgView.layer.cornerRadius = 5.0;
        _bgView.layer.masksToBounds = YES;
    }
    return _bgView;
}

- (UILabel *)allDayLab {
    if (!_allDayLab) {
        _allDayLab = [UILabel av_labelWithtextColor:[UIColor blackColor] font:[UIFont systemFontOfSize:15] text:@"全天"];
    }
    return _allDayLab;
}

- (UISwitch *)allDaySwitch {
    if (!_allDaySwitch) {
        _allDaySwitch = [[UISwitch alloc] init];
        _allDaySwitch.on = YES;
        [_allDaySwitch addTarget:self action:@selector(allDaySwitchClicked:) forControlEvents:UIControlEventValueChanged];
    }
    return _allDaySwitch;
}

- (UIButton *)sureBtn {
    if (!_sureBtn) {
        _sureBtn = [UIButton av_buttonWithTarget:self action:@selector(sureBtnClicked:) imageNamed:@"widget_btn_checked"];
    }
    return _sureBtn;
}

- (UIDatePicker *)datePicker {
    if (!_datePicker) {
        _datePicker = [[UIDatePicker alloc] init];
        _datePicker.datePickerMode = UIDatePickerModeDate;
        [_datePicker setMinimumDate:[NSDate date]];
        [_datePicker setDate:[NSDate date]];
        _datePicker.locale = [NSLocale localeWithLocaleIdentifier:@"zh-Hans"];
        
        
    }
    return _datePicker;
}

- (UIButton *)cancelBtn {
    if (!_cancelBtn) {
        _cancelBtn = [UIButton av_buttonWithTarget:self action:@selector(cancelBtnClicked:) titleFont:[UIFont systemFontOfSize:17] titleColor:[UIColor av_fontBlueColor] title:@"取消"];
        _cancelBtn.backgroundColor = [UIColor whiteColor];
        _cancelBtn.layer.cornerRadius = 5.0;
        _cancelBtn.layer.masksToBounds = YES;
    }
    return _cancelBtn;
}

#pragma mark - dataSouce

#pragma mark - delegate

@end
