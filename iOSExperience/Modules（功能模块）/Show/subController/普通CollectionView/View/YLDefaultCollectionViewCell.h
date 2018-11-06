//
//  YLDefaultCollectionViewCell.h
//  iOSExperience
//
//  Created by Ben Lv on 2018/11/5.
//  Copyright © 2018年 avatar. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface YLDefaultCollectionViewCell : UICollectionViewCell
@property (strong, nonatomic) UILabel *textLabel;
/* 方块视图的缓存池标示 */
+ (NSString *)cellIdentifier;
/* 获取方块视图对象 */
+ (instancetype)cellWithCollectionView:(UICollectionView *)collectionView
                          forIndexPath:(NSIndexPath *)indexPath;
@end

NS_ASSUME_NONNULL_END
