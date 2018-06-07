//
//  YLFuzzyViewController.m
//  iOSExperience
//
//  Created by Ben Lv on 2018/6/7.
//  Copyright © 2018年 avatar. All rights reserved.
//

#import "YLFuzzyViewController.h"
#import "UINavigationController+FDFullscreenPopGesture.h"
@interface YLFuzzyViewController ()
@property(nonatomic,strong)UIImageView *myImage;
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
}


-(UIImageView *)myImage {
    if (!_myImage) {
        _myImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"dog"]];
        _myImage.frame = self.view.frame;
    }
    return _myImage;
}

#pragma mark - UINavigationControllerDelegate


@end
