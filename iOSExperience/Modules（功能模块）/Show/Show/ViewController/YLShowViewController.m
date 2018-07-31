//
//  YLShowViewController.m
//  iOSExperience
//
//  Created by Ben Lv on 2018/5/27.
//  Copyright © 2018年 avatar. All rights reserved.
//

#import "YLShowViewController.h"
// Controller
#import "YLShowImageViewController.h"
#import "YLLocalImageUpload.h"
#import "YLLocalNotificationsViewController.h"
#import "YLFoldingCellViewController.h"
#import "YLScratchableLatexViewController.h"
#import "YLFuzzyViewController.h"
#import "YLEditableViewController.h"
#import "YLAdaptFontViewController.h"
#import "YLSelectTimeViewController.h"
#import "YLRunWebViewViewController.h"
#import "YLSphereTagCloudViewController.h"
#import "YLRollingViewController.h"
#import "YLMenuViewController.h"
#import "YLUnlimitedViewController.h"
#import "YLsimpleButtonsViewController.h"
#import "YLCustomProgressViewController.h"
#import "YLPieChartViewController.h"
#import "YLHistogramViewController.h"
#import "YLdrawingPicViewController.h"
// model

// View
#import "YLShowListView.h"
// ViewModel
#import "YLShowViewModel.h"
// tools

// category

// third party
#import <Masonry.h>
#import "UIColor+YLHelper.h"
@interface YLShowViewController ()<YLShowListViewDelegate>
@property(nonatomic,strong)YLShowListView *showListView;
@property(nonatomic,strong)YLShowViewModel *viewModel;
@end

@implementation YLShowViewController

#pragma mark - life cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.showListView];
    [self initConstraints];
    [self loadDataSouce];
    self.navigationController.navigationBar.barTintColor = [UIColor whiteColor];

//    KVO 监听tableView 偏移量
    [self.showListView.tableView addObserver: self forKeyPath: @"contentOffset" options: NSKeyValueObservingOptionNew context: nil];

}
#pragma mark - public methods

#pragma mark - private methods
- (void)initConstraints {
    [self.showListView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
}



/**
 *  监听属性值发生改变时回调
 */
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context
{

    CGFloat offset = self.showListView.tableView.contentOffset.y;
    CGFloat delta = offset / 64.f + 1.f;
    delta = MAX(0, delta);
//    if (delta > 0.7) {
        self.navigationController.navigationBar.alpha = MIN(1, delta);
//    }
    
}


-(void)loadDataSouce {
   self.showListView.dataSouce = [YLShowViewModel getDataSouce];
}
#pragma mark - getter && setter

#pragma mark - lazy loading
- (YLShowListView *)showListView {
    if (!_showListView) {
        _showListView = [[YLShowListView alloc] init];
        _showListView.delegate = self;
    }
    return _showListView;
}
- (YLShowViewModel *)viewModel {
    if (!_viewModel) {
        _viewModel = [[YLShowViewModel alloc] init];
        _viewModel.viewController = self;
    }
    return _viewModel;
}
#pragma mark - dataSouce

#pragma mark - delegate
- (void)YLShowListView:(YLShowListView *)showListView WithTag:(NSString *)tag {
    if ([tag isEqualToString:@"0"]) {
        YLShowImageViewController *ctr = [[YLShowImageViewController alloc] init];
        [self.navigationController pushViewController:ctr animated:YES];
    }
    else if ([tag isEqualToString:@"1"]) {
        YLLocalImageUpload *ctr = [[YLLocalImageUpload alloc] init];
        [self.navigationController pushViewController:ctr animated:YES];
    }
    else if ([tag isEqualToString:@"2"]) {
        YLLocalNotificationsViewController *ctr = [[YLLocalNotificationsViewController alloc] init];
        [self.navigationController pushViewController:ctr animated:YES];
    }
    else if ([tag isEqualToString:@"3"]) {
        YLFoldingCellViewController *ctr = [[YLFoldingCellViewController alloc] init];
        [self.navigationController pushViewController:ctr animated:YES];
    }
    else if ([tag isEqualToString:@"4"]) {
        YLScratchableLatexViewController *ctr = [[YLScratchableLatexViewController alloc] init];
        [self.navigationController pushViewController:ctr animated:YES];
    }
    else if ([tag isEqualToString:@"5"]) {
        YLFuzzyViewController *ctr = [[YLFuzzyViewController alloc] init];
        [self.navigationController pushViewController:ctr animated:YES];
    }
    else if ([tag isEqualToString:@"6"]) {
        YLEditableViewController *ctr = [[YLEditableViewController alloc] init];
        [self.navigationController pushViewController:ctr animated:YES];
    }
    else if ([tag isEqualToString:@"7"]) {
        YLAdaptFontViewController *ctr = [[YLAdaptFontViewController alloc] init];
        [self.navigationController pushViewController:ctr animated:YES];
    }
    else if ([tag isEqualToString:@"8"]) {
        YLSelectTimeViewController *ctr = [[YLSelectTimeViewController alloc] init];
        [self.navigationController pushViewController:ctr animated:YES];
    }
    else if ([tag isEqualToString:@"9"]) {
        YLRunWebViewViewController *ctr = [[YLRunWebViewViewController alloc] init];
        [self.navigationController pushViewController:ctr animated:YES];
    }
    else if ([tag isEqualToString:@"10"]) {
        YLSphereTagCloudViewController *ctr = [[YLSphereTagCloudViewController alloc] init];
        [self.navigationController pushViewController:ctr animated:YES];
    }
    else if ([tag isEqualToString:@"11"]) {
        YLRollingViewController *ctr = [[YLRollingViewController alloc] init];
        [self.navigationController pushViewController:ctr animated:YES]; 
    }
    else if ([tag isEqualToString:@"12"]) {
        YLMenuViewController *ctr = [[YLMenuViewController alloc] init];
        [self.navigationController pushViewController:ctr animated:YES];
    }
    else if ([tag isEqualToString:@"13"]) {
        YLUnlimitedViewController *ctr = [[YLUnlimitedViewController alloc] init];
        [self.navigationController pushViewController:ctr animated:YES];
    }
    else if ([tag isEqualToString:@"14"]) {
        YLUnlimitedViewController *ctr = [[YLUnlimitedViewController alloc] init];
        [self.navigationController pushViewController:ctr animated:YES];
    }
    else if ([tag isEqualToString:@"15"]) {
        YLsimpleButtonsViewController *ctr = [[YLsimpleButtonsViewController alloc] init];
        [self.navigationController pushViewController:ctr animated:YES];
    }
    else if ([tag isEqualToString:@"16"]) {
        YLCustomProgressViewController *ctr = [[YLCustomProgressViewController alloc] init];
        [self.navigationController pushViewController:ctr animated:YES];
    }
    else if ([tag isEqualToString:@"17"]) {
        YLPieChartViewController *ctr = [[YLPieChartViewController alloc] init];
        [self.navigationController pushViewController:ctr animated:YES];
    }
    else if ([tag isEqualToString:@"18"]) {
        YLHistogramViewController *ctr = [[YLHistogramViewController alloc] init];
        [self.navigationController pushViewController:ctr animated:YES];
    }
    else if ([tag isEqualToString:@"19"]) {
        YLdrawingPicViewController *ctr = [[YLdrawingPicViewController alloc] init];
        [self.navigationController pushViewController:ctr animated:YES];
    }
}
@end
