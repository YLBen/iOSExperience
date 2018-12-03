//
//  YLPhotoAlbumViewController.m
//  iOSExperience
//
//  Created by Ben Lv on 2018/12/3.
//  Copyright © 2018年 avatar. All rights reserved.
//

#import "YLPhotoAlbumViewController.h"

#import "WZPhotoAlbumController.h"
#import "WZPhotosViewController.h"
#import "WZPhotoPickerController.h"

#import "YLBaseNavigationController.h"
@interface YLPhotoAlbumViewController ()<WZPhotoPickerControllerDelegate>

@end

@implementation YLPhotoAlbumViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}
- (IBAction)btnClick:(id)sender {
    
    WZPhotoPickerController *ctr = [[WZPhotoPickerController alloc] init];
    ctr.delegate = self;
//    YLBaseNavigationController *nav = [[YLBaseNavigationController alloc] initWithRootViewController:ctr];
    [self presentViewController:ctr animated:YES completion:^{
        
    }];
    
}

- (void)wz_imagePickerController:(WZPhotoPickerController *)photoPickerController didSelectAssets:(NSArray *)assets {
    NSLog(@"%@",assets);
    
    
}

@end
