//
//  YLAdvancedViewController.m
//  iOSExperience
//
//  Created by Ben Lv on 2018/10/9.
//  Copyright © 2018年 avatar. All rights reserved.
//

#import "YLAdvancedViewController.h"
#import "YLAdvancedViewController+add.h"
// View
#import "YLShowListView.h"
// ViewModel
#import "YLAdvancedViewModel.h"

#import <Masonry.h>
@interface YLAdvancedViewController ()<YLShowListViewDelegate>
@property(nonatomic,strong)YLShowListView *showListView;
@property(nonatomic,strong)YLAdvancedViewModel *viewModel;

@end

@implementation YLAdvancedViewController

#pragma mark - life cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.showListView];
    [self initConstraints];
    [self getDataSouce];
    
}
#pragma mark - public methods

#pragma mark - private methods
- (void)initConstraints {
    [self.showListView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
}

- (void)getDataSouce {
   self.showListView.dataSouce = [YLAdvancedViewModel getDataSouce];
    
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
- (YLAdvancedViewModel *)viewModel {
    if (!_viewModel) {
        _viewModel = [[YLAdvancedViewModel alloc] init];
        _viewModel.viewController = self;
    }
    return _viewModel;
    
}


#pragma mark - delegate
-(void)YLShowListView:(YLShowListView *)showListView WithTag:(NSString *)tag {
    [self pushToViewControllerWithTag:tag];
    
}
@end
