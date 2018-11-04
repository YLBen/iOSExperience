//
//  YLVoiceInputView.m
//  iOSExperience
//
//  Created by Ben Lv on 2018/11/4.
//  Copyright © 2018年 avatar. All rights reserved.
//

#import "YLVoiceInputView.h"
#import <Masonry.h>
@interface NCVoiceInputView()

@property (nonatomic, strong) NCVoiceInputBtn *voiceBtn;

@end


@implementation NCVoiceInputView


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        self.backgroundColor = [UIColor whiteColor];
        
        NCVoiceInputBtn *voiceBtn = [[NCVoiceInputBtn alloc] init];
        self.voiceBtn = voiceBtn;
        [voiceBtn setImage:[UIImage imageNamed:@"img_message_voiceNormal"] forState:UIControlStateNormal];
        [voiceBtn setTitle:@"按住说话" forState:UIControlStateNormal];
        [voiceBtn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
        voiceBtn.titleLabel.font = [UIFont systemFontOfSize:15];
        [voiceBtn addTarget:self action:@selector(voiceBtnTouchUpInsideClick) forControlEvents:UIControlEventTouchDown];
        [voiceBtn addTarget:self action:@selector(voiceBtnTouchUpOutsideClick) forControlEvents:UIControlEventTouchUpInside];
        [voiceBtn addTarget:self action:@selector(voiceBtnTouchDragOutsideClick) forControlEvents:UIControlEventTouchUpOutside];
        voiceBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:voiceBtn];
        
        [self initContraints];
    }
    return self;
}


- (void)initContraints
{
    [self.voiceBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(110);
        make.height.mas_equalTo(150);
        make.centerX.mas_equalTo(self);
        make.top.mas_equalTo(self).offset(30);
    }];
}


- (void)voiceBtnTouchUpInsideClick {
    
    if ([self.delegate respondsToSelector:@selector(VoiceBtnTouchEvents:)]) {
        [self.delegate VoiceBtnTouchEvents:UIControlEventTouchDown];
    }
}

- (void)voiceBtnTouchUpOutsideClick {
    
    if ([self.delegate respondsToSelector:@selector(VoiceBtnTouchEvents:)]) {
        [self.delegate VoiceBtnTouchEvents:UIControlEventTouchUpInside];
    }
}

- (void)voiceBtnTouchDragOutsideClick {
    
    if ([self.delegate respondsToSelector:@selector(VoiceBtnTouchEvents:)]) {
        [self.delegate VoiceBtnTouchEvents:UIControlEventTouchUpOutside];
    }
    
}

@end



@implementation NCVoiceInputBtn

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    self.imageView.frame = CGRectMake(0, 0, 110, 110);
    self.titleLabel.frame = CGRectMake(0, 110, 110, 40);
    
}


@end

