//
//  YLVoiceInputView.h
//  iOSExperience
//
//  Created by Ben Lv on 2018/11/4.
//  Copyright © 2018年 avatar. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol NCVoiceInputViewDelegate <NSObject>


- (void)VoiceBtnTouchEvents:(UIControlEvents) controlEvent;

@end


@interface NCVoiceInputView : UIView

@property (nonatomic, weak) id<NCVoiceInputViewDelegate> delegate;

@end





@interface  NCVoiceInputBtn : UIButton

@end

NS_ASSUME_NONNULL_END
