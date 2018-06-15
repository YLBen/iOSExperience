//
//  YLFuzzyViewController.m
//  iOSExperience
//
//  Created by Ben Lv on 2018/6/7.
//  Copyright © 2018年 avatar. All rights reserved.
//

#import "YLFuzzyViewController.h"
#import "UINavigationController+FDFullscreenPopGesture.h"
#import <Masonry.h>
@interface YLFuzzyViewController ()
@property(nonatomic,strong)UIImageView *myImage;
@property(nonatomic,strong)UIButton * btn;
@end

@implementation YLFuzzyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.myImage];
//    模糊代码😀😀
    UIBlurEffect *blur = [UIBlurEffect effectWithStyle:UIBlurEffectStyleLight];
    UIVisualEffectView *effectview = [[UIVisualEffectView alloc] initWithEffect:blur];
    effectview.frame = self.myImage.frame;
    [self.myImage addSubview:effectview];
    
//    隐藏导航栏
    self.fd_prefersNavigationBarHidden = YES;
    
    _btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [_btn setImage:[UIImage imageNamed:@"navBar_back_orange"] forState:UIControlStateNormal];
    _btn.frame = CGRectMake(10, 35, 30, 30);
    [_btn addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_btn];
}


-(UIImageView *)myImage {
    if (!_myImage) {
        _myImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"dog"]];
        _myImage.frame = self.view.frame;
    }
    return _myImage;
}

- (void)back {
    [self.navigationController popViewControllerAnimated:YES];
}

@end
