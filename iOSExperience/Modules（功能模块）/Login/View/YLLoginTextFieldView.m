//
//  YLLoginTextFieldView.m
//  iOSExperience
//
//  Created by Ben Lv on 2018/10/16.
//  Copyright © 2018年 avatar. All rights reserved.
//

#import "YLLoginTextFieldView.h"

#import "YLLoginInfoModel.h"

#import "UIColor+YLHelper.h"
#import "UIButton+YLHelper.h"
#import <Masonry.h>

@interface YLLoginTextFieldView()<UITextFieldDelegate>
{
    BOOL _isHadAccount;//!< 是否有账户
    BOOL _isHadPwd;//!< 是否有密码
}
@property (nonatomic, strong) UIView *tfBgView;
@property (nonatomic, strong) UIView *accountTfBgView;
@property (nonatomic, strong) UIImageView *accountImageView;
@property (nonatomic, strong) UITextField *accountTextField;
@property (nonatomic, strong) UIView *middleLineView;
@property (nonatomic, strong) UIView *pwdBottomLineView;
@property (nonatomic, strong) UIView *pwdTfBgView;
@property (nonatomic, strong) UIImageView *pwdImageView;
@property (nonatomic, strong) UITextField *pwdTextField;

@property (nonatomic, strong) UIButton    *seePwdButton;
@property (nonatomic, strong) UIButton    *loginButton;
@property (nonatomic, strong) UIButton    *forgetPwdButton;
@property (nonatomic, strong) UIButton    *registerButton;

@end

@implementation YLLoginTextFieldView
#pragma mark - life cycle
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.tfBgView];
        [self.tfBgView addSubview:self.accountTfBgView];
        [self.accountTfBgView addSubview:self.accountImageView];
        [self.accountTfBgView addSubview:self.accountTextField];
        
        [self.tfBgView addSubview:self.middleLineView];
        [self.tfBgView addSubview:self.pwdBottomLineView];
        
        [self.tfBgView addSubview:self.pwdTfBgView];
        [self.pwdTfBgView addSubview:self.pwdImageView];
        [self.pwdTfBgView addSubview:self.pwdTextField];
        [self.pwdTfBgView addSubview:self.seePwdButton];
        
        [self addSubview:self.loginButton];
        [self addSubview:self.forgetPwdButton];
        [self addSubview:self.registerButton];
        
#if AV_DEV
#else
        self.forgetPwdButton.hidden = YES;
        self.registerButton.hidden = YES;
#endif
        
        [self initConstraints];
    }
    return self;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        [self addSubview:self.tfBgView];
        [self.tfBgView addSubview:self.accountTfBgView];
        [self.accountTfBgView addSubview:self.accountImageView];
        [self.accountTfBgView addSubview:self.accountTextField];
        
        [self.tfBgView addSubview:self.middleLineView];
        [self.tfBgView addSubview:self.pwdBottomLineView];
        
        [self.tfBgView addSubview:self.pwdTfBgView];
        [self.pwdTfBgView addSubview:self.pwdImageView];
        [self.pwdTfBgView addSubview:self.pwdTextField];
        [self.pwdTfBgView addSubview:self.seePwdButton];
        
        [self addSubview:self.loginButton];
        [self addSubview:self.forgetPwdButton];
        [self addSubview:self.registerButton];
        
#if AV_DEV
#else
        self.forgetPwdButton.hidden = YES;
        self.registerButton.hidden = YES;
#endif
        
        [self initConstraints];
    }
    return self;
    
}

#pragma mark - public methods
- (void)setInfoModel:(YLLoginInfoModel *)infoModel {
    _infoModel = infoModel;
    
    self.accountTextField.text = infoModel.account;
    self.pwdTextField.text = infoModel.pwd;
}

/** 注销键盘 */
- (void)resignKeyborad {
    if (self.accountTextField.isFirstResponder) {
        [self.accountTextField resignFirstResponder];
    }
    if (self.pwdTextField.isFirstResponder) {
        [self.pwdTextField resignFirstResponder];
    }
}

#pragma mark - private methods
- (UIViewController *)at_viewController{
    for (UIView* next = self; next; next = next.superview) {
        UIResponder* nextResponder = [next nextResponder];
        if ([nextResponder isKindOfClass:[UIViewController class]]) {
            return (UIViewController*)nextResponder;
        }
    }
    return nil;
}

