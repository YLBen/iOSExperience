//
//  YLEditableViewController.m
//  iOSExperience
//
//  Created by Ben Lv on 2018/6/7.
//  Copyright © 2018年 avatar. All rights reserved.
//

#import "YLEditableViewController.h"
#import <Masonry.h>
@interface YLEditableViewController ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)NSMutableArray *dataSouce;
@property(nonatomic,strong)NSMutableArray *selectArray;
@property(nonatomic,strong)NSMutableArray *selectIndex;
@property(nonatomic,strong)UIButton *AllSelectedBtn;
@property(nonatomic,strong)UIButton *deleteBtn;


@end

@implementation YLEditableViewController

#pragma mark - life cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.tableView];
    self.dataSouce = [self getDataSouce];
    [self.view addSubview:self.AllSelectedBtn];
    [self.view addSubview:self.deleteBtn];
    [self initConstraints];
}
#pragma mark - getter && setter
#pragma mark -  private methods
- (void)initConstraints {
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    [self.AllSelectedBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left);
        make.bottom.equalTo(self.view.mas_bottom);
        make.width.mas_equalTo(SCREEN_WIDTH/2);
        make.height.mas_equalTo(50);
    }];
    [self.deleteBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.view.mas_right);
        make.bottom.equalTo(self.view.mas_bottom);
        make.width.equalTo(self.AllSelectedBtn);
        make.height.mas_equalTo(50);
    }];
    
}


-(NSMutableArray *)getDataSouce
{
    NSMutableArray *array = [[NSMutableArray alloc] init];
    for (int i=0; i<30; i++) {
        [array addObject:[NSString stringWithFormat:@"day%d",i]];
    }
    
    return array;
}
//全选逻辑   选中后 移除数据源再重新加载一次
-(void)AllSelectedBtnClick:(UIButton *)button
{
    button.selected = !button.selected;
    if (button.selected) {
        //==================全选================
        //选中tableView中所有的indexPath
        NSArray * array = [_tableView indexPathsForRowsInRect:CGRectMake(0, 0,SCREEN_WIDTH, _tableView.contentSize.height)];
        for (NSIndexPath * indexPath in array) {
            [_tableView selectRowAtIndexPath:indexPath animated:YES scrollPosition:UITableViewScrollPositionNone];
        }
        [self.selectArray removeAllObjects];
        [self.selectArray addObjectsFromArray:self.dataSouce];
        [self.selectIndex addObjectsFromArray:array];
    }else{
        
        //============全选清空====================
        for (NSIndexPath * indexPath in _selectArray) {
            [_tableView deselectRowAtIndexPath:indexPath animated:YES];
        }
        //将选中下标数组清空
        [self.selectArray removeAllObjects];
        [self.selectIndex removeAllObjects];
        [_tableView reloadData];
    }
    
}
-(void)deleteBtnClick:(UIButton *)button
{
    NSLog(@"删除");
    [self.dataSouce removeObjectsInArray:self.selectArray];
    [_tableView deleteRowsAtIndexPaths:self.selectIndex withRowAnimation:UITableViewRowAnimationLeft];
    [self.selectIndex removeAllObjects];
    [self.selectArray removeAllObjects];
    
    
    //    [self.tableView reloadData];
}
#pragma mark - public methods


#pragma mark - Lazy loading
-(NSMutableArray *)selectIndex
{
    if (!_selectIndex) {
        _selectIndex = [[NSMutableArray alloc] init];
    }
    return _selectIndex;
}
-(NSMutableArray *)selectArray
{
    if (!_selectArray) {
        _selectArray = [[NSMutableArray alloc] init];
    }
    return _selectArray;
}
-(UIButton *)AllSelectedBtn
{
    if (!_AllSelectedBtn) {
        _AllSelectedBtn = [[UIButton alloc] init];
        _AllSelectedBtn.backgroundColor = [UIColor redColor];
        [_AllSelectedBtn setTitle:@"全选" forState:UIControlStateNormal];
        [_AllSelectedBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_AllSelectedBtn addTarget:self action:@selector(AllSelectedBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _AllSelectedBtn;
}
-(UIButton *)deleteBtn
{
    if (!_deleteBtn) {
        
        _deleteBtn = [[UIButton alloc] init];
        _deleteBtn.backgroundColor = [UIColor grayColor];
        [_deleteBtn setTitle:@"删除" forState: UIControlStateNormal];
        [_deleteBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_deleteBtn addTarget:self action:@selector(deleteBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _deleteBtn;
}

-(UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        //        分割线颜色
        _tableView.separatorColor = [UIColor redColor];
        //        分割线类型
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        //        设置tableVIew可以编辑
        [_tableView setEditing:YES animated:YES];
        //        背景颜色
        //        _tableView.backgroundColor
        //        背景图片
        //        _tableView.backgroundView
        //        _tableVie
        
    }
    return _tableView;
}

#pragma mark -  DataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataSouce.count;
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:NSStringFromClass([UITableViewCell class])];
    //    选中是会出现蓝色背景，要是感觉不好看，可以修改
    cell.multipleSelectionBackgroundView = [UIView new];
    //    修改有点击选中图标的颜色
    cell.tintColor = [UIColor blueColor];
    
    cell.textLabel.text = self.dataSouce[indexPath.row];
    //    cell的选中效果
    //    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
    
}
#pragma mark -  Delegate
- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath{
    return UITableViewCellEditingStyleDelete | UITableViewCellEditingStyleInsert;
}

//已经选中了某一行
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([self.selectArray containsObject:self.dataSouce[indexPath.row]]) {
        return;
    }
    if ([self.selectIndex containsObject:indexPath]) {
        return;
    }
    [self.selectArray addObject:self.dataSouce[indexPath.row]];
    [self.selectIndex addObject:indexPath];
}
//不选的时候删除
- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.selectArray removeObject:self.dataSouce[indexPath.row]];
    [self.selectIndex removeObject:indexPath];
}

@end
