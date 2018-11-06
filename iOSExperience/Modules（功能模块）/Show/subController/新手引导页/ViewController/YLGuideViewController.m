//
//  YLGuideViewController.m
//  iOSExperience
//
//  Created by Ben Lv on 2018/11/5.
//  Copyright © 2018年 avatar. All rights reserved.
//

#import "YLGuideViewController.h"
#import "YLGuideCollectionViewCell.h"

#import <Masonry.h>
#import "UINavigationController+FDFullscreenPopGesture.h"
@interface YLGuideViewController ()<UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
@property(nonatomic,strong)UICollectionView *collectionView;
@property(nonatomic,strong)UIButton * btn;
@end

@implementation YLGuideViewController

#pragma mark - life cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    //    隐藏导航栏
    self.fd_prefersNavigationBarHidden = YES;
    
    [self.view addSubview:self.collectionView];
    _btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [_btn setImage:[UIImage imageNamed:@"navBar_back_orange"] forState:UIControlStateNormal];
    _btn.frame = CGRectMake(10, 35, 30, 30);
    [_btn addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_btn];
}
#pragma mark - public methods

#pragma mark - private methods
- (void)back {
    [self.navigationController popViewControllerAnimated:YES];
}
#pragma mark - getter && setter

#pragma mark - lazy loading
- (UICollectionView *)collectionView {
    if (!_collectionView) {
        //创建布局对象
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        //设置滚动方向为垂直滚动，说明方块是从左上到右下的布局排列方式
        layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        // 定义大小
        layout.itemSize = CGSizeMake([UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height + 20);
        layout.minimumLineSpacing = 0;
        layout.minimumInteritemSpacing = 0;
        

        _collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:layout];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.backgroundColor = [UIColor whiteColor];
        
        // 开启分页
        _collectionView.pagingEnabled = YES;
        // 隐藏水平滚动条
        _collectionView.showsHorizontalScrollIndicator = NO;
        // 取消弹簧效果
        _collectionView.bounces = NO;
        [_collectionView registerClass:[YLGuideCollectionViewCell class] forCellWithReuseIdentifier:NSStringFromClass([YLGuideCollectionViewCell class])];
        
        
        
    }
    return _collectionView;
    
}

#pragma mark -  UICollectionViewDelegateFlowLayout布局代理方法
/* 设置各个方块的大小尺寸 */
//- (CGSize)collectionView:(UICollectionView *)collectionView
//                  layout:(UICollectionViewLayout*)collectionViewLayout
//  sizeForItemAtIndexPath:(NSIndexPath *)indexPath
//{
//    
//    return [UIScreen mainScreen].bounds.size;;
//}

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
    return 1;
}
/* 设置每个组有多少个方块 */
- (NSInteger)collectionView:(UICollectionView *)collectionView
     numberOfItemsInSection:(NSInteger)section
{
    return 4;
}
/* 设置方块的视图 */
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView
                  cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
//    //获取cell视图，内部通过去缓存池中取，如果缓存池中没有，就自动创建一个新的cell
//    YLDefaultCollectionViewCell *cell =
//    [YLDefaultCollectionViewCell cellWithCollectionView:collectionView
//                                           forIndexPath:indexPath];
//    //设置cell属性
//    cell.contentView.backgroundColor = [UIColor redColor];
//    cell.textLabel.text = [NSString stringWithFormat:@"Cell %2ld",indexPath.row];
//
//    return cell;
    NSString *imageStr = [NSString stringWithFormat:@"new_feature_%ld",indexPath.row+1];
    YLGuideCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([YLGuideCollectionViewCell class]) forIndexPath:indexPath];
    cell.image = [UIImage imageNamed:imageStr];
    return cell;
}

@end
