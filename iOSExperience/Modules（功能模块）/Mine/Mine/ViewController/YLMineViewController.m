//
//  YLMineViewController.m
//  iOSExperience
//
//  Created by Ben Lv on 2018/9/11.
//  Copyright © 2018年 avatar. All rights reserved.
//

#import "YLMineViewController.h"
#import "YLSettingViewController.h"
#import "YLMineHeaderView.h"
#import "YLMineDefaultCell.h"
#import <YYKit.h>

#import <Masonry.h>
@interface YLMineViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    NSArray *_dateSouce;
    YLMineHeaderView *_headerView;
    UIView *_NavView;
}
@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)YLMineHeaderView *headerView;
@end

@implementation YLMineViewController


#pragma mark - life cycle

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:YES];
    
}
- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
     [self.navigationController setNavigationBarHidden:NO animated:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    

//    self.navigationController.navigationBar.hidden  = YES;
    [self buildUI];
    [self loadDataSouce];
}


#pragma mark - public methods

#pragma mark - private methods
- (void)buildUI {
    
    [self.view addSubview:self.tableView];
    [self initConstraints];
    [self createNav];
    
}
//自定义导航栏
-(void)createNav{
    _NavView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 64)];
    _NavView.backgroundColor = [UIColor clearColor];
    
    UILabel * titlelbl = [[UILabel alloc] initWithFrame:CGRectMake(0, 20, self.view.bounds.size.width/2, 44 )];
    titlelbl.centerX = _NavView.frame.size.width/2;
    titlelbl.textAlignment = NSTextAlignmentCenter;
    titlelbl.font= [UIFont systemFontOfSize:17];
    titlelbl.textColor =[UIColor whiteColor];
    titlelbl.text = self.title;
    [_NavView addSubview:titlelbl];
    
    UIButton * btn = [UIButton buttonWithType:UIButtonTypeSystem];
    [btn setTitle:@"设置" forState:UIControlStateNormal];
    btn.titleLabel.font = [UIFont systemFontOfSize:16];
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [btn sizeToFit];
    btn.frame = CGRectMake(_NavView.width - btn.width - 15, 20, btn.width, 40);
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(goToSetting) forControlEvents:UIControlEventTouchUpInside];
    
    [_NavView addSubview:btn];
    
    [self.view addSubview:_NavView];
}

- (void)loadDataSouce {
    
//    @property (weak, nonatomic) IBOutlet UIImageView *icon;
//    @property (weak, nonatomic) IBOutlet UILabel *textLabel;
//    @property (weak, nonatomic) IBOutlet UIImageView *promptIcon;
    
    NSDictionary *dic1 = @{@"icon":@"name",@"textLabel":@"昵称",@"promptIcon":@"右箭头",@"detaillabel":@"Ben"};
    NSDictionary *dic2 = @{@"icon":@"gender",@"textLabel":@"性别",@"promptIcon":@"右箭头",@"detaillabel":@"难"};
    NSDictionary *dic3 = @{@"icon":@"friend",@"textLabel":@"我的好友",@"promptIcon":@"右箭头",@"detaillabel":@""};
    NSDictionary *dic4 = @{@"icon":@"rank",@"textLabel":@"等级",@"promptIcon":@"右箭头",@"detaillabel":@"100+"};
    
    _dateSouce = @[dic1,dic2,dic3,dic4];
    
}

- (void)initConstraints {
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
}

- (void)goToSetting {
    YLSettingViewController *ctr = [[YLSettingViewController alloc] init];
    [self.navigationController pushViewController:ctr animated:YES];
    
}
#pragma mark - lazy loading
- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableView.tableFooterView = [UIView new];
        _tableView.dataSource = self;
        _tableView.delegate = self;
        [_tableView setContentInset:UIEdgeInsetsMake(260, 0, 0, 0)];
        
      _headerView  =   [[YLMineHeaderView alloc] initWithFrame:CGRectMake(0, -280, self.view.bounds.size.width, 280)];
        [_tableView addSubview:_headerView];
//        _tableView.tableHeaderView = [[YLMineHeaderView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 230)];
//        [_tableView registerNib:[UINib nibWithNibName:@"YLMineDefaultCell" bundle:nil] forHeaderFooterViewReuseIdentifier:NSStringFromClass([YLMineDefaultCell class])];
        [_tableView registerNib:[UINib nibWithNibName:@"YLMineDefaultCell" bundle:nil] forCellReuseIdentifier:NSStringFromClass([YLMineDefaultCell class])];
        
    }
    return _tableView;
    
}
#pragma mark - dataSouce
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (_dateSouce.count>0) {
        return _dateSouce.count;
    }else {
        return 0;
    }
    
    
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    YLMineDefaultCell *cell =  [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([YLMineDefaultCell class])];
    
    cell.dataSouce = _dateSouce[indexPath.row];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
    
}
#pragma mark - delegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    CGFloat offset = scrollView.contentOffset.y ;
    CGFloat totalOffsetY = scrollView.contentInset.top + offset;
    
//    NSLog(@"offset    %.f   totalOffsetY %.f",offset,totalOffsetY);
    //    if (totalOffsetY < 0) {
    _headerView.frame = CGRectMake(0, offset, self.view.bounds.size.width, 260- totalOffsetY);
    //    }
    
}
@end
