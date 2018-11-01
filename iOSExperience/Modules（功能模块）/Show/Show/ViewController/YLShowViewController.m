//
//  YLShowViewController.m
//  iOSExperience
//
//  Created by Ben Lv on 2018/5/27.
//  Copyright © 2018年 avatar. All rights reserved.
//

#import "YLShowViewController.h"
// Controller
#import "YLShowViewController+add.h"

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

@property(nonatomic,strong)NSMutableArray *logs;
@end

@implementation YLShowViewController

#pragma mark - life cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.showListView];
    [self initConstraints];
    [self loadDataSouce];
    self.navigationController.navigationBar.barTintColor = [UIColor whiteColor];
//    self.automaticallyAdjustsScrollViewInsets = NO;
////    KVO 监听tableView 偏移量
//    [self.showListView.tableView addObserver: self forKeyPath: @"contentOffset" options: NSKeyValueObservingOptionNew context: nil];
//
//    自定义下拉刷新
    self.logs = [[NSMutableArray alloc] init];
    NSDate *date = [[NSDate alloc] init];
    [self.logs addObject:date];

    UIRefreshControl *rc = [[UIRefreshControl alloc] init];
    rc.attributedTitle = [[NSAttributedString alloc] initWithString:@"下拉刷新"];
    [rc addTarget:self action:@selector(refreshTableView) forControlEvents:UIControlEventValueChanged];
    self.showListView.tableView.refreshControl = rc;
    
}

- (void)dealloc {
//    [self.showListView removeObserver:self forKeyPath:@"contentOffset"];
//    self.showListView = nil;
//    NSLog(@"showListView被移除了");
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

- (void)refreshTableView {
    if (self.showListView.tableView.refreshControl.refreshing) {
        self.showListView.tableView.refreshControl.attributedTitle = [[NSAttributedString alloc] initWithString:@"加载中"];
        [self.showListView.tableView.refreshControl endRefreshing];
//        self.showListView.tableView.refreshControl.attributedTitle = [[NSAttributedString alloc] initWithString:@"下拉刷新"];
        [self.showListView.tableView reloadData];
    }
    
}
#pragma mark - KVO
/**
 *  监听属性值发生改变时回调
// */
//- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context
//{
//
//    CGFloat offset = self.showListView.tableView.contentOffset.y;
//    CGFloat delta = offset / 64.f + 1.f;
//    delta = MAX(0, delta);
////    if (delta > 0.7) {
//        self.navigationController.navigationBar.alpha = MIN(1, delta);
////    }
//
//}

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

#pragma mark - delegate
- (void)YLShowListView:(YLShowListView *)showListView WithTag:(NSString *)tag {
    [self pushToViewControllerWithTag:tag];

    
}
@end
