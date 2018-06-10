//
//  YLAdaptFontCell.h
//  iOSExperience
//
//  Created by Ben Lv on 2018/6/10.
//  Copyright © 2018年 avatar. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YLJParagraphModel.h"
@interface YLAdaptFontCell : UITableViewCell
+ (instancetype)adaptFontCellWithTableView:(UITableView *)tableView;

/** <#digest#> */
@property (nonatomic, strong) YLJParagraphModel *paragraph;
@end
