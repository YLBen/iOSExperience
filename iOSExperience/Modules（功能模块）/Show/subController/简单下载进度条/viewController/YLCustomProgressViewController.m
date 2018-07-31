//
//  YLCustomProgressViewController.m
//  iOSExperience
//
//  Created by Ben Lv on 2018/7/31.
//  Copyright © 2018年 avatar. All rights reserved.
//

#import "YLCustomProgressViewController.h"

#import "CustomProgressView.h"
@interface YLCustomProgressViewController ()
@property(nonatomic,strong)UISlider *slider;
@property(nonatomic,strong)CustomProgressView *progressView;
@property(nonatomic,strong)UILabel *label;
@end

@implementation YLCustomProgressViewController

#pragma mark - life cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"进度条";
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.progressView];
    [self.view addSubview:self.slider];
    [self.view addSubview:self.label];
    
}

#pragma mark - public methods

#pragma mark - private methods

- (void)changeValue:(UISlider *)sender
{
    NSLog(@"%d",sender.value);
    self.progressView.progressValue = sender.value;
    self.label.text = [NSString stringWithFormat:@"%.f%%",sender.value];
}
#pragma mark - getter && setter

#pragma mark - lazy loading
- (UISlider *)slider {
    if (!_slider) {
        _slider = [[UISlider alloc] initWithFrame:CGRectMake(10, 500, self.view.frame.size.width - 20, 50)];
        _slider.minimumValue = 0;
        _slider.maximumValue = 100;
        [self.slider addTarget:self action:@selector(changeValue:) forControlEvents:UIControlEventValueChanged];
    }
    return _slider;
    
}

- (CustomProgressView *)progressView {
    if (!_progressView) {
        _progressView = [[CustomProgressView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.width)];
        _progressView.backgroundColor = [UIColor whiteColor];
        
    }
    return _progressView;
    
}

- (UILabel *)label {
    if (!_label) {
        _label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 80, 50)];
        _label.center = self.progressView.center;
        _label.textAlignment = NSTextAlignmentCenter;
    }
    return _label;
    
}

@end
