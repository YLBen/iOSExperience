//
//  YLAdvancedViewController+add.m
//  iOSExperience
//
//  Created by Ben Lv on 2018/10/9.
//  Copyright © 2018年 avatar. All rights reserved.
//

#import "YLAdvancedViewController+add.h"

#import "YLFoldingCellViewController.h"
#import "YLSphereTagCloudViewController.h"
#import "YLRollingViewController.h"
#import "YLMenuViewController.h"
#import "YLUnlimitedViewController.h"
#import "YLLinkageTableViewViewController.h"
#import "YLActionSheetViewController.h"
#import "YLEffectViewController.h"
#import "TypingDemoViewController.h"
#import "LADownloadTestViewController.h"
#import "YLAnimatedTransitionViewController.h"
#import "YLAudioRecorderViewController.h"
#import "YLLocalH5ViewController.h"
#import "YLPhotoAlbumViewController.h"

#import "UIView+YLLoading.h"
@implementation YLAdvancedViewController (add)
- (void)pushToViewControllerWithTag:(NSString *)tag {
    if ([tag isEqualToString:@"0"]) {
        YLFoldingCellViewController *ctr = [[YLFoldingCellViewController alloc] init];
        [self.navigationController pushViewController:ctr animated:YES];
    }
    else if ([tag isEqualToString:@"1"]) {
        YLSphereTagCloudViewController *ctr = [[YLSphereTagCloudViewController alloc] init];
        [self.navigationController pushViewController:ctr animated:YES];
    }
    else if ([tag isEqualToString:@"2"]) {
        YLRollingViewController *ctr = [[YLRollingViewController alloc] init];
        [self.navigationController pushViewController:ctr animated:YES];
    }
    else if ([tag isEqualToString:@"3"]) {
        YLMenuViewController *ctr = [[YLMenuViewController alloc] init];
        [self.navigationController pushViewController:ctr animated:YES];
    }
    else if ([tag isEqualToString:@"4"]) {
        YLUnlimitedViewController *ctr = [[YLUnlimitedViewController alloc] init];
        [self.navigationController pushViewController:ctr animated:YES];
    }
    else if ([tag isEqualToString:@"5"]) {
//        YLUnlimitedViewController *ctr = [[YLUnlimitedViewController alloc] init];
//        [self.navigationController pushViewController:ctr animated:YES];
        [self.view av_postMessage:@"暂无资源"];
    }
    else if ([tag isEqualToString:@"6"]) {
        YLLinkageTableViewViewController *ctr = [[YLLinkageTableViewViewController alloc] init];
        [self.navigationController pushViewController:ctr animated:YES];
    }
    else if ([tag isEqualToString:@"7"]) {
        YLActionSheetViewController *ctr = [[YLActionSheetViewController alloc] init];
        [self.navigationController pushViewController:ctr animated:YES];
    }
    else if ([tag isEqualToString:@"8"]) {
        YLEffectViewController *ctr = [[YLEffectViewController alloc] init];
        [self.navigationController pushViewController:ctr animated:YES];
    }
    else if ([tag isEqualToString:@"9"]) {
        TypingDemoViewController *ctr = [[TypingDemoViewController alloc] init];
        [self.navigationController pushViewController:ctr animated:YES];
    }
    else if ([tag isEqualToString:@"10"]) {
        LADownloadTestViewController *ctr = [[LADownloadTestViewController alloc] init];
        [self.navigationController pushViewController:ctr animated:YES];
    }
    else if ([tag isEqualToString:@"11"]) {
//        暂时封印
//        YLAnimatedTransitionViewController *ctr = [[YLAnimatedTransitionViewController alloc] init];
//        [self.navigationController pushViewController:ctr animated:YES];
    }
    else if ([tag isEqualToString:@"14"]) {
        //        暂时封印
        //        YLAnimatedTransitionViewController *ctr = [[YLAnimatedTransitionViewController alloc] init];
        //        [self.navigationController pushViewController:ctr animated:YES];
        YLAudioRecorderViewController *ctr = [[YLAudioRecorderViewController alloc] init];
        [self.navigationController pushViewController:ctr animated:YES];
    }
    else if ([tag isEqualToString:@"15"]) {
       
        YLLocalH5ViewController *ctr = [[YLLocalH5ViewController alloc] init];
        [self.navigationController pushViewController:ctr animated:YES];
    }
    else if ([tag isEqualToString:@"16"]) {
        
        YLPhotoAlbumViewController *ctr = [[YLPhotoAlbumViewController alloc] init];
        [self.navigationController pushViewController:ctr animated:YES];
    }
}
@end
