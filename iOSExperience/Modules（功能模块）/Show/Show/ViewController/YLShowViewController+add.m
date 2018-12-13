//
//  YLShowViewController+add.m
//  iOSExperience
//
//  Created by Ben Lv on 2018/8/22.
//  Copyright © 2018年 avatar. All rights reserved.
//

#import "YLShowViewController+add.h"

#import "YLShowImageViewController.h"
#import "YLLocalImageUpload.h"
#import "YLLocalNotificationsViewController.h"
#import "YLFoldingCellViewController.h"
#import "YLScratchableLatexViewController.h"
#import "YLFuzzyViewController.h"
#import "YLEditableViewController.h"
#import "YLAdaptFontViewController.h"
#import "YLSelectTimeViewController.h"
#import "YLRunWebViewViewController.h"
#import "YLSphereTagCloudViewController.h"
#import "YLRollingViewController.h"
#import "YLMenuViewController.h"
#import "YLUnlimitedViewController.h"
#import "YLsimpleButtonsViewController.h"
#import "YLCustomProgressViewController.h"
#import "YLPieChartViewController.h"
#import "YLHistogramViewController.h"
#import "YLdrawingPicViewController.h"
#import "YLLinkageTableViewViewController.h"
#import "YLActionSheetViewController.h"
#import "YLEffectViewController.h"
#import "TypingDemoViewController.h"
#import "LADownloadTestViewController.h"
#import "YLEditLabelViewController.h"
#import "YLByAroundViewController.h"
#import "YLPictureRepeaterViewController.h"
#import "YLDefaultCollectionViewController.h"
#import "YLAnimatedTransitionViewController.h"

#import "YLGuideViewController.h"
#import "YLEffectsTableViewController.h"
#import "YLPassByValueTableViewController.h"
#import "YLQrCodeViewController.h"

