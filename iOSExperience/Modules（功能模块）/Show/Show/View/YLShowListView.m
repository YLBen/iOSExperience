//
//  YLShowListView.m
//  iOSExperience
//
//  Created by Ben Lv on 2018/5/27.
//  Copyright © 2018年 avatar. All rights reserved.
//

#import "YLShowListView.h"

// model
#import "YLShowListCellModel.h"
// View

// ViewModel

// tools
#import <MJRefresh/MJRefresh.h>
// category

// third party
#import <Masonry.h>
@interface YLShowListView()<UITableViewDelegate,UITableViewDataSource>


@end

@implementation YLShowListView
#pragma mark - life cycle
- (instancetype)init {
    self = [super init];
    if (self) {
        [self addSubview:self.tableView];
        [self initConstraint];
        
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    NSLog(@"%@",NSStringFromCGRect(self.tableView.frame));
    
}
#pragma mark - public methods

#pragma mark - private methods
- (void)initConstraint {
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.equalTo(self);
        make.bottom.equalTo(self.mas_bottom);
    }];
}

- (void)loadNewData {
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.tableView.mj_header endRefreshing];
    });
    
}

- (void)loadMoreData {
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.tableView.mj_footer endRefreshing];
    });
    
}
#pragma mark - getter && setter
- (void)setDataSouce:(NSArray *)dataSouce {
    _dataSouce = dataSouce;
    [self.tableView reloadData];
}
#pragma mark - lazy loading
- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.tableFooterView = [UIView new];
        MJRefreshGifHeader *header = [MJRefreshGifHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewData)];
        // 设置普通状态的动画图片
        NSArray *idleImages = @[[UIImage imageNamed:@"01"], [UIImage imageNamed:@"02"], [UIImage imageNamed:@"03"]];
        [header setImages:idleImages forState:MJRefreshStateIdle];
        
        // 设置即将刷新状态的动画图片（一松开就会刷新的状态）
        NSArray *pullingImages = @[[UIImage imageNamed:@"04"], [UIImage imageNamed:@"05"], [UIImage imageNamed:@"06"]];
        [header setImages:pullingImages forState:MJRefreshStatePulling];
        
        // 设置正在刷新状态的动画图片
        NSArray *refreshingImages = @[[UIImage imageNamed:@"07"], [UIImage imageNamed:@"08"], [UIImage imageNamed:@"09"]];
        [header setImages:refreshingImages forState:MJRefreshStateRefreshing];
//        // 隐藏时间
//        header.lastUpdatedTimeLabel.hidden = YES;
//
//        // 隐藏状态
//        header.stateLabel.hidden = YES;
        // 设置 header
        _tableView.mj_header = header;
        _tableView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreData)];
        
//        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:NSStringFromClass([UITableViewCell class])];
    }
    return _tableView;
}
#pragma mark - dataSouce
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataSouce.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    id model = self.dataSouce[indexPath.row];
    if ([model isKindOfClass:[YLShowListCellModel class]]) {
        YLShowListCellModel *showListCellModel = (YLShowListCellModel *)model;
        
//        tableView的复用问题
//       UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([UIFont class])];
         UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
        if (!cell) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:NSStringFromClass([UIFont class])];
        }

        
        if (showListCellModel.isShow.boolValue) {
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        }
        cell.textLabel.text = showListCellModel.letfTitle;
        cell.detailTextLabel.text = showListCellModel.rightTitle;
        
        return cell;
        
    }else{
        return nil;
    }
    
}
#pragma mark - delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    id model = self.dataSouce[indexPath.row];
    if ([model isKindOfClass:[YLShowListCellModel class]]) {
        YLShowListCellModel *showListCellModel = (YLShowListCellModel *)model;
        
            if ([_delegate respondsToSelector:@selector(YLShowListView:WithTag:)]) {
                [_delegate YLShowListView:self WithTag:showListCellModel.tag];
            }
        
    }
}





@end
