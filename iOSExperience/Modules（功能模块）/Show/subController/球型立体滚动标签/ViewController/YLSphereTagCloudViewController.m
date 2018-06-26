//
//  YLSphereTagCloudViewController.m
//  iOSExperience
//
//  Created by Ben Lv on 2018/6/17.
//  Copyright © 2018年 avatar. All rights reserved.
//

#import "YLSphereTagCloudViewController.h"
#import "DBSphereView.h"
#import <Masonry.h>
@interface YLSphereTagCloudViewController ()
@property (weak, nonatomic) DBSphereView *sphereView;
@end

@implementation YLSphereTagCloudViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSMutableArray *array = [[NSMutableArray alloc] initWithCapacity:0];
    for (NSInteger i = 0; i < 50; i ++) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem];
        [btn setTitle:[NSString stringWithFormat:@"A%zd", i] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
        btn.titleLabel.font = [UIFont systemFontOfSize:24.];
        btn.frame = CGRectMake(0, 0, 60, 20);
        [btn addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
        [array addObject:btn];
        [self.sphereView addSubview:btn];
    }
    [self.sphereView setCloudTags:array];
}

#pragma mark - lazyLoading
- (void)buttonPressed:(UIButton *)btn
{
    [self.sphereView timerStop];
    
    [UIView animateWithDuration:0.3 animations:^{
        btn.transform = CGAffineTransformMakeScale(2., 2.);
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.3 animations:^{
            btn.transform = CGAffineTransformMakeScale(1., 1.);
        } completion:^(BOOL finished) {
            [self.sphereView timerStart];
        }];
    }];
}

- (DBSphereView *)sphereView
{
    if(!_sphereView)
    {
        DBSphereView *sphereView  = [[DBSphereView alloc] init];
        [self.view addSubview:sphereView];
        sphereView.backgroundColor = [[UIColor whiteColor] colorWithAlphaComponent:0.6];
        _sphereView = sphereView;
        [sphereView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.center.offset(0);
            make.width.mas_equalTo(self.view).offset(-40);
            make.height.mas_equalTo(self.view.mas_width).offset(-40);
        }];
    }
    return _sphereView;
}

@end
