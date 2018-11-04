//
//  RMAudioHud.m
//  Titans
//
//  Created by Remon Lv on 14/12/22.
//  Copyright (c) 2014年 Remon Lv. All rights reserved.
//

#import "RMAudioHud.h"
#import <QuartzCore/QuartzCore.h>

#pragma mark - <DEFINES>

#define W_IMGVIEW 120
//#define STRING_IMG_ANIMATE @"voice_record_"
//#define NUM_IMG_ANIMATE 3

#define STRING_IMG_ANIMATE @"voice_record_"
#define NUM_IMG_ANIMATE 2

#define DURATION_IMG_ANIMATE 0.6

#pragma mark - <CLASS> - UIVewFrame

@implementation RMAudioHud

- (id)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame])
    {
        // 声波动画容器
        _imgViewRecord = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, W_IMGVIEW, W_IMGVIEW)];
        [self addSubview:_imgViewRecord];
        
        // 设置动画图
        NSMutableArray *arrImg = [NSMutableArray arrayWithCapacity:NUM_IMG_ANIMATE];
        for (int i = 0; i <= NUM_IMG_ANIMATE; i ++)
        {
            NSString *strImg = [NSString stringWithFormat:@"%@%d",STRING_IMG_ANIMATE,i];
            UIImage *image = [UIImage imageNamed:strImg];
            [arrImg addObject:image];
        }

        [_imgViewRecord setImage:[arrImg firstObject]];
        [_imgViewRecord setAnimationImages:arrImg];
        [_imgViewRecord setAnimationDuration:DURATION_IMG_ANIMATE];
        [_imgViewRecord setAnimationRepeatCount:0];
    }
    return self;
}

- (void)showInView:(UIView *)viewTarget
{
    [_imgViewRecord setCenter:viewTarget.center];
    [viewTarget addSubview:self];
    
    [UIView animateWithDuration:0.25 animations:^{
        
        [self setBackgroundColor:[UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.5]];
        
    }];
}

- (void)hide
{
    [self removeFromSuperview];
    [_imgViewRecord stopAnimating];
    [self setBackgroundColor:[UIColor clearColor]];
}

- (void)setAnimationEnable:(BOOL)enable
{
    if (_imgViewRecord.isAnimating && !enable)
    {
        [_imgViewRecord stopAnimating];
    }
    else if (!_imgViewRecord.isAnimating && enable)
    {
        [_imgViewRecord startAnimating];
    }
}

@end
