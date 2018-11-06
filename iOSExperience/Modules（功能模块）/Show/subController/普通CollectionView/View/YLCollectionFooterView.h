//
//  YLCollectionFooterView.h
//  iOSExperience
//
//  Created by Ben Lv on 2018/11/5.
//  Copyright © 2018年 avatar. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface YLCollectionFooterView : UICollectionReusableView
@property (strong, nonatomic) UILabel *textLabel;
/* 底部视图的缓存池标示 */
+ (NSString *)footerViewIdentifier;
/* 获取底部视图对象 */
+ (instancetype)footerViewWithCollectionView:(UICollectionView *)collectionView
                                forIndexPath:(NSIndexPath *)indexPath;
@end

NS_ASSUME_NONNULL_END
