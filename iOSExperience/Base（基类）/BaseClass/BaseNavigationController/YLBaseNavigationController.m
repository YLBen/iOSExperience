//
//  YLBaseNavigationController.m
//  iOSExperience
//
//  Created by Ben Lv on 2018/5/26.
//  Copyright © 2018年 avatar. All rights reserved.
//

#import "YLBaseNavigationController.h"
#import "XYTransition.h"
#import "XYTransitionProtocol.h"

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
#pragma mark ————— 转场动画区 —————

//navigation切换是会走这个代理
-(id<UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController animationControllerForOperation:(UINavigationControllerOperation)operation fromViewController:(UIViewController *)fromVC toViewController:(UIViewController *)toVC
{
    NSLog(@"转场动画代理方法");
//    self.isSystemSlidBack = YES;
    //如果来源VC和目标VC都实现协议，那么都做动画
    if ([fromVC conformsToProtocol:@protocol(XYTransitionProtocol)] && [toVC conformsToProtocol:@protocol(XYTransitionProtocol)]) {
        
        BOOL pinterestNedd = [self isNeedTransition:fromVC:toVC];
        XYTransition *transion = [XYTransition new];
        if (operation == UINavigationControllerOperationPush && pinterestNedd) {
            transion.isPush = YES;
            
            //暂时屏蔽带动画的右划返回
//            self.isSystemSlidBack = NO;
            //            self.isSystemSlidBack = YES;
        }
        else if(operation == UINavigationControllerOperationPop && pinterestNedd)
        {
            //暂时屏蔽带动画的右划返回
            //            return nil;
            
            transion.isPush = NO;
//            self.isSystemSlidBack = NO;
        }
        else{
            return nil;
        }
        return transion;
    }else if([toVC conformsToProtocol:@protocol(XYTransitionProtocol)]){
        //如果只有目标VC开启动画，那么isSystemSlidBack也要随之改变
        BOOL pinterestNedd = [self isNeedTransition:toVC];
//        self.isSystemSlidBack = !pinterestNedd;
        return nil;
    }
    return nil;
}

//判断fromVC和toVC是否需要实现pinterest效果
-(BOOL)isNeedTransition:(UIViewController<XYTransitionProtocol> *)fromVC :(UIViewController<XYTransitionProtocol> *)toVC
{
    BOOL a = NO;
    BOOL b = NO;
    if ([fromVC respondsToSelector:@selector(isNeedTransition)] && [fromVC isNeedTransition]) {
        a = YES;
    }
    if ([toVC respondsToSelector:@selector(isNeedTransition)] && [toVC isNeedTransition]) {
        b = YES;
    }
    return (a && b) ;
    
}
//判断fromVC和toVC是否需要实现pinterest效果
-(BOOL)isNeedTransition:(UIViewController<XYTransitionProtocol> *)toVC
{
    BOOL b = NO;
    if ([toVC respondsToSelector:@selector(isNeedTransition)] && [toVC isNeedTransition]) {
        b = YES;
    }
    return b;
    
}


@end
