//
//  YL56ViewController.m
//  iOSExperience
//
//  Created by Ben Lv on 2018/10/27.
//  Copyright © 2018年 avatar. All rights reserved.
//

#import "YL56ViewController.h"

@interface YL56ViewController ()

@end

@implementation YL56ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
}

- (IBAction)click:(id)sender {
    if ([_delegate respondsToSelector:@selector(yyyuy:)]) {
        [_delegate yyyuy:@"插入的"];
    }
    
}


@end
