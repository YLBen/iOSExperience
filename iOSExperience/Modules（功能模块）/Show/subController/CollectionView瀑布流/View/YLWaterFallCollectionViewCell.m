//
//  YLWaterFallCollectionViewCell.m
//  iOSExperience
//
//  Created by Ben Lv on 2018/12/12.
//  Copyright © 2018年 avatar. All rights reserved.
//

#import "YLWaterFallCollectionViewCell.h"
#import "YLWaterFallLayoutModel.h"
#import <Masonry.h>
@interface YLWaterFallCollectionViewCell()
@property(nonatomic,strong)UIImageView *imageView;

@end
@implementation YLWaterFallCollectionViewCell
#pragma mark - life cycle
- (instancetype)initWithFrame:(CGRect)frame {
   self = [super initWithFrame:frame];
    if (self) {
        [self buildUI];
    }
    return self;
}


#pragma mark - private methods
- (void)buildUI{
    [self.contentView addSubview:self.imageView];
    [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.contentView);
    }];
    
    
}
#pragma mark - getter && setter
- (void)setModel:(YLWaterFallLayoutModel *)model {
    _model = model;
    self.imageView.image = [UIImage imageNamed:model.imageUrl];
    
}
#pragma mark - lazy loading
- (UIImageView *)imageView{
    
    if (!_imageView) {
        _imageView = [[UIImageView alloc] init];
        
    }
    return _imageView;
    
}

@end
