//
//  YLMineHeaderView.m
//  iOSExperience
//
//  Created by Ben Lv on 2018/9/11.
//  Copyright © 2018年 avatar. All rights reserved.
//

#import "YLMineHeaderView.h"
#import <YYKit.h>
#import <Masonry.h>
@interface YLMineHeaderView()
@property(nonatomic, strong) UIImageView *bgImgView; //背景图
@property(nonatomic,strong)UILabel *nickLabel;

@end
@implementation YLMineHeaderView

#pragma mark - life cycle
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.bgImgView];
        [self addSubview:self.nickLabel];
        [self addSubview:self.headImgView];
//        [self addSubview:self.bgImgView];
        [self initConstraints];
    }
    return self;
}
#pragma mark - public methods

#pragma mark - private methods
- (void)initConstraints {
    [self.bgImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self);
        
    }];
    [self.headImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.centerY.equalTo(self);
        make.width.height.mas_equalTo(120);
    }];
    [self.nickLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.top.equalTo(self.headImgView.mas_bottom).offset(5);
    }];
    
}

- (void)headViewClick {
    
    
    
}
#pragma mark - getter && setter

#pragma mark - lazy loading
- (UIImageView *)bgImgView {
    if (!_bgImgView) {
        _bgImgView = [[UIImageView alloc] init];
        _bgImgView.image = [UIImage imageNamed:@"background"];
    }
    return _bgImgView;
    
}

- (UILabel *)nickLabel {
    if (!_nickLabel) {
        _nickLabel = [[UILabel alloc] init];
        _nickLabel.textColor = [UIColor whiteColor];
        _nickLabel.font = [UIFont systemFontOfSize:15];
        _nickLabel.text = @"未登陆";
        [_nickLabel sizeToFit];
        
    }
    return _nickLabel;
    
}

- (YYAnimatedImageView *)headImgView {
    if (!_headImgView) {
        _headImgView = [YYAnimatedImageView new];
        NSURL *url = [NSURL URLWithString:@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1536828376956&di=5803d2fe50386b370e366f0ace59deed&imgtype=0&src=http%3A%2F%2Fpic.962.net%2Fup%2F2016-10%2F14760807193135709.gif"];
        [_headImgView setImageWithURL:url placeholder:[UIImage imageNamed:@"tabBar_my_normal"]];
        _headImgView.contentMode = UIViewContentModeScaleAspectFill;
        
        _headImgView.userInteractionEnabled = YES;
        [_headImgView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(headViewClick)]];
        ViewRadius(_headImgView, 60);
    }
    return _headImgView;
    
}

#pragma mark - dataSouce

#pragma mark - delegate

@end
