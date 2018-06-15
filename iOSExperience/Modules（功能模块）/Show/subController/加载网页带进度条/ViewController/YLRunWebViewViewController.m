//
//  YLRunWebViewViewController.m
//  iOSExperience
//
//  Created by Ben Lv on 2018/6/15.
//  Copyright © 2018年 avatar. All rights reserved.
//

#import "YLRunWebViewViewController.h"
#import <WebKit/WebKit.h>

@interface YLRunWebViewViewController ()
@property (strong, nonatomic) WKWebView *webView;
@property (weak, nonatomic) CALayer *progresslayer;
@end

@implementation YLRunWebViewViewController
#pragma mark - life cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.webView];
    //添加属性监听
    [self.webView addObserver:self forKeyPath:@"estimatedProgress" options:NSKeyValueObservingOptionNew context:nil];
    
    //进度条
    UIView *progress = [[UIView alloc]initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.frame), 3)];
    progress.backgroundColor = [UIColor clearColor];
    [self.view addSubview:progress];
    
    CALayer *layer = [CALayer layer];
    layer.frame = CGRectMake(0, 0, 0, 3);
    layer.backgroundColor = [UIColor redColor].CGColor;
    [progress.layer addSublayer:layer];
    self.progresslayer = layer;
    
    if (self.url) {
        [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:self.url]]];
    }else {
           [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"https://baidu.com"]]];
    }
        
 
}
- (void)dealloc{
    [self.webView removeObserver:self forKeyPath:@"estimatedProgress"];
}

#pragma mark - public methods

#pragma mark - private methods
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context{
    if ([keyPath isEqualToString:@"estimatedProgress"]) {
        NSLog(@"%@", change);
        self.progresslayer.opacity = 1;
        self.progresslayer.frame = CGRectMake(0, 0, self.view.bounds.size.width * [change[NSKeyValueChangeNewKey] floatValue], 3);
        if ([change[NSKeyValueChangeNewKey] floatValue] == 1) {
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(.2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                self.progresslayer.opacity = 0;
            });
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(.8 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                self.progresslayer.frame = CGRectMake(0, 0, 0, 3);
            });
        }
    }else{
        [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
    }
}

#pragma mark - getter && setter

#pragma mark - lazy loading
- (WKWebView *)webView {
    if (!_webView) {
        _webView = [[WKWebView alloc] initWithFrame:self.view.bounds];
    }
    return _webView;
    
}

#pragma mark - dataSouce

#pragma mark - delegate
@end
