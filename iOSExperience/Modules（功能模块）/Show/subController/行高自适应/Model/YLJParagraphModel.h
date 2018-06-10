//
//  YLJParagraphModel.h
//  iOSExperience
//
//  Created by Ben Lv on 2018/6/10.
//  Copyright © 2018年 avatar. All rights reserved.
//

#import <UIKit/UIKit.h>
//UIKIT_EXTERN     extern __attribute__((visibility ("default")))
UIKIT_EXTERN const CGFloat KTopSpace;
UIKIT_EXTERN const CGFloat KLeftSpace;
UIKIT_EXTERN const CGFloat KRightSpace;
UIKIT_EXTERN const CGFloat KDateLabelFontSize;
UIKIT_EXTERN const CGFloat KDateMarginToText;
UIKIT_EXTERN const CGFloat KTextLabelFontSize;
UIKIT_EXTERN const CGFloat kBottomSpace;

@interface YLJParagraphModel : NSObject
/** <#digest#> */
@property (nonatomic, copy) NSString *words;

/** <#digest#> */
@property (nonatomic, copy) NSString *date;

/** <#digest#> */
@property (nonatomic, copy, readonly) NSAttributedString *attWords;

/** <#digest#> */
@property (nonatomic, assign, readonly) CGFloat height;
@end
