//
//  WZPhotoThumbnailCollectionViewCell.m
//  WZPhotoPickerController
//
//  Created by williamzhang on 15/12/29.
//  Copyright © 2015年 William Zhang. All rights reserved.
//

#import "WZPhotoThumbnailCollectionViewCell.h"

@interface WZPhotoThumbnailCollectionViewCell()

@property (nonatomic, strong) UIButton *selectButton;

@end

@implementation WZPhotoThumbnailCollectionViewCell

+ (NSString *)identifier { return NSStringFromClass(self);}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self.contentView addSubview:self.imageView];
        [self.contentView addSubview:self.selectButton];
        
    }
    return self;
}

- (void)setSelected:(BOOL)selected {
    self.selectButton.selected = selected;
    [super setSelected:selected];
}

#pragma mark - Initializer
- (UIImageView *)imageView {
    if (!_imageView) {
        _imageView = [[UIImageView alloc] initWithFrame:self.contentView.bounds];
        _imageView.layer.cornerRadius = 5.0;
        _imageView.layer.masksToBounds = YES;
        _imageView.layer.rasterizationScale = [UIScreen mainScreen].scale;
        _imageView.layer.shouldRasterize = YES;
    }
    return _imageView;
}

- (UIButton *)selectButton {
    if (!_selectButton) {
        _selectButton = [UIButton new];
        _selectButton.userInteractionEnabled = NO;
        
        [_selectButton setImage:[UIImage imageNamed:@"uncheckedBlank"] forState:UIControlStateNormal];
        [_selectButton setImage:[UIImage imageNamed:@"Me_check"] forState:UIControlStateSelected];
        
        [_selectButton sizeToFit];
        
        CGPoint center = _selectButton.center;
        center.x = CGRectGetWidth(self.contentView.frame) - 5 - CGRectGetWidth(_selectButton.frame) / 2;
        center.y = 5 + CGRectGetWidth(_selectButton.frame) / 2;
        _selectButton.center = center;
    }
    return _selectButton;
}

@end
