//
//  YLPopImageViewController.m
//  iOSExperience
//
//  Created by Ben Lv on 2018/10/9.
//  Copyright © 2018年 avatar. All rights reserved.
//

#import "YLPopImageViewController.h"
#import <Masonry.h>

#import "YLTranstionAnimationPop.h"
@interface YLPopImageViewController ()<UINavigationControllerDelegate>
@property(nonatomic,strong)UIImageView *imageView;
@property(nonatomic,strong)UIPercentDrivenInteractiveTransition *interactiveTransition;
@end

@implementation YLPopImageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.imageView];
    [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    self.navigationController.delegate = self;
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handelTap:)];
    [self.view addGestureRecognizer:tap];
}

- (UIImageView *)imageView {
    if (!_imageView) {
        _imageView = [[UIImageView alloc] init];
    }
    return _imageView;
    
}

-(void)setImage:(UIImage *)image {
    _image = image;
    self.imageView.image = image;
    
}

- (void)handelTap:(UITapGestureRecognizer *)gestureRecognizer {
    self.interactiveTransition = [UIPercentDrivenInteractiveTransition new];
    [ self.interactiveTransition finishInteractiveTransition];
    
}

//为这个动画添加用户交互
- (id <UIViewControllerInteractiveTransitioning>)navigationController:(UINavigationController *)navigationController
                          interactionControllerForAnimationController:(id <UIViewControllerAnimatedTransitioning>) animationController {
    return self.interactiveTransition;
}

- (id<UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController animationControllerForOperation:(UINavigationControllerOperation)operation fromViewController:(UIViewController *)fromVC toViewController:(UIViewController *)toVC{
    if (operation == UINavigationControllerOperationPop) {
        return [YLTranstionAnimationPop new];
    }else{
        return nil;
    }
}
@end
