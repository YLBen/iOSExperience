//
//  UILabel+YLChangeLineSpaceAndWordSpace.m
//  iOSExperience
//
//  Created by Ben Lv on 2018/5/26.
//  Copyright © 2018年 avatar. All rights reserved.
//

#import "UILabel+YLChangeLineSpaceAndWordSpace.h"

@implementation UILabel (YLChangeLineSpaceAndWordSpace)

/**
 *  获取行间距label的高度
 */
+ (CGSize)av_getLineSpaceForLabelText:(NSString *)text labelFont:(UIFont *)font lineSpacing:(float)lineSpacing boundSize:(CGSize)boundSize {
    NSMutableParagraphStyle *paraStyle = [[NSMutableParagraphStyle alloc] init];
    paraStyle.lineBreakMode = NSLineBreakByCharWrapping;
    paraStyle.alignment = NSTextAlignmentLeft;
    
    BOOL isSure = [text sizeWithAttributes:@{NSFontAttributeName : font}].width > boundSize.width;
    if (isSure) {
        paraStyle.lineSpacing = lineSpacing;
    }
    
    //    paraStyle.lineSpacing = lineSpacing;
    paraStyle.hyphenationFactor = 1.0;
    paraStyle.firstLineHeadIndent = 0.0;
    paraStyle.paragraphSpacingBefore = 0.0;
    paraStyle.headIndent = 0;
    paraStyle.tailIndent = 0;
    NSDictionary *dic = @{NSFontAttributeName:font,
                          NSParagraphStyleAttributeName:paraStyle
                          //                          NSKernAttributeName:@15
                          };
    CGSize text_size = [text boundingRectWithSize:boundSize options:NSStringDrawingUsesLineFragmentOrigin attributes:dic context:nil].size;
    
    return text_size;
}


/**
 *  改变行间距
 */
+ (void)av_changeLineSpaceForLabel:(UILabel *)label WithSpace:(float)space {
    NSString *labelText = label.text;
    NSMutableParagraphStyle *paraStyle = [[NSMutableParagraphStyle alloc] init];
    paraStyle.lineBreakMode = NSLineBreakByCharWrapping;
    paraStyle.alignment = NSTextAlignmentLeft;
    //    BOOL isSure = [text sizeWithAttributes:@{NSFontAttributeName : font}].width > boundSize.width;
    //    if (isSure) {
    //        paraStyle.lineSpacing = lineSpacing;
    //    }
    paraStyle.lineSpacing = space;
    paraStyle.hyphenationFactor = 1.0;
    paraStyle.firstLineHeadIndent = 0.0;
    paraStyle.paragraphSpacingBefore = 0.0;
    paraStyle.headIndent = 0;
    paraStyle.tailIndent = 0;
    NSDictionary *dic = @{NSFontAttributeName:label.font,
                          NSParagraphStyleAttributeName:paraStyle
                          //                          NSKernAttributeName:@(space)
                          };
    NSAttributedString *attributeStr = [[NSAttributedString alloc] initWithString:labelText attributes:dic];
    label.attributedText = attributeStr;
    
    [label sizeToFit];
}

@end
