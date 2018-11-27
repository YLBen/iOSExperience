//
//  YLPassByValueTableViewController.m
//  iOSExperience
//
//  Created by Ben Lv on 2018/11/12.
//  Copyright © 2018年 avatar. All rights reserved.
//

#import "YLPassByValueTableViewController.h"

@interface YLPassByValueTableViewController ()
@property(nonatomic,strong)NSArray *dataSource;

@end

@implementation YLPassByValueTableViewController

#pragma mark - life cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.tableFooterView = [UIView new];
    self.dataSource = [self getDataSource];
    [self.tableView reloadData];
}
#pragma mark - public methods

#pragma mark - private methods
- (NSArray *)getDataSource {
    return @[@"代理",@"通知",@"单例",@"block",@"extern",@"KVO"];
}
#pragma mark - getter && setter
- (void)setDataSource:(NSArray *)dataSource {
    _dataSource = dataSource;
    [self.tableView reloadData];
}
#pragma mark - lazy loading

#pragma mark - dataSouce
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataSource.count;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    cell.textLabel.text = self.dataSource[indexPath.row];
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
}
#pragma mark - delegate

- (void)dealloc {
    
    
}
@end