#import "YLWaterFallLayoutViewController.h"
@implementation YLShowViewController (add)
- (void)pushToViewControllerWithTag:(NSString *)tag {
    if ([tag isEqualToString:@"0"]) {
        YLShowImageViewController *ctr = [[YLShowImageViewController alloc] init];
        [self.navigationController pushViewController:ctr animated:YES];
    }
    else if ([tag isEqualToString:@"1"]) {
        YLLocalImageUpload *ctr = [[YLLocalImageUpload alloc] init];
        [self.navigationController pushViewController:ctr animated:YES];
    }
    else if ([tag isEqualToString:@"2"]) {
        YLLocalNotificationsViewController *ctr = [[YLLocalNotificationsViewController alloc] init];
        [self.navigationController pushViewController:ctr animated:YES];
    }
    else if ([tag isEqualToString:@"3"]) {
        YLFoldingCellViewController *ctr = [[YLFoldingCellViewController alloc] init];
        [self.navigationController pushViewController:ctr animated:YES];
    }
    else if ([tag isEqualToString:@"4"]) {
        YLScratchableLatexViewController *ctr = [[YLScratchableLatexViewController alloc] init];
        [self.navigationController pushViewController:ctr animated:YES];
    }
    else if ([tag isEqualToString:@"5"]) {
        YLFuzzyViewController *ctr = [[YLFuzzyViewController alloc] init];
        [self.navigationController pushViewController:ctr animated:YES];
    }
    else if ([tag isEqualToString:@"6"]) {
        YLEditableViewController *ctr = [[YLEditableViewController alloc] init];
        [self.navigationController pushViewController:ctr animated:YES];
    }
    else if ([tag isEqualToString:@"7"]) {
        YLAdaptFontViewController *ctr = [[YLAdaptFontViewController alloc] init];
        [self.navigationController pushViewController:ctr animated:YES];
    }
    else if ([tag isEqualToString:@"8"]) {
        YLSelectTimeViewController *ctr = [[YLSelectTimeViewController alloc] init];
        [self.navigationController pushViewController:ctr animated:YES];
    }
    else if ([tag isEqualToString:@"9"]) {
        YLRunWebViewViewController *ctr = [[YLRunWebViewViewController alloc] init];
        [self.navigationController pushViewController:ctr animated:YES];
    }
    else if ([tag isEqualToString:@"10"]) {
        YLSphereTagCloudViewController *ctr = [[YLSphereTagCloudViewController alloc] init];
        [self.navigationController pushViewController:ctr animated:YES];
    }
    else if ([tag isEqualToString:@"11"]) {
        YLRollingViewController *ctr = [[YLRollingViewController alloc] init];
        [self.navigationController pushViewController:ctr animated:YES];
    }
    else if ([tag isEqualToString:@"12"]) {
        YLMenuViewController *ctr = [[YLMenuViewController alloc] init];
        [self.navigationController pushViewController:ctr animated:YES];
    }
    else if ([tag isEqualToString:@"13"]) {
        YLUnlimitedViewController *ctr = [[YLUnlimitedViewController alloc] init];
        [self.navigationController pushViewController:ctr animated:YES];
    }
    else if ([tag isEqualToString:@"14"]) {
        YLUnlimitedViewController *ctr = [[YLUnlimitedViewController alloc] init];
        [self.navigationController pushViewController:ctr animated:YES];
    }
    else if ([tag isEqualToString:@"15"]) {
        YLsimpleButtonsViewController *ctr = [[YLsimpleButtonsViewController alloc] init];
        [self.navigationController pushViewController:ctr animated:YES];
    }
    else if ([tag isEqualToString:@"16"]) {
        YLCustomProgressViewController *ctr = [[YLCustomProgressViewController alloc] init];
        [self.navigationController pushViewController:ctr animated:YES];
    }
    else if ([tag isEqualToString:@"17"]) {
        YLPieChartViewController *ctr = [[YLPieChartViewController alloc] init];
        [self.navigationController pushViewController:ctr animated:YES];
    }
    else if ([tag isEqualToString:@"18"]) {
        YLHistogramViewController *ctr = [[YLHistogramViewController alloc] init];
        [self.navigationController pushViewController:ctr animated:YES];
    }
    else if ([tag isEqualToString:@"19"]) {
        YLdrawingPicViewController *ctr = [[YLdrawingPicViewController alloc] init];
        [self.navigationController pushViewController:ctr animated:YES];
    }
    else if ([tag isEqualToString:@"20"]) {
        YLLinkageTableViewViewController *ctr = [[YLLinkageTableViewViewController alloc] init];
        [self.navigationController pushViewController:ctr animated:YES];
    }
    else if ([tag isEqualToString:@"21"]) {
        YLActionSheetViewController *ctr = [[YLActionSheetViewController alloc] init];
        [self.navigationController pushViewController:ctr animated:YES];
    }
    else if ([tag isEqualToString:@"22"]) {
        YLEffectViewController *ctr = [[YLEffectViewController alloc] init];
        [self.navigationController pushViewController:ctr animated:YES];
    }
    else if ([tag isEqualToString:@"23"]) {
        TypingDemoViewController *ctr = [[TypingDemoViewController alloc] init];
        [self.navigationController pushViewController:ctr animated:YES];
    }
    else if ([tag isEqualToString:@"24"]) {
        LADownloadTestViewController *ctr = [[LADownloadTestViewController alloc] init];
        [self.navigationController pushViewController:ctr animated:YES];
        //YLEditLabelViewController
    }
    else if ([tag isEqualToString:@"25"]) {
        YLEditLabelViewController *ctr = [[YLEditLabelViewController alloc] init];
        [self.navigationController pushViewController:ctr animated:YES];
        //YLEditLabelViewController
    }
    else if ([tag isEqualToString:@"26"]) {
        YLByAroundViewController *ctr = [[YLByAroundViewController alloc] init];
        [self.navigationController pushViewController:ctr animated:YES];
        //YLEditLabelViewController
    }
    else if ([tag isEqualToString:@"27"]) {
        YLPictureRepeaterViewController *ctr = [[YLPictureRepeaterViewController alloc] init];
        [self.navigationController pushViewController:ctr animated:YES];
        //YLEditLabelViewController
    }
    else if ([tag isEqualToString:@"28"]) {
        YLDefaultCollectionViewController *ctr = [[YLDefaultCollectionViewController alloc] init];
        [self.navigationController pushViewController:ctr animated:YES];
    }
//    else if ([tag isEqualToString:@"29"]) {
//
//        YLAnimatedTransitionViewController *ctr = [[YLAnimatedTransitionViewController alloc] init];
//        [self.navigationController pushViewController:ctr animated:YES];
//    }
    else if ([tag isEqualToString:@"29"]) {
        
        YLGuideViewController *ctr = [[YLGuideViewController alloc] init];
        [self.navigationController pushViewController:ctr animated:YES];
    }
    else if ([tag isEqualToString:@"30"]) {
        
        YLEffectsTableViewController *ctr = [[YLEffectsTableViewController alloc] init];
        [self.navigationController pushViewController:ctr animated:YES];
    }
    else if ([tag isEqualToString:@"31"]) {
        
        YLPassByValueTableViewController *ctr = [[YLPassByValueTableViewController alloc] init];
        [self.navigationController pushViewController:ctr animated:YES];
    }
    else if ([tag isEqualToString:@"32"]) {
        
        YLQrCodeViewController *ctr = [[YLQrCodeViewController alloc] init];
        [self.navigationController pushViewController:ctr animated:YES];
    }
    else if ([tag isEqualToString:@"33"]) {
        
        YLWaterFallLayoutViewController *ctr = [[YLWaterFallLayoutViewController alloc] init];
        [self.navigationController pushViewController:ctr animated:YES];
    }
}


@end
