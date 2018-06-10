//
//  YLAdaptFontCell.m
//  iOSExperience
//
//  Created by Ben Lv on 2018/6/10.
//  Copyright © 2018年 avatar. All rights reserved.
//

#import "YLAdaptFontCell.h"
#import <Masonry.h>
@interface YLAdaptFontCell()

/** <#digest#> */
@property (weak, nonatomic) UILabel *myDateLabel;

/** <#digest#> */
@property (weak, nonatomic) UILabel *myTextLabel;

@end

@implementation YLAdaptFontCell
#pragma mark - life cycle
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setupUIOnceLMJAdaptFontCell];
    }
    
    return self;
}
- (void)awakeFromNib
{
    [super awakeFromNib];
    [self setupUIOnceLMJAdaptFontCell];
}
#pragma mark - public methods
+ (instancetype)adaptFontCellWithTableView:(UITableView *)tableView
{
    static NSString *const adaptFontCellID = @"adaptFontCellID";
    
    YLAdaptFontCell *cell = [tableView dequeueReusableCellWithIdentifier:adaptFontCellID];
    
    if (cell == nil) {
        cell = [[self alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:adaptFontCellID];
    }
    return cell;
}
#pragma mark - private methods
- (void)setupUIOnceLMJAdaptFontCell
{
    self.selectionStyle = UITableViewCellSelectionStyleNone;
}
#pragma mark - getter && setter
- (void)setParagraph:(YLJParagraphModel *)paragraph
{
    self.myTextLabel.attributedText = paragraph.attWords;
    self.myDateLabel.text = paragraph.date;
}
#pragma mark - lazy loading
- (UILabel *)myDateLabel
{
    if(_myDateLabel == nil)
    {
        UILabel *label = [[UILabel alloc] init];
        [self.contentView addSubview:label];
        _myDateLabel = label;
        label.textColor = [UIColor blackColor];
        label.font = AdaptedFontSize(KDateLabelFontSize);
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(KTopSpace);
            make.left.mas_equalTo(KLeftSpace);
            make.right.mas_equalTo(-KRightSpace);
        }];
        
    }
    
    return _myDateLabel;
}
- (UILabel *)myTextLabel
{
    if(_myTextLabel == nil)
    {
        UILabel *label = [[UILabel alloc] init];
        [self.contentView addSubview:label];
        _myTextLabel = label;
        label.textColor = [UIColor grayColor];
        label.font = AdaptedFontSize(KTextLabelFontSize);
        label.numberOfLines = 0;
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.myDateLabel.mas_bottom).offset(KDateMarginToText);
            make.left.mas_equalTo(KLeftSpace);
            make.right.mas_equalTo(-KRightSpace);
        }];
    }
    return _myTextLabel;
}
#pragma mark - dataSouce

#pragma mark - delegate
@end
