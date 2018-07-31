//
//  YLPieChartViewController.m
//  iOSExperience
//
//  Created by Ben Lv on 2018/7/31.
//  Copyright © 2018年 avatar. All rights reserved.
//

#import "YLPieChartViewController.h"
#import "YLPieChart.h"
@interface YLPieChartViewController ()

@property(nonatomic,strong)YLPieChart *pieChart;

@end

@implementation YLPieChartViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"饼状图";
    [self.view addSubview:self.pieChart];
}


- (YLPieChart *)pieChart {
    if (!_pieChart) {
        _pieChart  =[[YLPieChart alloc] initWithFrame:self.view.bounds];
        _pieChart.backgroundColor = [UIColor whiteColor];
        _pieChart.nums = @[@"10",@"20",@"30",@"40",@"50",@"60"];
    }
    return _pieChart;
    
}


@end
