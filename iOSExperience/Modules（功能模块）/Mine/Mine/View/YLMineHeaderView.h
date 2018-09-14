//
//  YLMineHeaderView.h
//  iOSExperience
//
//  Created by Ben Lv on 2018/9/11.
//  Copyright © 2018年 avatar. All rights reserved.
//

#import <UIKit/UIKit.h>
@class YYAnimatedImageView;
@interface YLMineHeaderView : UIView
@property(nonatomic, strong) YYAnimatedImageView *headImgView; //头像
@property(nonatomic,strong)NSDictionary *headerData;
@end
