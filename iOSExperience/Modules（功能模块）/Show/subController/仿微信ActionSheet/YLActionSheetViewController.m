//
//  YLActionSheetViewController.m
//  iOSExperience
//
//  Created by Ben Lv on 2018/8/21.
//  Copyright © 2018年 avatar. All rights reserved.
//

#import "YLActionSheetViewController.h"

#import <Masonry.h>
#import <LCActionSheet/LCActionSheet.h>
@interface YLActionSheetViewController ()<LCActionSheetDelegate>
@property(nonatomic,strong)UIButton *btn;

@end

@implementation YLActionSheetViewController

#pragma mark - life cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.btn];
    [self initConstraints];
    
}
#pragma mark - public methods

#pragma mark - private methods
- (void)btnClick {
    LCActionSheet *actionSheet = [LCActionSheet sheetWithTitle:@""
                                                      delegate:self
                                             cancelButtonTitle:@"取消"
                                             otherButtonTitles:@"拍照", @"相册", nil];
//    actionSheet.titleColor         = [UIColor orangeColor];
//    actionSheet.buttonColor        = [UIColor greenColor];
//    actionSheet.titleFont          = [UIFont boldSystemFontOfSize:15.0f];
//    actionSheet.buttonFont         = [UIFont boldSystemFontOfSize:15.0f];
    actionSheet.buttonHeight       = 60.0f;
//    actionSheet.scrolling          = YES;
    actionSheet.visibleButtonCount = 3.6f;
    actionSheet.darkViewNoTaped    = YES;
    actionSheet.unBlur             = YES;
    actionSheet.blurEffectStyle    = UIBlurEffectStyleLight;
    
    [actionSheet show];
    
}

- (void)initConstraints {
    [self.btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.centerY.equalTo(self.view);
    }];
}
#pragma mark - getter && setter

#pragma mark - lazy loading
- (UIButton *)btn {
    if (!_btn) {
        _btn = [[UIButton alloc] init];
        [_btn setTitle:@"ActionSheet" forState:UIControlStateNormal];
        [_btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_btn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
        [_btn sizeToFit];
    }
    return _btn;
    
}

#pragma mark - delegate
- (void)actionSheet:(LCActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
    NSLog(@"%d",buttonIndex);
    
}

@end
