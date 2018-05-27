//
//  UILabel+YLChangeLineSpaceAndWordSpace.h
//  iOSExperience
//
//  Created by Ben Lv on 2018/5/26.
//  Copyright © 2018年 avatar. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (YLChangeLineSpaceAndWordSpace)

/**
 *  获取行间距label的高度
 */
+ (CGSize)av_getLineSpaceForLabelText:(NSString *)text labelFont:(UIFont *)font lineSpacing:(float)lineSpacing boundSize:(CGSize)boundSize;

/**
 *  改变行间距
 */
+ (void)av_changeLineSpaceForLabel:(UILabel *)label WithSpace:(float)space;



@end
