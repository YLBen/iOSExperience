//
//  YLLoginViewController.m
//  iOSExperience
//
//  Created by Ben Lv on 2018/10/16.
//  Copyright © 2018年 avatar. All rights reserved.
//

#import "YLLoginViewController.h"

#import "YLTLoginView.h"

#import "AppDelegate.h"
#import "UINavigationController+FDFullscreenPopGesture.h"
#import "AppDelegate.h"
@interface YLLoginViewController ()

@property(nonatomic,strong)YLTLoginView *loginView;

@end

@implementation YLLoginViewController

#pragma mark - life cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.loginView];
    self.fd_prefersNavigationBarHidden = YES;
    
}
#pragma mark - public methods

#pragma mark - private methods
- (void)skipLogin {
    
    AppDelegate *delegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    [delegate.interactor startMain];
    
    
}
#pragma mark - getter && setter

#pragma mark - lazy loading
- (YLTLoginView *)loginView {
    if (!_loginView) {
        _loginView = [[YLTLoginView alloc] initWithFrame:self.view.bounds];
    }
    return _loginView;
    
}
#pragma mark - dataSouce

#pragma mark - delegate



@end
