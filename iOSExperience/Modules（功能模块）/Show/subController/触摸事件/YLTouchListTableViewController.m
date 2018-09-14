//
//  YLTouchListTableViewController.m
//  iOSExperience
//
//  Created by Ben Lv on 2018/8/27.
//  Copyright © 2018年 avatar. All rights reserved.
//

#import "YLTouchListTableViewController.h"

@interface YLTouchListTableViewController ()


@end

@implementation YLTouchListTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.dataSouce = [self getDataSouce];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:NSStringFromClass([UITableViewCell class])];
    self.tableView.tableFooterView = [UIView new];
}


- (NSArray *)getDataSouce {
    return @[@"单点事件",@"多点触摸事件"];
}

#pragma mark - dataSocue
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.dataSouce.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *str = self.dataSouce[indexPath.row];
   UITableViewCell *cell =  [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([UITableViewCell class])];
    cell.textLabel.text = str;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
}
@end
