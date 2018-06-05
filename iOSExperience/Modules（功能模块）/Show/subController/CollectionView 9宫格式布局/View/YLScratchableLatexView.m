//
//  YLScratchableLatexView.m
//  iOSExperience
//
//  Created by Ben Lv on 2018/6/5.
//  Copyright © 2018年 avatar. All rights reserved.
//

#import "YLScratchableLatexView.h"

#import "YLScratchableLatexModel.h"
#import "YLScratchableLatexCell.h"
#import <Masonry.h>
@interface YLScratchableLatexView()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
@property(nonatomic,strong)UICollectionView *CollectionView;
@end

@implementation YLScratchableLatexView

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.CollectionView];
        
        [self initConstraint];
    }
    return self;
}
#pragma mark - Lazy loading
-(UICollectionView *)CollectionView
{
    if (!_CollectionView) {
        //        用来布局UICollectionView
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        //         CollectionViewCell大小
        layout.itemSize = CGSizeMake(100, 100);
        //        最小行间距
        layout.minimumLineSpacing = 55;
        //        最小列间距（设置作用很小）
        layout.minimumInteritemSpacing = 0;
        //        内边距
        layout.sectionInset = UIEdgeInsetsMake(40, 20, 0, 20);
        _CollectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
        _CollectionView.delegate = self;
        _CollectionView.dataSource = self;
        _CollectionView.backgroundColor = [UIColor clearColor];
        //         注册单元格
        [_CollectionView registerClass:[YLScratchableLatexCell class] forCellWithReuseIdentifier:NSStringFromClass([YLScratchableLatexCell class])];
        
    }
    return _CollectionView;
}
#pragma mark - getter && setter
#pragma mark -  private methods
- (void)initConstraint
{
    [self.CollectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self);
    }];
}
#pragma mark - public methods
#pragma mark -  Delegate

#pragma mark -  DataSource
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.dataSouce.count;
}
- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    YLScratchableLatexCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([YLScratchableLatexCell class]) forIndexPath:indexPath];
    cell.model = self.dataSouce[indexPath.row];
    return cell;
}

@end
