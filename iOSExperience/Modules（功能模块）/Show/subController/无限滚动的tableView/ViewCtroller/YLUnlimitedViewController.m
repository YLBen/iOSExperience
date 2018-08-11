//
//  YLUnlimitedViewController.m
//  iOSExperience
//
//  Created by Ben Lv on 2018/7/2.
//  Copyright © 2018年 avatar. All rights reserved.
//

#import "YLUnlimitedViewController.h"
#import "YLMenuCell.h"
#import "SUTableView.h"
int i = 0;

#import <SDWebImage/UIImageView+WebCache.h>
@interface YLUnlimitedViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView * tableView;

@end

@implementation YLUnlimitedViewController

#pragma mark - life cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.tableView];
   
    
}


#pragma mark - public methods

#pragma mark - private methods

#pragma mark - getter && setter

#pragma mark - lazy loading
- (UITableView *)tableView {
    if(!_tableView) {
        _tableView = [[SUTableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.showsVerticalScrollIndicator = NO;
        _tableView.rowHeight = 54.0;
        [_tableView registerClass:[YLMenuCell class] forCellReuseIdentifier:NSStringFromClass([YLMenuCell class])];
    }
    return _tableView;
}
#pragma mark - dataSouce
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    i++;
    YLMenuCell * cell = [self.tableView dequeueReusableCellWithIdentifier:NSStringFromClass([YLMenuCell class])];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.nickNameLab.text = [NSString stringWithFormat:@"%@%d",@"张伟",i];
    cell.markLab.text = @"没错!又是我";
    [cell.icon sd_setImageWithURL:[NSURL URLWithString:@"https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=95715754,4222698147&fm=27&gp=0.jpg"] placeholderImage:[UIImage imageNamed:@"contacts_cell_default_avatar"]];
    return cell;
}
//model.nickName = @"张伟";
//model.mark = @"今天吃鸡了！今天吃鸡了！今天吃鸡了！";
//model.picUrl = @"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1530080056767&di=ef8fe8c492020f10a91dd2fbe0402940&imgtype=0&src=http%3A%2F%2Fwww.chuangyimao.com%2Fuploads%2Fnews%2F20150130%2F20150130090123ad7e329845.jpg";
#pragma mark - delegate

@end
