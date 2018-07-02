//
//  YLTabBarControllerConfig.m
//  iOSExperience
//
//  Created by Ben Lv on 2018/5/27.
//  Copyright © 2018年 avatar. All rights reserved.
//

#import "YLTabBarControllerConfig.h"
#import "UIColor+YLHelper.h"
#import "YLBaseNavigationController.h"

typedef NS_ENUM(NSInteger, PCTabBabConfigType) {
    PCTabBabConfigType_home,
    PCTabBabConfigType_performance,
    PCTabBabConfigType_notice,
    PCTabBabConfigType_contacts,
    PCTabBabConfigType_my
};

static NSInteger const kTabBarCount = 5;

static NSString *const kTabBarVCTitle_home = @"Show";
static NSString *const kTabBarVCTitle_performance = @"动态";
static NSString *const kTabBarVCTitle_notice = @"通知公告";
static NSString *const kTabBarVCTitle_contacts = @"通讯录";
static NSString *const kTabBarVCTitle_my = @"我的";

static NSString *const key_TabBarVC = @"tabBarVC";
static NSString *const key_TabBarVCTitle = @"tabBarVCTitle";
//角标
static NSString *const key_TabBarItemBadgeValue = @"tabBarItemBadgeValue";

@interface YLTabBarControllerConfig ()

@property (nonatomic, readwrite, strong) CYLTabBarController *tabBarController;

@property (nonatomic, strong) NSDictionary *vcInfoDic;

@end

@implementation YLTabBarControllerConfig

/**
 *  lazy load tabBarController
 *
 *  @return CYLTabBarController
 */
//懒加载
- (CYLTabBarController *)tabBarController {
    if (_tabBarController == nil) {
        //        CYLTabBarController *tabBarController = [CYLTabBarController tabBarControllerWithViewControllers:self.viewControllers
        //                                                                                   tabBarItemsAttributes:self.tabBarItemsAttributesForController];
        /**
         * 以下两行代码目的在于手动设置让TabBarItem只显示图标，不显示文字，并让图标垂直居中。
         * 等效于在 `-tabBarItemsAttributesForController` 方法中不传 `CYLTabBarItemTitle` 字段。
         * 更推荐后一种做法。
         */
        //       内边距
        UIEdgeInsets imageInsets = UIEdgeInsetsZero;//UIEdgeInsetsMake(4.5, 0, -4.5, 0);
        //        偏移量
        UIOffset titlePositionAdjustment = UIOffsetZero;//UIOffsetMake(0, MAXFLOAT);
        //        创建CYLTabBarController
        CYLTabBarController *tabBarController = [CYLTabBarController tabBarControllerWithViewControllers:self.viewControllers
                                                                                   tabBarItemsAttributes:self.tabBarItemsAttributesForController imageInsets:imageInsets titlePositionAdjustment:titlePositionAdjustment];
        //      TabBar自定义设置
        [self customizeTabBarAppearance:tabBarController];
        _tabBarController = tabBarController;
    }
    return _tabBarController;
}
// 遍历 从vcInfoForTabBarType 创建ViewController 并设置为nav控制器的根控制器
- (NSArray *)viewControllers {
    NSMutableArray *viewControllers = [NSMutableArray arrayWithCapacity:kTabBarCount];
    for (NSInteger i = 0; i < kTabBarCount; i ++) {
        NSDictionary *vcInfoDic = [self vcInfoForTabBarType:i];
        
        UIViewController *ctr = [(UIViewController *)[NSClassFromString(vcInfoDic[key_TabBarVC]) alloc] init];
        ctr.title = vcInfoDic[key_TabBarVCTitle];
        YLBaseNavigationController *navController = [[YLBaseNavigationController alloc]
                                                     initWithRootViewController:ctr];
        [viewControllers addObject:navController];
    }
    
    return viewControllers;
}

