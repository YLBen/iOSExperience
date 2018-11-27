//
//  CYXPhotoViewLayout.m
//  CYCollectionViewTest
//
//  Created by apple开发 on 16/3/8.
//  Copyright © 2016年 cyx. All rights reserved.
//

#import "CYXPhotoViewLayout.h"

@implementation CYXPhotoViewLayout

- (instancetype)init{

    if (self = [super init]) {
        
    }
    return self;
    
}
//在滚动式是否允许刷新布局  默认NO
- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds
{
    return YES;
}
//collection 第一次布局时 刷新时也会调用
//作用：计算cell的布局   cell的位置是固定的


- (void)prepareLayout{
    
    [super prepareLayout];
    
    self.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    // 设置内边距
    CGFloat inset = (self.collectionView.frame.size.width - self.itemSize.width) * 0.5;
    self.sectionInset = UIEdgeInsetsMake(0, inset, 0, inset);
    NSLog(@"%s",__func__);
    
}

//计算collection滚动范围
- (CGSize)collectionViewContentSize {
    return [super collectionViewContentSize];
    
}

//UICollectionViewLayoutAttributes 确定cell的尺寸
//每个UICollectionViewLayoutAttributes 对应一个cell
//返回指定区域 所有cell的LayoutAttributes
- (nullable NSArray<__kindof UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect {
    
    // 获得super已经计算好的布局属性
//    [super layoutAttributesForElementsInRect:CGRectMake(0, 0, MAXFLOAT, MAXFLOAT)];//一次返回所有的cell尺寸
    NSArray *attributes = [super layoutAttributesForElementsInRect:rect];
    
    
    // 计算collectionView最中心点的x值
    CGFloat centerX = self.collectionView.contentOffset.x + self.collectionView.frame.size.width * 0.5;
    
    
    // 在原有布局属性的基础上，进行微调
    for (UICollectionViewLayoutAttributes *attrs in attributes) {
        // cell的中心点x 和 collectionView最中心点的x值 的间距
        CGFloat delta = ABS(attrs.center.x - centerX);
        // 根据间距值 计算 cell的缩放比例
        CGFloat scale = 1.2 - delta / self.collectionView.frame.size.width;
        
//        YLLog(@"%f,%f",delta,scale);
        // 设置缩放比例
        attrs.transform = CGAffineTransformMakeScale(scale, scale);
    }
    
    return  attributes;
    
}

/**
 * 这个方法的返回值，就决定了collectionView停止滚动时的偏移量
 最终偏移量不等于 手指离开时偏移量
 //定位移动s后的位置
 
 
 */
- (CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)proposedContentOffset withScrollingVelocity:(CGPoint)velocity
{
    
    
    // 计算出最终显示的矩形框
    CGRect rect;
    rect.origin.y = 0;
    rect.origin.x = proposedContentOffset.x;
    rect.size = self.collectionView.frame.size;
    
    // 获得super已经计算好的布局属性
    NSArray *array = [super layoutAttributesForElementsInRect:rect];
    
    // 计算collectionView最中心点的x值
    CGFloat centerX = proposedContentOffset.x + self.collectionView.frame.size.width * 0.5;
    
    // 存放最小的间距值
    CGFloat minDelta = MAXFLOAT;
    for (UICollectionViewLayoutAttributes *attrs in array) {
        if (ABS(minDelta) > ABS(attrs.center.x - centerX)) {
            minDelta = attrs.center.x - centerX;
        }
    }
    
    // 修改原有的偏移量
    proposedContentOffset.x += minDelta;
    return proposedContentOffset;
}


@end
