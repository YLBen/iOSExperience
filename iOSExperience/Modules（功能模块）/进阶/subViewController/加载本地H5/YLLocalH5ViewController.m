//
//  YLLocalH5ViewController.m
//  iOSExperience
//
//  Created by Ben Lv on 2018/11/27.
//  Copyright © 2018年 avatar. All rights reserved.
//

#import "YLLocalH5ViewController.h"

@interface YLLocalH5ViewController ()
@property (weak, nonatomic) IBOutlet UIWebView *webView;

@end

@implementation YLLocalH5ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"加载本地H5";
    NSString *path = [[NSBundle mainBundle] pathForResource:@"index" ofType:@"html"];
    NSURL* url = [NSURL  fileURLWithPath:path];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [_webView loadRequest:request];
    
}



@end
