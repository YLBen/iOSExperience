//
//  YLCollectionHeaderView.h
//  ColloectionView
//
//  Created by Ben Lv on 2018/11/5.
//  Copyright © 2018年 avatar. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface YLCollectionHeaderView : UICollectionReusableView
@property (strong, nonatomic) UILabel *textLabel;
/* 顶部视图的缓存池标示 */
+ (NSString *)headerViewIdentifier;
/* 获取顶部视图对象 */
+ (instancetype)headerViewWithCollectionView:(UICollectionView *)collectionView
                                forIndexPath:(NSIndexPath *)indexPath;

@end

NS_ASSUME_NONNULL_END
