//
//  YLEffectViewController.m
//  iOSExperience
//
//  Created by Ben Lv on 2018/8/21.
//  Copyright © 2018年 avatar. All rights reserved.
//

#import "YLEffectViewController.h"

#import <Lottie/Lottie.h>
#import <Masonry.h>
@interface YLEffectViewController ()
@property(nonatomic,strong)LOTAnimationView *animation;
@property(nonatomic,strong)UIButton *btn;
@property(nonatomic,strong)LOTAnimatedSwitch *animatedSwitch;
@property(nonatomic,strong)LOTAnimatedSwitch *heartSwitch;

@end

@implementation YLEffectViewController

#pragma mark - life cycle
- (void)viewDidLoad {
    [super viewDidLoad];
   
    [self.view addSubview:self.animation];
    [self.animation addSubview:self.btn];
    [self.view addSubview:self.animatedSwitch];
    [self.view addSubview:self.heartSwitch];
    [self initConstraints];
    
    [self.animation playWithCompletion:^(BOOL animationFinished) {
        // Do Something
    }];
    
    
}

#pragma mark - public methods
- (void)initConstraints {
    [self.animation mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.equalTo(self.view);
        make.height.mas_equalTo(300);
    }];
    [self.btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.animation);
    }];
    [self.animatedSwitch mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.top.equalTo(self.animation.mas_bottom).offset(20);
        make.width.mas_equalTo(100);
        make.height.mas_equalTo(80);
    }];
    [self.heartSwitch mas_makeConstraints:^(MASConstraintMaker *make) {
         make.centerX.equalTo(self.view);
        make.top.equalTo(self.animatedSwitch.mas_bottom).offset(20);
        make.width.mas_equalTo(200);
        make.height.mas_equalTo(200);
    }];
    
}
#pragma mark - private methods
- (void)_playLottieAnimation {
    self.animation.animationProgress = 0;
    [self.animation play];
}
#pragma mark - getter && setter

#pragma mark - lazy loading
- (LOTAnimationView *)animation {
    if (!_animation) {
        _animation = [LOTAnimationView animationNamed:@"LottieLogo1"];
        _animation.contentMode = UIViewContentModeScaleAspectFill;
        
    }
    return _animation;
    
}
- (UIButton *)btn {
    if (!_btn) {
         _btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_btn addTarget:self action:@selector(_playLottieAnimation) forControlEvents:UIControlEventTouchUpInside];
        
    }
    return _btn;
    
}
- (LOTAnimatedSwitch *)animatedSwitch {
    if (!_animatedSwitch) {
        _animatedSwitch = [LOTAnimatedSwitch switchNamed:@"Switch"];
//        _animatedSwitch.contentMode = UIViewContentModeScaleAspectFit;

    }
    return _animatedSwitch;
    
}

- (LOTAnimatedSwitch *)heartSwitch {
    if (!_heartSwitch) {
        _heartSwitch = [LOTAnimatedSwitch switchNamed:@"TwitterHeart"];
        
    }
    return _heartSwitch;
    
}
#pragma mark - dataSouce

#pragma mark - delegate

@end
