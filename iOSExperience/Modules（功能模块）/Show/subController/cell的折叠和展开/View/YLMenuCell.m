//
//  YLMenuCell.m
//  iOSExperience
//
//  Created by Ben Lv on 2018/6/27.
//  Copyright © 2018年 avatar. All rights reserved.
//

#import "YLMenuCell.h"
#import "UILabel+YLHelper.h"
#import "UIColor+YLHelper.h"
#import <Masonry.h>
#import <SDWebImage/UIImageView+WebCache.h>
#import "YLMenuCellModel.h"
@interface YLMenuCell()

@property(nonatomic,strong)UIImageView *icon;
@property(nonatomic,strong)UILabel *nickNameLab;
@property(nonatomic,strong)UILabel *markLab;


@end

@implementation YLMenuCell

#pragma mark - life cycle
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self.contentView addSubview:self.icon];
        [self.contentView addSubview:self.nickNameLab];
        [self.contentView addSubview:self.markLab];
        [self initConstraints];
    }
    return self;
}

#pragma mark - public methods

#pragma mark - private methods
- (void)initConstraints {
    [self.icon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.contentView);
        make.left.mas_equalTo(self.contentView).offset(10);
        make.size.mas_equalTo(40);
    }];
    [self.nickNameLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.icon.mas_top);
        make.left.equalTo(self.icon.mas_right).offset(10);
        make.height.mas_equalTo(20);
        make.right.equalTo(self.contentView.mas_right).offset(100);
    }];
    [self.markLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.icon.mas_bottom).offset(2);
        make.left.equalTo(self.icon.mas_right);
        make.height.mas_equalTo(10);
        make.right.equalTo(self.contentView.mas_right).offset(10);
        make.bottom.equalTo(self.icon.mas_bottom);
    }];
    
}

#pragma mark - getter && setter
- (void)setModel:(YLMenuCellModel *)model {
    _model = model;
    self.nickNameLab.text = model.nickName;
    self.markLab.text = model.mark;
    [self.icon sd_setImageWithURL:[NSURL URLWithString:model.picUrl] placeholderImage:[UIImage imageNamed:@"contacts_cell_default_avatar"]];
    
}

#pragma mark - lazy loading
- (UIImageView *)icon {
    if (!_icon) {
        _icon = [[UIImageView alloc] init];
        _icon.layer.cornerRadius = 5;
        _icon.layer.masksToBounds = YES;
    }
    return _icon;
    
}
- (UILabel *)markLab {
    if (!_markLab) {
        _markLab = [UILabel av_labelWithtextColor:[UIColor av_fontDarkGrayColor] font:[UIFont systemFontOfSize:13]];
    }
    return _markLab;
    
}

- (UILabel *)nickNameLab {
    if (!_nickNameLab) {
        _nickNameLab = [UILabel av_labelWithtextColor:[UIColor av_fontBlackColor] font:[UIFont systemFontOfSize:15]];
    }
    return _nickNameLab;
}
#pragma mark - dataSouce

#pragma mark - delegate

@end
