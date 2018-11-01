//
//  YLTLoginView.m
//  iOSExperience
//
//  Created by Ben Lv on 2018/10/16.
//  Copyright © 2018年 avatar. All rights reserved.
//

#import "YLTLoginView.h"

#import "YLLoginTextFieldView.h"

#import "UILabel+YLHelper.h"
#import "UIFont+YLHelper.h"
#import "UIColor+YLHelper.h"
#import <Masonry.h>
static NSString *const kLogin_logoImgName = @"logo_app";
static NSString *const kLogin_title = @"";

@interface YLTLoginView()<YLLoginTextFieldViewDelegate>
{
    BOOL _isMoveUp;
}

@property (nonatomic, strong) UIImageView *logoIV;
@property (nonatomic, strong) UILabel *titleLab;

@property (nonatomic, strong) YLLoginTextFieldView *textFieldView;
@property(nonatomic,strong)UIButton *skipLoginBtn;

@end
@implementation YLTLoginView

#pragma mark - life cycle
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _isMoveUp = YES;
        self.backgroundColor = [UIColor av_colorWithHex:0xF2F2F2];
        [self addSubview:self.logoIV];
        [self addSubview:self.titleLab];
        [self addSubview:self.textFieldView];
        [self addSubview:self.skipLoginBtn];
        
        [self initConstraints];
    }
    return self;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.textFieldView resignKeyborad];
    
    [self moveDownTextFieldView];
}
#pragma mark - public methods

#pragma mark - private methods
- (void)initConstraints {
    [self.logoIV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self).offset(75);
        make.centerX.mas_equalTo(self);
            make.size.mas_equalTo(115);
    }];
    [self.titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.logoIV.mas_bottom).offset(15);
        make.centerX.mas_equalTo(self);
    }];
    
    [self.textFieldView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.titleLab.mas_bottom).offset(90);
        make.left.mas_equalTo(self).offset(45);
        make.right.mas_equalTo(self).offset(-45);
        make.height.mas_equalTo(170 + 30);
        make.bottom.mas_lessThanOrEqualTo(self);
    }];;;;;;
    [self.skipLoginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.bottom.equalTo(self).offset(-35);
        
    }];
    
    
}

- (void)moveDownTextFieldView {
    if (!_isMoveUp) {
        //        [self layoutIfNeeded];
        [UIView animateWithDuration:0.5 animations:^{
            [self.textFieldView mas_updateConstraints:^(MASConstraintMaker *make) {
                make.top.mas_equalTo(self.titleLab.mas_bottom).offset(90);
            }];
            [self layoutIfNeeded];
        }];
        _isMoveUp = YES;
    }
}

- (void)moveUpTextFieldView {
    if (_isMoveUp) {
        //        [self layoutIfNeeded];
        [UIView animateWithDuration:0.5 animations:^{
            [self.textFieldView mas_updateConstraints:^(MASConstraintMaker *make) {
                make.top.mas_equalTo(self.titleLab.mas_bottom).offset(25);
            }];
            [self layoutIfNeeded];
        }];
        _isMoveUp = NO;
    }
}

- (void)skipLogin {
    UIViewController *viewCtr = [self viewController];
    NSString *methodName = @"skipLogin";
    SEL methodSel = NSSelectorFromString(methodName);
    if ([viewCtr respondsToSelector:methodSel]) {
        
        [viewCtr performSelector:methodSel];
    }
    
}

- (UIViewController *)viewController {
    for (UIView *next = [self superview]; next; next = next.superview)
    {
        UIResponder *nextResponder = [next nextResponder];
        if ([nextResponder isKindOfClass:[UIViewController class]]) {
            return (UIViewController *)nextResponder;
        }
    }
    return nil;
}
#pragma mark - getter && setter

#pragma mark - lazy loading
- (UIImageView *)logoIV {
    if (!_logoIV) {
        
        _logoIV = [[UIImageView alloc] initWithImage:[UIImage imageNamed:kLogin_logoImgName]];
    }
    
    return _logoIV;
}

- (UILabel *)titleLab {
    if (!_titleLab) {
        _titleLab = [UILabel av_labelWithtextColor:[UIColor whiteColor] font:[UIFont av_boldFont_18] text:kLogin_title];
        [_titleLab sizeToFit];
    }
    return _titleLab;
}

- (YLLoginTextFieldView *)textFieldView {
    if (!_textFieldView) {
        _textFieldView = [[YLLoginTextFieldView alloc] init];
        _textFieldView.delegate = self;
    }
    return _textFieldView;
}

- (UIButton *)skipLoginBtn {
    
    if (!_skipLoginBtn) {
        _skipLoginBtn = [[UIButton alloc] init];
        NSMutableAttributedString *str = [[NSMutableAttributedString alloc] initWithString:@"跳过登录"];
        NSRange strRange = {0,[str length]};
        [str addAttribute:NSUnderlineStyleAttributeName value:[NSNumber numberWithInteger:NSUnderlineStyleSingle] range:strRange];
        
        [_skipLoginBtn addTarget:self action:@selector(skipLogin) forControlEvents:UIControlEventTouchUpInside];

        [_skipLoginBtn setAttributedTitle:str forState:UIControlStateNormal];
        _skipLoginBtn.titleLabel.textColor = [UIColor blackColor];
        
    }
    return _skipLoginBtn;
    
}
#pragma mark - dataSouce

#pragma mark - delegate
- (void)loginTextFieldView:(YLLoginTextFieldView *)textFieldView moveViewWithIsMoveUp:(BOOL)isMoveUp {
    if (isMoveUp) {
        [self moveUpTextFieldView];
    }
    else {
        [self moveDownTextFieldView];
    }
    
}
@end
