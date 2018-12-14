//
//  YLWaterFallLayoutViewController.m
//  iOSExperience
//
//  Created by Ben Lv on 2018/12/12.
//  Copyright © 2018年 avatar. All rights reserved.
//

#import "YLWaterFallLayoutViewController.h"
#import "YLWaterFallLayoutModel.h"
#import "YLWaterFallCollectionViewCell.h"
#import <Masonry.h>
#import "YLWaterFallLayout.h"
@interface YLWaterFallLayoutViewController ()<UICollectionViewDataSource>
@property (nonatomic,strong) UICollectionView *collectionView;
@property(nonatomic,strong)NSArray<YLWaterFallLayoutModel *> *dataSource;

@end

@implementation YLWaterFallLayoutViewController

#pragma mark - life cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"CollectionView瀑布流";
    YLWaterFallLayout *layout = [[YLWaterFallLayout alloc] initWithColumnCount:3];
    [layout setColumnSpacing:10 rowSpacing:10 sectionInset:UIEdgeInsetsMake(10, 10, 20, 10)];
    [layout setGetItemHeightBlock:^CGFloat(CGFloat itemHeight, NSIndexPath * _Nonnull indexPath) {
        YLWaterFallLayoutModel *model = self.dataSource[indexPath.item];
        return model.height.floatValue / model.width.floatValue * itemHeight;
    }];
    
    
    _collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:layout];
    _collectionView.backgroundColor = [UIColor whiteColor];
    [_collectionView registerClass:[YLWaterFallCollectionViewCell class] forCellWithReuseIdentifier:NSStringFromClass([YLWaterFallCollectionViewCell class])];
    _collectionView.dataSource = self;
    [self.view addSubview:_collectionView];
    [self getDataSource];
}
#pragma mark - public methods
- (void)setDataSource:(NSArray<YLWaterFallLayoutModel *> *)dataSource {
    _dataSource = dataSource;
    [self.collectionView reloadData];
    
}
#pragma mark - private methods
- (void)getDataSource {
    NSString *path = [[NSBundle mainBundle] pathForResource:@"waterFall.plist" ofType:nil];
    NSArray *dataDics = [NSArray arrayWithContentsOfFile:path];
    self.dataSource = [YLWaterFallLayoutModel decodeFromArray:dataDics];
    
}


#pragma mark - dataSouce
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    return self.dataSource.count;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"数据源触发");
    YLWaterFallCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([YLWaterFallCollectionViewCell class]) forIndexPath:indexPath];
    cell.model = self.dataSource[indexPath.item];
    //cell.image.frame = cell.bounds;
    
    return cell;
}

@end
