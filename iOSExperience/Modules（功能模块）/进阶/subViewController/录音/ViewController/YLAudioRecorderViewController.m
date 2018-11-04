//
//  YLAudioRecorderViewController.m
//  iOSExperience
//
//  Created by Ben Lv on 2018/11/4.
//  Copyright © 2018年 avatar. All rights reserved.
//

#import "YLAudioRecorderViewController.h"
#import "YLVoiceInputView.h"
#import <Masonry.h>
@interface YLAudioRecorderViewController ()<NCVoiceInputViewDelegate>
@property(nonatomic,strong)NCVoiceInputView *InputBtn;
@end

@implementation YLAudioRecorderViewController


#pragma mark - life cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.InputBtn];
    [self initConstraints];
}
#pragma mark - public methods

#pragma mark - private methods
- (void)initConstraints {
    [self.InputBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.view).offset(-20);
        make.left.right.equalTo(self.view);
        make.height.mas_equalTo(100);
    }];
    
}
#pragma mark - getter && setter

#pragma mark - lazy loading
- (NCVoiceInputView *)InputBtn {
    if (!_InputBtn) {
        _InputBtn = [[NCVoiceInputView alloc] initWithFrame:CGRectZero];
        _InputBtn.delegate = self;
    }
    return _InputBtn;
}
#pragma mark - dataSouce

#pragma mark - delegate
- (void)VoiceBtnTouchEvents:(UIControlEvents) controlEvent {
    
    
}



@end