- (void)initConstraints {
    [self.tfBgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.mas_equalTo(self);
        make.height.mas_equalTo(100);
    }];
    
    [self.accountTfBgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.mas_equalTo(self.tfBgView);
        make.height.mas_equalTo(50);
    }];
    [self.accountImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.accountTfBgView);
        make.left.mas_equalTo(self.accountTfBgView);
        make.width.mas_equalTo(22);
        make.height.mas_equalTo(22);
    }];
    [self.accountTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.accountTfBgView);
        make.left.mas_equalTo(self.accountImageView.mas_right).offset(15);
        make.right.mas_equalTo(self.accountTfBgView);
    }];
    
    [self.middleLineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.accountTfBgView.mas_bottom);
        make.left.mas_equalTo(self.tfBgView);
        make.right.mas_equalTo(self.tfBgView);
        make.height.mas_equalTo(0.5);
    }];
    
    [self.pwdBottomLineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.bottom.right.mas_equalTo(self.tfBgView);
        make.height.mas_equalTo(0.5);
    }];
    
    [self.pwdTfBgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.middleLineView.mas_bottom);
        make.left.right.mas_equalTo(self.tfBgView);
        make.bottom.mas_equalTo(self.pwdBottomLineView.mas_top);
        make.height.mas_equalTo(self.accountTfBgView);
    }];
    //    CGSize pwdImg_size = self.pwdImageView.image.size;
    //    CGFloat pwdScale = pwdImg_size.width / pwdImg_size.height;
    [self.pwdImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.pwdTfBgView);
        make.left.mas_equalTo(self.pwdTfBgView);
        //                make.centerX.mas_equalTo(self.accountImageView);
        make.width.mas_equalTo(22);
        make.height.mas_equalTo(22);
    }];
    [self.pwdTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.pwdTfBgView);
        make.left.mas_equalTo(self.accountTextField);
        make.right.mas_equalTo(self.seePwdButton.mas_left).offset(0);
    }];
    
    //    CGSize imageSize = self.seePwdButton.imageView.image.size;
    [self.seePwdButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.pwdTextField);
        make.right.mas_equalTo(self.pwdTfBgView);
        //                make.size.mas_equalTo(imageSize);
        make.width.mas_equalTo(45);
        make.height.mas_equalTo(40);
    }];
    
   
    
//    CGSize img_size = self.accountImageView.image.size;
//    CGFloat scale = img_size.width / img_size.height;
 
    

    
    [self.loginButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.tfBgView.mas_bottom).offset(35);
        make.left.right.mas_equalTo(self);
//                make.bottom.mas_equalTo(self);
                make.height.mas_equalTo(45);
    }];
    
    [self.forgetPwdButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.loginButton.mas_bottom).offset(30);
        make.left.mas_equalTo(self.loginButton);
//        make.bottom.mas_equalTo(self);
    }];
    [self.registerButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.forgetPwdButton);
        make.left.mas_greaterThanOrEqualTo(self.forgetPwdButton.mas_right).offset(15);
        make.right.mas_equalTo(self);
    }];
}

- (void)seePwdButtonClicked:(UIButton *)btn {
    self.pwdTextField.secureTextEntry = !self.pwdTextField.secureTextEntry;
    self.seePwdButton.selected = !self.seePwdButton.isSelected;
}

- (void)loginButtonClicked:(UIButton *)btn {
    [self startLogin];
}

- (void)startLogin {
    _infoModel.account = self.accountTextField.text;
    _infoModel.pwd = self.pwdTextField.text;
    
    NSString *actionName = self.infoModel.loginAction;
    if (actionName.length) {
        SEL sel = NSSelectorFromString(actionName);
        UIViewController *ctr = self.at_viewController;
        if ([ctr respondsToSelector:sel]) {
//            AT_SuppressPerformSelectorLeakWarning([ctr performSelector:sel withObject:self withObject:self.infoModel]);
        }
    }
}

- (void)forgetPwdButtonClicked:(UIButton *)btn {
    NSString *actionName = self.infoModel.forgetPwdAction;
    if (actionName.length) {
        SEL sel = NSSelectorFromString(actionName);
        UIViewController *ctr = self.at_viewController;
        if ([ctr respondsToSelector:sel]) {
//            AT_SuppressPerformSelectorLeakWarning([ctr performSelector:sel]);
        }
    }
}

- (void)registerButtonClicked:(UIButton *)btn {
    NSString *actionName = self.infoModel.registerAction;
    if (actionName.length) {
        SEL sel = NSSelectorFromString(actionName);
        UIViewController *ctr = self.at_viewController;
        if ([ctr respondsToSelector:sel]) {
//            AT_SuppressPerformSelectorLeakWarning([ctr performSelector:sel]);
        }
        
    }
}

#pragma mark - getter && setter

#pragma mark - lazy loading
- (UIView *)tfBgView {
    if (!_tfBgView) {
        _tfBgView = [[UIView alloc] init];
        //        _tfBgView.layer.cornerRadius = 5;
        //        _tfBgView.layer.masksToBounds = YES;
        //        _tfBgView.layer.borderColor = [UIColor at_bgGrayColor].CGColor;
        //        _tfBgView.layer.borderWidth = 0.5;
    }
    return _tfBgView;
}

- (UIView *)accountTfBgView {
    if (!_accountTfBgView) {
        _accountTfBgView = [[UIView alloc] init];
    }
    return _accountTfBgView;
}

- (UIImageView *)accountImageView {
    if (!_accountImageView) {
        _accountImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"login_icon_account"]];
        [_accountImageView setContentCompressionResistancePriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisHorizontal];
    }
    return _accountImageView;
}

