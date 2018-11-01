//
//  YLTouchListTableViewController.m
//  iOSExperience
//
//  Created by Ben Lv on 2018/8/27.
//  Copyright © 2018年 avatar. All rights reserved.
//

#import "YLTouchListTableViewController.h"
#import "YL56ViewController.h"
@interface YLTouchListTableViewController ()<YL56ViewControllerDelegate>


@end

@implementation YLTouchListTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.dataSouce = [self getDataSouce];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:NSStringFromClass([UITableViewCell class])];
    self.tableView.tableFooterView = [UIView new];
}


- (NSArray *)getDataSouce {
//    return @[@"单点事件",@"多点触摸事件"];
    NSMutableArray *mu = [[NSMutableArray alloc] init];
    [mu addObject:@"单点事件"];
    [mu addObject:@"多点触摸事件"];
    return mu;
    
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
    YL56ViewController *ctr =[[YL56ViewController alloc] init];
    ctr.delegate = self;
    [self.navigationController pushViewController:ctr animated:YES];
    
}

-(void)yyyuy:(NSString *)str {
    [self.dataSouce addObject:str];
    [self.tableView reloadData];
    
}
@end
