//
//  YLGuideCollectionViewCell.m
//  iOSExperience
//
//  Created by Ben Lv on 2018/11/5.
//  Copyright © 2018年 avatar. All rights reserved.
//

#import "YLGuideCollectionViewCell.h"

#import <Masonry.h>
@interface YLGuideCollectionViewCell()

@property(nonatomic,strong)UIImageView *imageView;
@end

@implementation YLGuideCollectionViewCell
#pragma mark - life cycle
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self.contentView addSubview:self.imageView];
        [self initConstraints];
        
    }
    return self;
}
#pragma mark - public methods

#pragma mark - private methods
- (void)initConstraints {
    [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.contentView);
    }];
    
}
#pragma mark - getter && setter
- (void)setImage:(UIImage *)image {
    self.imageView.image = image;
    
}
#pragma mark - lazy loading
- (UIImageView *)imageView {
    if (!_imageView ) {
        _imageView = [[UIImageView alloc] init];
    }
    return _imageView ;
    
}
#pragma mark - dataSouce

#pragma mark - delegate



@end