- (UITextField *)accountTextField {
    if (!_accountTextField) {
        _accountTextField = [[UITextField alloc] init];
        _accountTextField.placeholder = @"输入登录账号";
        _accountTextField.delegate = self;
        _accountTextField.textColor = [UIColor av_fontDarkGrayColor];
        _accountTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
        _accountTextField.returnKeyType = UIReturnKeyNext;
        _accountTextField.enablesReturnKeyAutomatically = YES;
        _accountTextField.autocorrectionType = UITextAutocorrectionTypeNo;//!<取消联想功能
        _accountTextField.autocapitalizationType = UITextAutocapitalizationTypeNone;//!<取消手母大写
    }
    return _accountTextField;
}

- (UIView *)middleLineView {
    if (!_middleLineView) {
        _middleLineView = [[UIView alloc] init];
        _middleLineView.backgroundColor = [UIColor av_colorWithHex:0xABABAB];
    }
    return _middleLineView;
}

- (UIView *)pwdBottomLineView {
    if (!_pwdBottomLineView) {
        _pwdBottomLineView = [[UIView alloc] init];
        _pwdBottomLineView.backgroundColor = [UIColor av_colorWithHex:0xABABAB];
    }
    return _pwdBottomLineView;
}

- (UIView *)pwdTfBgView {
    if (!_pwdTfBgView) {
        _pwdTfBgView = [[UIView alloc] init];
    }
    return _pwdTfBgView;
}

- (UIImageView *)pwdImageView {
    if (!_pwdImageView) {
        _pwdImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"login_icon_pwd"]];
        [_pwdImageView setContentCompressionResistancePriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisHorizontal];
    }
    return _pwdImageView;
}

- (UITextField *)pwdTextField {
    if (!_pwdTextField) {
        _pwdTextField = [[UITextField alloc] init];
        _pwdTextField.placeholder = @"输入登录密码";
        _pwdTextField.delegate = self;
        _pwdTextField.textColor = [UIColor av_fontDarkGrayColor];
        _pwdTextField.keyboardType = UIKeyboardTypeASCIICapable;
        _pwdTextField.secureTextEntry = YES;
        _pwdTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
        _pwdTextField.returnKeyType = UIReturnKeyGo;
        _pwdTextField.enablesReturnKeyAutomatically = YES;
    }
    return _pwdTextField;
}

- (UIButton *)seePwdButton {
    if (!_seePwdButton) {
        _seePwdButton = [UIButton av_buttonWithTarget:self action:@selector(seePwdButtonClicked:) imageNamed:@"login_eyes_closePwd"];
        [_seePwdButton setImage:[UIImage imageNamed:@"login_eyes_seePwd"] forState:UIControlStateSelected];
        //        [_seePwdButton setContentCompressionResistancePriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisHorizontal];
    }
    return _seePwdButton;
}

- (UIButton *)loginButton {
    if (!_loginButton) {
        _loginButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _loginButton.backgroundColor = [UIColor at_themeBlueColor];
        [_loginButton setTitle:@"登录" forState:UIControlStateNormal];
        [_loginButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_loginButton addTarget:self action:@selector(loginButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
        _loginButton.layer.cornerRadius = 5;
        //        _loginButton.layer.masksToBounds = YES;
        
        _loginButton.layer.shadowColor = [UIColor av_colorWithHex:0x7392FF alpha:0.29].CGColor;
        _loginButton.layer.shadowOffset = CGSizeMake(2, 5);
        _loginButton.layer.shadowOpacity = 0.5;
        _loginButton.layer.shadowRadius = 5;
    }
    
    return _loginButton;
}

- (UIButton *)forgetPwdButton {
    if (!_forgetPwdButton) {
        _forgetPwdButton = [UIButton av_buttonWithTarget:self action:@selector(forgetPwdButtonClicked:) titleFont:[UIFont systemFontOfSize:15] titleColor:[UIColor av_fontBlackColor] title:@"忘记密码"];
        [_forgetPwdButton sizeToFit];
    }
    return _forgetPwdButton;
}

- (UIButton *)registerButton {
    if (!_registerButton) {
        _registerButton = [UIButton av_buttonWithTarget:self action:@selector(registerButtonClicked:) titleFont:[UIFont systemFontOfSize:15] titleColor:[UIColor av_fontBlackColor] title:@"注册"];
        [_registerButton sizeToFit];
    }
    return _registerButton;
}

#pragma mark - delegate
- (void)textFieldDidBeginEditing:(UITextField *)textField {
    if ([_delegate respondsToSelector:@selector(loginTextFieldView:moveViewWithIsMoveUp:)]) {
        [_delegate loginTextFieldView:self moveViewWithIsMoveUp:YES];
    }
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    if (UIReturnKeyNext == textField.returnKeyType) {
        [self.pwdTextField becomeFirstResponder];
    }
    else if (UIReturnKeyGo == textField.returnKeyType) {
//        [self startLogin];
    }
    else {
        [textField resignFirstResponder];
        if ([_delegate respondsToSelector:@selector(loginTextFieldView:moveViewWithIsMoveUp:)]) {
            [_delegate loginTextFieldView:self moveViewWithIsMoveUp:NO];
        }
    }
    
    
    return YES;
}

@end
