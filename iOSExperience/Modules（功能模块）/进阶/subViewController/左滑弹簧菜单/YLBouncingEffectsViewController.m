//
//  YLBouncingEffectsViewController.m
//  iOSExperience
//
//  Created by Ben Lv on 2018/12/3.
//  Copyright © 2018年 avatar. All rights reserved.
//

#import "YLBouncingEffectsViewController.h"
#import "FlowingMenuTransitionManager.h"
#import "FromViewControllerNeedsConform.h"

#import "YLLeftMenuTableViewController.h"
#import "UINavigationController+FDFullscreenPopGesture.h"
@interface YLBouncingEffectsViewController ()<FromViewControllerNeedsConform>
@property(strong, nonatomic) FlowingMenuTransitionManager *manager;
@end

@implementation YLBouncingEffectsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.fd_interactivePopDisabled = YES;
    // Do any additional setup after loading the view from its nib.
    self.manager = [FlowingMenuTransitionManager manager];
    [self.manager setInteractivePresentationView:self.view];
    self.manager.fromVCDelegate = self;
}

-(UIColor *)colorOfElasticShapeInFlowingMenu:(UIView *)menuView
{
    return [UIColor redColor];
}
- (void)flowingMenuNeedsPresentMenu
{
//    [self presentViewController:[[UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]] instantiateViewControllerWithIdentifier:@"menu"] animated:YES completion:nil];
    [self presentViewController:[YLLeftMenuTableViewController new] animated:YES completion:nil];
    
}

@end