#pragma mark - VC
//设置tableBar ViewController  标题 角标
- (NSDictionary *)vcInfoForTabBarType:(PCTabBabConfigType)type {
    if (!_vcInfoDic) {
        _vcInfoDic = @{
                       @(PCTabBabConfigType_home) : @{
                               key_TabBarVC : @"YLShowViewController",
                               key_TabBarVCTitle : kTabBarVCTitle_home,
                               key_TabBarItemBadgeValue : @(0)
                               },
                       @(PCTabBabConfigType_performance) : @{
                               key_TabBarVC : @"PersonListViewController",
                               key_TabBarVCTitle : kTabBarVCTitle_performance,
                               key_TabBarItemBadgeValue : @(0)
                               },
                       @(PCTabBabConfigType_notice) : @{
                               key_TabBarVC : @"YLViewController3",
                               key_TabBarVCTitle : kTabBarVCTitle_notice,
                               key_TabBarItemBadgeValue : @(0)
                               },
                       @(PCTabBabConfigType_contacts) : @{
                               //                               key_TabBarVC : @"PCContactsViewController",
                               key_TabBarVC : @"YLViewController4",
                               key_TabBarVCTitle : kTabBarVCTitle_contacts,
                               key_TabBarItemBadgeValue : @(0)
                               },
                       @(PCTabBabConfigType_my) : @{
                               key_TabBarVC : @"YLViewController5",
                               key_TabBarVCTitle : kTabBarVCTitle_my,
                               key_TabBarItemBadgeValue : @(0)
                               }
                       };
    }
    return _vcInfoDic[@(type)];
}
//设置tabbar title  普通，选中状态的image
- (NSArray *)tabBarItemsAttributesForController {
    NSDictionary *firstTabBarItemsAttributes = @{
                                                 CYLTabBarItemTitle : kTabBarVCTitle_home,
                                                 CYLTabBarItemImage : @"tabBar_home_normal",
                                                 CYLTabBarItemSelectedImage : @"tabBar_home_highlight",
                                                 };
    NSDictionary *secondTabBarItemsAttributes = @{
                                                  CYLTabBarItemTitle : kTabBarVCTitle_performance,
                                                  CYLTabBarItemImage : @"tabBar_performance_normal",
                                                  CYLTabBarItemSelectedImage : @"tabBar_performance_highlight",
                                                  };
    NSDictionary *thirdTabBarItemsAttributes = @{
                                                 CYLTabBarItemTitle : kTabBarVCTitle_notice,
                                                 CYLTabBarItemImage : @"tabBar_notice_normal",
                                                 CYLTabBarItemSelectedImage : @"tabBar_notice_highlight",
                                                 };
    NSDictionary *fourthTabBarItemsAttributes = @{
                                                  CYLTabBarItemTitle : kTabBarVCTitle_contacts,
                                                  CYLTabBarItemImage : @"tabBar_contacts_normal",
                                                  CYLTabBarItemSelectedImage : @"tabBar_contacts_highlight"
                                                  };
    NSDictionary *fiveTabBarItemsAttributes = @{
                                                CYLTabBarItemTitle : kTabBarVCTitle_my,
                                                CYLTabBarItemImage : @"tabBar_my_normal",
                                                CYLTabBarItemSelectedImage : @"tabBar_my_highlight"
                                                };
    //    添加到数组中
    NSArray *tabBarItemsAttributes = @[
                                       firstTabBarItemsAttributes,
                                       secondTabBarItemsAttributes,
                                       thirdTabBarItemsAttributes,
                                       fourthTabBarItemsAttributes,
                                       
                                       fiveTabBarItemsAttributes
                                       ];
    return tabBarItemsAttributes;
}


/**
 *  更多TabBar自定义设置：比如：tabBarItem 的选中和不选中文字和背景图片属性、tabbar 背景图片属性等等
 */
- (void)customizeTabBarAppearance:(CYLTabBarController *)tabBarController {
#warning CUSTOMIZE YOUR TABBAR APPEARANCE
    // Customize UITabBar height
    // 自定义 TabBar 高度
    //    tabBarController.tabBarHeight = 44.f;
    
    // set the text color for unselected state
    // 普通状态下的文字属性
    NSMutableDictionary *normalAttrs = [NSMutableDictionary dictionary];
    normalAttrs[NSForegroundColorAttributeName] = [UIColor av_fontDarkGrayColor];
    
    // set the text color for selected state
    // 选中状态下的文字属性
    NSMutableDictionary *selectedAttrs = [NSMutableDictionary dictionary];
    selectedAttrs[NSForegroundColorAttributeName] = [UIColor av_themeOrangeColor];
    
    // set the text Attributes
    // 设置文字属性
    UITabBarItem *tabBar = [UITabBarItem appearance];
    [tabBar setTitleTextAttributes:normalAttrs forState:UIControlStateNormal];
    [tabBar setTitleTextAttributes:selectedAttrs forState:UIControlStateSelected];
    
    // Set the dark color to selected tab (the dimmed background)
    // TabBarItem选中后的背景颜色
    // [self customizeTabBarSelectionIndicatorImage];
    
    // update TabBar when TabBarItem width did update
    // If your app need support UIDeviceOrientationLandscapeLeft or UIDeviceOrientationLandscapeRight，
    // remove the comment '//'
    // 如果你的App需要支持横竖屏，请使用该方法移除注释 '//'
    // [self updateTabBarCustomizationWhenTabBarItemWidthDidUpdate];
    
    // set the bar shadow image
    // This shadow image attribute is ignored if the tab bar does not also have a custom background image.So at least set somthing.
    [[UITabBar appearance] setBackgroundImage:[[UIImage alloc] init]];
    [[UITabBar appearance] setBackgroundColor:[UIColor whiteColor]];
    [[UITabBar appearance] setShadowImage:[UIImage imageNamed:@"tabBar_top_line"]];
    
    // set the bar background image
    // 设置背景图片
    // UITabBar *tabBarAppearance = [UITabBar appearance];
    // [tabBarAppearance setBackgroundImage:[UIImage imageNamed:@"tabBar_background"]];
    
    // remove the bar system shadow image
    // 去除 TabBar 自带的顶部阴影
    // [[UITabBar appearance] setShadowImage:[[UIImage alloc] init]];
}


@end
