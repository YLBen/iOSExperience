//
//  YLShowImageViewController.m
//  iOSExperience
//
//  Created by Ben Lv on 2018/5/27.
//  Copyright © 2018年 avatar. All rights reserved.
//

#import "YLShowImageViewController.h"
#import <SDWebImage/UIImageView+WebCache.h>
#import <UIImage+GIF.h>
@interface YLShowImageViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageTopLabel;
@property (weak, nonatomic) IBOutlet UIImageView *imageBottomLabel;
@property (weak, nonatomic) IBOutlet UILabel *catchLabel;

@end

@implementation YLShowImageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSString *home = NSHomeDirectory();
    NSLog(@"--%@",home);
    
    //    https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1525081320204&di=ca8283a5eea851b4539cd2730d2086c6&imgtype=0&src=http%3A%2F%2Fimg5q.duitang.com%2Fuploads%2Fitem%2F201502%2F10%2F20150210104013_xfvfs.jpeg
    
    //    https://pic.qqtn.com/up/2017-1/14842776448366713.gif
    //    加载网络图片
    [self.imageTopLabel sd_setImageWithURL:[NSURL URLWithString:@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1525081320204&di=ca8283a5eea851b4539cd2730d2086c6&imgtype=0&src=http%3A%2F%2Fimg5q.duitang.com%2Fuploads%2Fitem%2F201502%2F10%2F20150210104013_xfvfs.jpeg"] placeholderImage:nil completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
        if (!error) {
            NSLog(@"下载成功");
        }
    }];
    //    加载gif
    NSData *imageData   = [NSData dataWithContentsOfURL:[NSURL URLWithString:@"https://pic.qqtn.com/up/2017-1/14842776448366713.gif"]];
    [self.imageBottomLabel setImage:[UIImage sd_animatedGIFWithData:imageData]];
    
    
    //    [self.imageBottomLabel sd_setImageWithURL:[NSURL URLWithString:@"https://pic.qqtn.com/up/2017-1/14842776448366713.gif"] placeholderImage:nil completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
    //        if (error) {
    //            NSLog(@"下载成功");
    //        }
    //    }];
    //    获取 SDWebImage 的磁盘缓存大小,
    NSInteger size = [[SDImageCache sharedImageCache] getSize];
    NSNumber *nub = [NSNumber numberWithInteger:size];
    NSString *cacha = nub.stringValue;
    self.catchLabel.text = cacha;
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)click:(id)sender {
    
    [[SDImageCache sharedImageCache] clearDiskOnCompletion:nil];
    NSInteger size = [[SDImageCache sharedImageCache] getSize];
    NSNumber *nub = [NSNumber numberWithInteger:size];
    NSString *cacha = nub.stringValue;
    self.catchLabel.text = cacha;
}


@end
