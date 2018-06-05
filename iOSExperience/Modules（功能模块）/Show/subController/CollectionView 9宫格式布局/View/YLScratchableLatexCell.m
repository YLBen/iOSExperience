//
//  YLScratchableLatexCell.m
//  iOSExperience
//
//  Created by Ben Lv on 2018/6/5.
//  Copyright © 2018年 avatar. All rights reserved.
//

#import "YLScratchableLatexCell.h"
#import <Masonry.h>
#import "YLScratchableLatexModel.h"
@interface YLScratchableLatexCell()

@property(nonatomic,strong)UIImageView *topImageView;
@property(nonatomic,strong)UILabel *title;

@end
@implementation YLScratchableLatexCell

#pragma mark - life cycle
-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self.contentView addSubview:self.topImageView];
        [self.contentView addSubview:self.title];
        
        [self initConstraint];
    }
    return self;
}
#pragma mark - Lazy loading
-(UIImageView *)topImageView
{
    if (!_topImageView) {
        _topImageView = [[UIImageView alloc] init];
    }
    return _topImageView;
}
-(UILabel *)title
{
    if (!_title) {
        _title = [[UILabel alloc] init];
    }
    return _title;
}
#pragma mark - getter && setter
-(void)setModel:(YLScratchableLatexModel *)model
{
    _model = model;
    self.topImageView.image = [UIImage imageNamed:model.image];
    self.title.text = model.title;
}
#pragma mark -  private methods
- (void)initConstraint
{
    [self.topImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView);
        make.centerX.equalTo(self.contentView);
        make.size.mas_equalTo(70);
    }];
    [self.title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.topImageView.mas_bottom).offset(10);
        make.centerX.equalTo(self.topImageView);
        make.bottom.lessThanOrEqualTo(self.contentView.mas_bottom);
    }];
}

@end
