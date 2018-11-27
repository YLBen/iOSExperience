//
//  YLSettingViewController.m
//  iOSExperience
//
//  Created by Ben Lv on 2018/9/13.
//  Copyright © 2018年 avatar. All rights reserved.
//

#import "YLSettingViewController.h"

#import "YLSettingModel.h"

#import <Masonry.h>
#import "UIViewController+AlertViewAndActionSheet.h"
#import "AppDelegate.h"

#import "YLFileMannger.h"
@interface YLSettingViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)NSArray *dataSouce;
@end

@implementation YLSettingViewController

#pragma mark - life cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"设置";
//    self.navigationController.navigationBar.hidden = NO;
    [self buildUI];
    [self getDataSrouce];
    
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
//    self.navigationController.navigationBar.hidden = YES;
}


-(void)viewDidLayoutSubviews
{
    if ([self.tableView respondsToSelector:@selector(setSeparatorInset:)]) {
        [self.tableView setSeparatorInset:UIEdgeInsetsMake(0,0,0,0)];
    }
    
    if ([self.tableView respondsToSelector:@selector(setLayoutMargins:)]) {
        [self.tableView setLayoutMargins:UIEdgeInsetsMake(0,0,0,0)];
    }
}

-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([cell respondsToSelector:@selector(setSeparatorInset:)]) {
        [cell setSeparatorInset:UIEdgeInsetsZero];
    }
    
    if ([cell respondsToSelector:@selector(setLayoutMargins:)]) {
        [cell setLayoutMargins:UIEdgeInsetsZero];
    }
}
#pragma mark - public methods

#pragma mark - private methods
- (void)logoutAction:(UIButton *)sender {
//    [self AlertWithTitle:@"确定要退出吗？" message:@[@"取消",@"确定"] andOthers:nil animated:YES action:nil];
    [self AlertWithTitle:nil message:@"确定要退出吗？" andOthers:@[@"取消",@"确定"] animated:YES action:^(NSInteger index) {
        if (index == 1) {
            AppDelegate *delegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
//            [delegate.interactor destructorTabbar];
            [delegate.interactor startLogin];
            
        }
        
    }];
}

- (void)setDataSouce:(NSArray *)dataSouce {
    _dataSouce = dataSouce;
    [self.tableView reloadData];
}

- (void)buildUI {
    [self.view addSubview:self.tableView];
    [self initConstraints];
}

- (void)getDataSrouce {
    
    NSDictionary *pushCofigDic = @{
                          @"title":@"推送消息设置",
                          @"isShow":@(1),
                          };
    
    NSDictionary *soundsCofigDic = @{
                          @"title":@"声音",
                          @"detail":@"关",
                          };
    
    NSDictionary *cleanCofigDic = @{
                          @"title":@"清理缓存",
                          };
    
    NSDictionary *aboutCofigDic = @{
                          @"title":@"关于我们",
                          @"isShow":@(1),
                          };
    YLSettingModel *pushCofigModel = [YLSettingModel decodeFromDic:pushCofigDic];
    YLSettingModel *soundsCofigModel = [YLSettingModel decodeFromDic:soundsCofigDic];
    YLSettingModel *cleanCofigModel = [YLSettingModel decodeFromDic:cleanCofigDic];
    cleanCofigModel.detail = [NSString stringWithFormat:@"%.2fM",[self filePath]];
    YLSettingModel *aboutCofigModel = [YLSettingModel decodeFromDic:aboutCofigDic];
    
    NSArray *arr1 = @[pushCofigModel];
    
    NSArray *arr2 = @[soundsCofigModel,cleanCofigModel,aboutCofigModel];
    
    NSArray *arr = @[arr1,arr2];

    self.dataSouce = arr;
    
}

- (void)initConstraints {
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    
}
#pragma mark - getter && setter

#pragma mark - lazy loading
- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
//        好看吧😏
        _tableView.delegate = self;_tableView.dataSource = self;_tableView.tableFooterView = [UIView new];
        UIView *footView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 69)];
        
        UIButton *logoutBtn = [UIButton buttonWithType:UIButtonTypeSystem];
        logoutBtn.frame = CGRectMake(0, 20,self.view.bounds.size.width, 49);
        logoutBtn.titleLabel.font = [UIFont systemFontOfSize:16];
        [logoutBtn setTitle:@"退出登录" forState:UIControlStateNormal];
        [logoutBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        logoutBtn.backgroundColor = [UIColor whiteColor];
        [logoutBtn addTarget:self action:@selector(logoutAction:) forControlEvents:UIControlEventTouchUpInside];
        
        [footView addSubview:logoutBtn];
        
        self.tableView.tableFooterView = footView;
        

    }
    return _tableView;
    
}

#pragma mark ————— 计算缓存大小 —————
// 显示缓存大小
-(float)filePath{
    NSString * cachPath = [ NSSearchPathForDirectoriesInDomains ( NSCachesDirectory , NSUserDomainMask , YES ) firstObject ];
    return [ self folderSizeAtPath :cachPath];
}

-(long long)fileSizeAtPath:(NSString *)path{
    NSFileManager *fileManager=[NSFileManager defaultManager];
    if([fileManager fileExistsAtPath:path]){
        long long size=[fileManager attributesOfItemAtPath:path error:nil].fileSize;
        return size;
    }
    return 0;
}
-(float)folderSizeAtPath:(NSString *)path{
    NSFileManager *fileManager=[NSFileManager defaultManager];
//    NSString *cachePath=[NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) firstObject];
//    cachePath=[cachePath stringByAppendingPathComponent:path];
    NSString *cachePath = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES).firstObject;
    
    long long folderSize=0;
    if ([fileManager fileExistsAtPath:cachePath])
    {
        NSArray *childerFiles=[fileManager subpathsAtPath:cachePath];
        for (NSString *fileName in childerFiles)
        {
            NSString *fileAbsolutePath=[cachePath stringByAppendingPathComponent:fileName];
            long long size=[self fileSizeAtPath:fileAbsolutePath];
            folderSize += size;
            NSLog(@"fileAbsolutePath=%@",fileAbsolutePath);
            
        }
        return folderSize/1024.0/1024.0;
    }
    return 0;
}
#pragma mark - tableView delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
}
#pragma mark - tableView dataSouce
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.dataSouce.count;
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return [self.dataSouce[section] count];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    YLSettingModel *model = self.dataSouce[indexPath.section][indexPath.row];
    static NSString * CellId = @"ben";
    UITableViewCell *cell =[tableView dequeueReusableCellWithIdentifier:CellId];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:CellId];
    }
    cell.textLabel.text = model.title;
    cell.detailTextLabel.text = model.detail;
    if (model.isShow.boolValue) {
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    return cell;
    
}

@end
