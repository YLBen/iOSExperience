//
//  YLLeftMenuTableViewController.m
//  iOSExperience
//
//  Created by Ben Lv on 2018/12/3.
//  Copyright © 2018年 avatar. All rights reserved.
//

#import "YLLeftMenuTableViewController.h"

#import "ToViewControllerNeedsConform.h"
#import "FlowingMenuTransitionManager.h"

@interface YLLeftMenuTableViewController ()<ToViewControllerNeedsConform>
@property(nonatomic,strong)NSArray *dataSouce;
@property(strong, nonatomic) FlowingMenuTransitionManager *manager;
@end

@implementation YLLeftMenuTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:NSStringFromClass([UITableViewCell class])];
    self.manager = [FlowingMenuTransitionManager manager];
    self.transitioningDelegate = self.manager;
    self.manager.toVCDelegate = self;
    
    
}
-(void)flowingMenuNeedsDismissMenu
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.dataSouce.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *str = self.dataSouce[indexPath.row];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([UITableViewCell class])];
    cell.textLabel.text = str;
    return cell;
}

- (NSArray *)dataSouce{
    if (!_dataSouce) {
        NSMutableArray *muArray = [[NSMutableArray alloc] init];
        for (int i = 0; i<40; i++) {
            [muArray addObject:[NSString stringWithFormat:@"数据%d",i]];
        }
        return muArray.copy;
    }
    return _dataSouce;
    
}


@end
