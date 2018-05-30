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
// model

// View
#import "YLShowListView.h"
// ViewModel
#import "YLShowViewModel.h"
// tools

// category

// third party
#import <Masonry.h>

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

}
#pragma mark - public methods

#pragma mark - private methods
- (void)initConstraints {
    [self.showListView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
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
}
@end
