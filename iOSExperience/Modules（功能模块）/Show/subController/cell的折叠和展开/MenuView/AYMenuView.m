//
//  AYMenuView.m
//  AYMenuList
//
//  Created by Andy on 2017/4/26.
//  Copyright © 2017年 Andy. All rights reserved.
//

#import "AYMenuView.h"
#import "AYMenuItem.h"
#import "AYMenuData.h"
#import "AYMenuCell.h"

#import "YLMenuCell.h"
#import "YLMenuCellModel.h"

@interface AYMenuView ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic , strong)UITableView *tableView;

@property (nonatomic , strong)NSMutableArray<AYMenuItem*> *dataArray;

@property (nonatomic , strong)AYMenuData *menuData;

@end

@implementation AYMenuView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        
        _tableView = [[UITableView alloc] initWithFrame:frame];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [_tableView setContentInset:UIEdgeInsetsMake(0, 0, 64, 0)];
        
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [_tableView registerClass:[YLMenuCell class] forCellReuseIdentifier:NSStringFromClass([YLMenuCell class])];
        [self addSubview:_tableView];
        
    }
    return self;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArray.count;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
//    AYMenuItem *item = self.dataArray[indexPath.row];
    id model = self.dataArray[indexPath.row];
    if ([self.delegate respondsToSelector:@selector(ay_menuView:tableView:cellForRowWithMenuItem:)]) {
        return [self.delegate ay_menuView:self tableView:tableView cellForRowWithMenuItem:model];
    }
    if ([model isKindOfClass:[AYMenuItem class]]) {
        AYMenuItem *menuItem = (AYMenuItem *)model;
        AYMenuCell *cell = [tableView dequeueReusableCellWithIdentifier:@"menuCellStr"];
        
        if (!cell) {
            cell = [[[NSBundle mainBundle] loadNibNamed:@"AYMenuCell" owner:nil options:nil] lastObject];
        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.item = menuItem;
        return cell;
    }
    else if ([model isKindOfClass:[YLMenuCellModel class]]) {
      YLMenuCellModel *menuModel = (YLMenuCellModel *)model;
      YLMenuCell *cell =  [self.tableView dequeueReusableCellWithIdentifier:NSStringFromClass([YLMenuCell class]) forIndexPath:indexPath];
        cell.model = menuModel;
        return cell;
    }
    else {
        return nil;
    }
    
    
}






- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(nonnull NSIndexPath *)indexPath{

    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
    id model = _dataArray[indexPath.row];
    if ([model isKindOfClass:[AYMenuItem class]]) {
        AYMenuItem *item= (AYMenuItem *)model;
        
        if (item.subItems == nil) {
            if ([self.delegate respondsToSelector:@selector(ay_menuView:didDeselectRowAtIndexPath:)]){
                [self.delegate ay_menuView:self didDeselectRowAtIndexPath:indexPath];
            }
            return;
        }
        
        
        //此时本菜单已经处于关闭状态
        if (item.isSubItemsOpen) {
            NSArray *arr = [self.menuData ay_removeMenuAtIndexPaths:item];
            if (arr.count > 0) {
                [tableView deleteRowsAtIndexPaths:arr withRowAnimation:UITableViewRowAnimationNone];
                
            }
        }else{
            NSArray *arr = [self.menuData ay_insertMenuAtIndexPaths:item];
            if (arr.count > 0) {
                [tableView insertRowsAtIndexPaths:arr withRowAnimation:UITableViewRowAnimationNone];
            }
        }
        
        //此时本菜单已经处于打开状态
        if (![self.delegate respondsToSelector:@selector(ay_menuView:tableView:cellForRowWithMenuItem:)]) {
            AYMenuCell *cell = [tableView cellForRowAtIndexPath:indexPath];
            if (item.isSubItemsOpen) {
                cell.menuImgView.transform = CGAffineTransformMakeRotation(M_PI_2);
            }else{
                cell.menuImgView.transform = CGAffineTransformMakeRotation(0);
            }
        }
    }
    else if ([model isKindOfClass:[YLMenuCellModel class]]){
        NSLog(@"%@",model);
        YLMenuCellModel *meNuModel = (YLMenuCellModel *)model;
        if ([_delegate respondsToSelector:@selector(ay_menuView:didSelectsubView:)]) {
            [_delegate ay_menuView:self didSelectsubView:meNuModel];
        }
    }
    
 
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    id model = self.dataArray[indexPath.row];
    if ([model isKindOfClass:[YLMenuCellModel class]]) {
        return 50;
    }else {
        return 44;
    }
    
}
#pragma mark ---- 懒加载 ----
- (NSMutableArray *)dataArray{
    if (!_dataArray) {
        
        if ([self.delegate respondsToSelector:@selector(ay_dataArrayInMenuView:)]) {
            _dataArray = [self.delegate ay_dataArrayInMenuView:self];
        }else{
            _dataArray = [NSMutableArray array];
        }
    }
    return _dataArray;
}


- (AYMenuData *)menuData{
    if (!_menuData) {
        _menuData = [[AYMenuData alloc] init];
        _menuData.menuData = self.dataArray;
    }
    return _menuData;
}


- (void)reload {
    [self.tableView reloadData];
}


@end
