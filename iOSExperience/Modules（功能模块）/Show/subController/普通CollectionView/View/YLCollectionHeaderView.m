//
//  YLCollectionHeaderView.m
//  ColloectionView
//
//  Created by Ben Lv on 2018/11/5.
//  Copyright © 2018年 avatar. All rights reserved.
//

#import "YLCollectionHeaderView.h"

@implementation YLCollectionHeaderView
/* 顶部视图的缓存池标示 */
+ (NSString *)headerViewIdentifier{
    static NSString *headerIdentifier = @"headerViewIdentifier";
    return headerIdentifier;
}
/* 获取顶部视图对象 */
+ (instancetype)headerViewWithCollectionView:(UICollectionView *)collectionView
                                forIndexPath:(NSIndexPath *)indexPath
{
    //从缓存池中寻找顶部视图对象，如果没有，该方法自动调用alloc/initWithFrame创建一个新的顶部视图返回
    YLCollectionHeaderView *headerView =
    [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader
                                       withReuseIdentifier:[YLCollectionHeaderView headerViewIdentifier]
                                              forIndexPath:indexPath];
    return headerView;
}
/* 注册了顶部视图后，当缓存池中没有顶部视图的对象时候，自动调用alloc/initWithFrame创建 */
- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        //创建label
        UILabel *textLabel = [[UILabel alloc] init];
        //设置label尺寸
        CGFloat x = 5;
        CGFloat y = 5;
        CGFloat width = frame.size.width - 10;
        CGFloat height = frame.size.height - 10;
        textLabel.frame = CGRectMake(x, y, width, height);
        //设置label属性
        textLabel.numberOfLines = 0;
        textLabel.textAlignment = NSTextAlignmentCenter;
        //添加到父控件
        [self addSubview:textLabel];
        self.textLabel = textLabel;
    }
    return self;
}


@end
