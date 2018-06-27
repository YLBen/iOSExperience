//
//  YLMenuViewController.m
//  iOSExperience
//
//  Created by Ben Lv on 2018/6/27.
//  Copyright © 2018年 avatar. All rights reserved.
//

#import "YLMenuViewController.h"

#import "AYMenuItem.h"
#import "AYMenuData.h"
#import "AYMenuView.h"

#import "YLMenuCellModel.h"
#import <Masonry.h>

#import "YLMenuPushViewController.h"
@interface YLMenuViewController ()<AYMenuViewDelegate>
@property (nonatomic , strong)NSMutableArray *dataArray;
@property(nonatomic,strong)AYMenuView *munuView;

@end

@implementation YLMenuViewController

#pragma mark - life cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    [self buildUI];
    [self loadDataSouce];
    
    
}
#pragma mark - public methods

#pragma mark - private methods
- (void)loadDataSouce {
    self.dataArray = [self getDataSouce];
//    [self.munuView reload];
}

- (void)initConstraints {
    [self.munuView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view);
        make.top.equalTo(self.view);
        make.bottom.equalTo(self.view.mas_bottom).offset(-20);
    }];
}

- (void)buildUI {
    [self.view addSubview:self.munuView];
    [self initConstraints];
}
#pragma mark - getter && setter

#pragma mark - lazy loading
- (AYMenuView *)munuView {
    if (!_munuView) {
        _munuView = [[AYMenuView alloc] initWithFrame:self.view.frame];
        _munuView.delegate = self;
        
    }
    return _munuView;
}

- (NSMutableArray *)dataArray {
    if (!_dataArray) {
        _dataArray = [[NSMutableArray alloc] init];
    }
    return _dataArray;
    
}



#pragma mark - delegate
- (void)ay_menuView:(AYMenuView *)menuView didDeselectRowAtIndexPath:(NSIndexPath *)indexPaths{
    id model = self.dataArray[indexPaths.row];
    NSLog(@"分组%@",model);
    
}

- (NSMutableArray *)ay_dataArrayInMenuView:(AYMenuView *)menuView{
    return self.dataArray;
}
- (void)ay_menuView:(AYMenuView *)menuView didSelectsubView:(YLMenuCellModel *)model {
    NSLog(@"%@",model);
    YLMenuPushViewController *ctr = [[YLMenuPushViewController alloc] init];
    [self.navigationController pushViewController:ctr animated:YES];
    
}

#pragma mark - ViewModel
- (NSArray *)getDataSouce {
    NSMutableArray *dataSouce = [[NSMutableArray alloc] init];
    for (int i = 0 ; i < 5; i++) {
    AYMenuItem *rootItem = [[AYMenuItem alloc] init];
        rootItem.title = [NSString stringWithFormat:@"好友分组%d",i];
        rootItem.level = 1;
        rootItem.isSubCascadeOpen = NO;
        rootItem.isSubItemsOpen = NO;
        
        NSMutableArray *subArray = [NSMutableArray array];
        for (int j = 0; j < 7 ; j++) {
            YLMenuCellModel *model = [[YLMenuCellModel alloc] init];
            model.nickName = @"张伟";
            model.mark = @"今天吃鸡了！今天吃鸡了！今天吃鸡了！";
            model.picUrl = @"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1530080056767&di=ef8fe8c492020f10a91dd2fbe0402940&imgtype=0&src=http%3A%2F%2Fwww.chuangyimao.com%2Fuploads%2Fnews%2F20150130%2F20150130090123ad7e329845.jpg";
            [subArray addObject:model];
        }
        rootItem.subItems = subArray;
        [dataSouce addObject:rootItem];
    }
    return dataSouce;
}

@end
