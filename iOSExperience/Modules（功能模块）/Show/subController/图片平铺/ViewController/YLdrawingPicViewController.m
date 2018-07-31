//
//  YLdrawingPicViewController.m
//  iOSExperience
//
//  Created by Ben Lv on 2018/7/31.
//  Copyright © 2018年 avatar. All rights reserved.
//

#import "YLdrawingPicViewController.h"
#import "imageView.h"
@interface YLdrawingPicViewController ()
@property(nonatomic,strong)imageView *myView;
@end

@implementation YLdrawingPicViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"图片平铺";
    [self.view addSubview:self.myView];
}

- (imageView *)myView {
    if (!_myView) {
        _myView = [[imageView alloc] initWithFrame:self.view.bounds];
        _myView.backgroundColor = [UIColor whiteColor];
        _myView.imageName = @"icon_10";
    }
    return _myView;
    
}

@end
