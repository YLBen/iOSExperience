//
//  YLHistogramViewController.m
//  iOSExperience
//
//  Created by Ben Lv on 2018/7/31.
//  Copyright © 2018年 avatar. All rights reserved.
//

#import "YLHistogramViewController.h"
#import "YLHistogramView.h"
#import <Masonry.h>
@interface YLHistogramViewController ()

@property(nonatomic,strong)YLHistogramView *myView;

@end

@implementation YLHistogramViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"柱状图";
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.myView];
    [self initConstraints];
}

- (void)initConstraints {
    [self.myView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    
}

- (YLHistogramView *)myView {
    if (!_myView) {
        _myView = [[YLHistogramView alloc] initWithFrame:self.view.bounds];
        _myView.backgroundColor = [UIColor whiteColor];
        _myView.nums = @[@"10",@"20",@"30",@"40",@"50"];
    }
    return _myView;
    
}


@end
