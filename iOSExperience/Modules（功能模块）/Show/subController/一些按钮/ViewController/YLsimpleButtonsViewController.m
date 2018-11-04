//
//  YLsimpleButtonsViewController.m
//  iOSExperience
//
//  Created by Ben Lv on 2018/7/12.
//  Copyright © 2018年 avatar. All rights reserved.
//

#import "YLsimpleButtonsViewController.h"
#import "HyperLinks.h"
#import "shony.h"
@interface YLsimpleButtonsViewController ()

@end

@implementation YLsimpleButtonsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"一些按钮";
    self.view.backgroundColor = [UIColor whiteColor];
    // Do any additional setup after loading the view.
    HyperLinks *links = [[HyperLinks alloc] initWithFrame:CGRectMake(100, 100, 150, 50)];
    [links setTitle:@"www.baidu.com" forState:UIControlStateNormal];
    [links setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    
    [self.view addSubview:links];
//    self.view.backgroundColor = [UIColor whiteColor];
    
    shony *shonyBtn = [[shony alloc] initWithFrame:CGRectMake(100, 200, 100, 40) withBackgroundColor:[UIColor blueColor]];
    [self.view addSubview:shonyBtn];
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    if ([self.navigationController.navigationBar isHidden]) {
        [self.navigationController setNavigationBarHidden:NO animated:YES];
    }else {
        [self.navigationController setNavigationBarHidden:YES animated:YES];
        
    }
    
    
    
}


@end
