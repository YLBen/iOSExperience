//
//  YLDefaultCollectionViewController.m
//  iOSExperience
//
//  Created by Ben Lv on 2018/11/5.
//  Copyright © 2018年 avatar. All rights reserved.
//

#import "YLDefaultCollectionViewController.h"

#import "YLCollectionHeaderView.h"
#import "YLCollectionFooterView.h"
#import "YLDefaultCollectionViewCell.h"

@interface YLDefaultCollectionViewController ()<UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
@property (strong, nonatomic) UICollectionView *collectionView;
@end

@implementation YLDefaultCollectionViewController
#pragma mark - life cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    [self initCollectionView];
    self.title = @"普通CollectionView";
}
#pragma mark - public methods

#pragma mark - private methods
/* 初始化容器视图 */
- (void)initCollectionView
{
    CGFloat x = 0;
    CGFloat y = 20;
    CGFloat width = self.view.frame.size.width;
    CGFloat height = self.view.frame.size.height - 20;
    //创建布局对象
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    //设置滚动方向为垂直滚动，说明方块是从左上到右下的布局排列方式
    layout.scrollDirection = UICollectionViewScrollDirectionVertical;
    //设置顶部视图和底部视图的大小，当滚动方向为垂直时，设置宽度无效，当滚动方向为水平时，设置高度无效
    layout.headerReferenceSize = CGSizeMake(100, 40);
    layout.footerReferenceSize = CGSizeMake(100, 40);
    //创建容器视图
    CGRect frame = CGRectMake(x, y, width, height);
    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:frame
                                                          collectionViewLayout:layout];
    collectionView.delegate = self;//设置代理
    collectionView.dataSource = self;//设置数据源
    collectionView.backgroundColor = [UIColor whiteColor];//设置背景，默认为黑色
    //添加到主视图
    [self.view addSubview:collectionView];
    self.collectionView = collectionView;
    
    //注册容器视图中显示的方块视图
    [collectionView registerClass:[YLDefaultCollectionViewCell class]
       forCellWithReuseIdentifier:[YLDefaultCollectionViewCell cellIdentifier]];
    //注册容器视图中显示的顶部视图
    [collectionView registerClass:[YLCollectionHeaderView class]
       forSupplementaryViewOfKind:UICollectionElementKindSectionHeader
              withReuseIdentifier:[YLCollectionHeaderView headerViewIdentifier]];
    //注册容器视图中显示的底部视图
    [collectionView registerClass:[YLCollectionFooterView class]
       forSupplementaryViewOfKind:UICollectionElementKindSectionFooter
              withReuseIdentifier:[YLCollectionFooterView footerViewIdentifier]];
    
}
#pragma mark -  UICollectionViewDelegateFlowLayout布局代理方法
/* 设置各个方块的大小尺寸 */
- (CGSize)collectionView:(UICollectionView *)collectionView
                  layout:(UICollectionViewLayout*)collectionViewLayout
  sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CGFloat width = 50;
    CGFloat height = 50;
    return CGSizeMake(width, height);
}

/* 设置每一组的上下左右间距 */
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView
                        layout:(UICollectionViewLayout*)collectionViewLayout
        insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(0, 0, 0, 0);
}

#pragma mark - UICollectionViewDataSource
/* 设置容器中有多少个组 */
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 10;
}
/* 设置每个组有多少个方块 */
- (NSInteger)collectionView:(UICollectionView *)collectionView
     numberOfItemsInSection:(NSInteger)section
{
    return 20;
}
/* 设置方块的视图 */
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView
                  cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    //获取cell视图，内部通过去缓存池中取，如果缓存池中没有，就自动创建一个新的cell
    YLDefaultCollectionViewCell *cell =
    [YLDefaultCollectionViewCell cellWithCollectionView:collectionView
                                    forIndexPath:indexPath];
    //设置cell属性
    cell.contentView.backgroundColor = [UIColor redColor];
    cell.textLabel.text = [NSString stringWithFormat:@"Cell %2ld",indexPath.row];
    
    return cell;
}
/* 设置顶部视图和底部视图 */
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView
           viewForSupplementaryElementOfKind:(NSString *)kind
                                 atIndexPath:(NSIndexPath *)indexPath
{
    if ( [kind isEqualToString:UICollectionElementKindSectionHeader] ) {//顶部视图
        //获取顶部视图
        YLCollectionHeaderView *headerView =
        [YLCollectionHeaderView headerViewWithCollectionView:collectionView
                                                forIndexPath:indexPath];
        //设置顶部视图属性
        headerView.backgroundColor = [UIColor orangeColor];
        headerView.textLabel.text = [NSString stringWithFormat:@"-Header-%ld-",indexPath.section];
        return headerView;
        
    } else if( [kind isEqualToString:UICollectionElementKindSectionFooter] ) {//底部视图
        //获取底部视图
        YLCollectionFooterView *footerView =
        [YLCollectionFooterView footerViewWithCollectionView:collectionView
                                                forIndexPath:indexPath];
        //设置底部视图属性
        footerView.backgroundColor = [UIColor greenColor];
        footerView.textLabel.text = [NSString stringWithFormat:@"-Footer-%ld-",indexPath.section];
        return footerView;
    }
    return nil;
}

#pragma mark - UICollectionViewDelegate
/* 方块被选中会调用 */
- (void)collectionView:(UICollectionView *)collectionView
didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"点击选择了第%ld组第%ld个方块",indexPath.section,indexPath.row);
}
/* 方块取消选中会调用 */
- (void)collectionView:(UICollectionView *)collectionView
didDeselectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"取消选择第%ld组第%ld个方块",indexPath.section,indexPath.row);
}
@end
