//
//  YLBaseViewController.m
//  iOSExperience
//
//  Created by Ben Lv on 2018/5/26.
//  Copyright © 2018年 avatar. All rights reserved.
//

#import "YLBaseViewController.h"

@interface YLBaseViewController ()

@end

@implementation YLBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    NSLog(@"-------------->%@,%s,%d",NSStringFromClass(self.class),__FUNCTION__,__LINE__);
}



@end
