//
//  YLBaseNavigationController.m
//  iOSExperience
//
//  Created by Ben Lv on 2018/5/26.
//  Copyright © 2018年 avatar. All rights reserved.
//

#import "YLBaseNavigationController.h"

#define PC_IS_IPHONE (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
#define PC_IS_IPHONE_X (PC_IS_IPHONE && [[UIScreen mainScreen] bounds].size.height == 812.0f)
@interface YLBaseNavigationController ()<UIGestureRecognizerDelegate>

@end

@implementation YLBaseNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (instancetype)initWithRootViewController:(UIViewController *)rootViewController {
    self = [super initWithRootViewController:rootViewController];
    if (self) {
        self.navigationBar.translucent = NO;
    }
    
    return self;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        UINavigationBar *navigationBar = [UINavigationBar appearance];
        navigationBar.barTintColor = [UIColor whiteColor];
        if ([navigationBar respondsToSelector:@selector(shadowImage)]) {
            [navigationBar setShadowImage:[[UIImage alloc]init]];
        }
        self.navigationBar.translucent = YES;
    }
    return self;
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    if (self.viewControllers.count > 0) {
//        适配iphoneX
        if (!PC_IS_IPHONE_X) {
//            //            viewController.hidesBottomBarWhenPushed = YES;
        }
        viewController.hidesBottomBarWhenPushed = YES;
        UIBarButtonItem *leftItem = [[UIBarButtonItem alloc] initWithImage:[[UIImage imageNamed:@"navBar_back_orange"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]
                                                                     style:UIBarButtonItemStylePlain
                                                                    target:self
                                                                    action:@selector(backLastController)];
        viewController.navigationItem.leftBarButtonItem = leftItem;
        self.interactivePopGestureRecognizer.delegate = self;
    }
    [super pushViewController:viewController animated:animated];
}

- (void)backLastController {
    [self popViewControllerAnimated:YES];
}
@end
