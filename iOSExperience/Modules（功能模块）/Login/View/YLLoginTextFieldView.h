//
//  YLLoginTextFieldView.h
//  iOSExperience
//
//  Created by Ben Lv on 2018/10/16.
//  Copyright © 2018年 avatar. All rights reserved.
//

#import <UIKit/UIKit.h>

@class YLLoginInfoModel;
@class YLLoginTextFieldView;
@protocol YLLoginTextFieldViewDelegate<NSObject>
- (void)loginTextFieldView:(YLLoginTextFieldView *)textFieldView moveViewWithIsMoveUp:(BOOL)isMoveUp;

@end

NS_ASSUME_NONNULL_BEGIN

@interface YLLoginTextFieldView : UIView

@property (nonatomic, weak) id <YLLoginTextFieldViewDelegate> delegate;
@property (nonatomic, strong) YLLoginInfoModel *infoModel;

/** 注销键盘 */
- (void)resignKeyborad;

@end

NS_ASSUME_NONNULL_END
