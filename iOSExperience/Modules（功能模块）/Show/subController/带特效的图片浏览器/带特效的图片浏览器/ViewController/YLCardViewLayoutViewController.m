//
//  YLCardViewLayoutViewController.m
//  iOSExperience
//
//  Created by Ben Lv on 2018/11/6.
//  Copyright © 2018年 avatar. All rights reserved.
//

#import "YLCardViewLayoutViewController.h"
#import "RGCardViewLayout.h"
#import "YLGuideCollectionViewCell.h"

@interface YLCardViewLayoutViewController ()<UICollectionViewDataSource,UICollectionViewDelegate>
@property(nonatomic,strong)UICollectionView *collectionView;
@end

@implementation YLCardViewLayoutViewController


#pragma mark - life cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"情况2";
    // Do any additional setup after loading the view.
    [self.view addSubview:self.collectionView];
}


#pragma mark - private methods



#pragma mark - lazy loading
- (UICollectionView *)collectionView {
    if (!_collectionView) {
        RGCardViewLayout *layout = [[RGCardViewLayout alloc] init];
        layout.itemSize = CGSizeMake(230, 350);
        _collectionView = [[UICollectionView alloc]initWithFrame:self.view.bounds collectionViewLayout:layout];
        _collectionView.backgroundColor = [UIColor whiteColor];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        [_collectionView registerClass:[YLGuideCollectionViewCell class] forCellWithReuseIdentifier:NSStringFromClass([YLGuideCollectionViewCell class])];
        
    }
    return _collectionView;
    
    
}
#pragma mark - dataSouce
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 4;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    NSString *imageStr = [NSString stringWithFormat:@"new_feature_%ld",indexPath.row+1];
    YLGuideCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([YLGuideCollectionViewCell class]) forIndexPath:indexPath];
    cell.image = [UIImage imageNamed:imageStr];
    return cell;
    
}
#pragma mark - delegate

@end
