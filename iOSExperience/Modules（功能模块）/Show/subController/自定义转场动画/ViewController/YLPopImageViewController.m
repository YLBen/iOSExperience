//
//  YLPopImageViewController.m
//  iOSExperience
//
//  Created by Ben Lv on 2018/10/9.
//  Copyright © 2018年 avatar. All rights reserved.
//

#import "YLPopImageViewController.h"
#import <Masonry.h>

@interface YLPopImageViewController ()<UINavigationBarDelegate>
@property(nonatomic,strong)UIImageView *imageView;
@end

@implementation YLPopImageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.imageView];
    [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
//    self.navigationController.delegate = self;
    
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

//- (id<UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController animationControllerForOperation:(UINavigationControllerOperation)operation fromViewController:(UIViewController *)fromVC toViewController:(UIViewController *)toVC{
//    if (operation == UINavigationControllerOperationPop) {
//        return [LRTranstionAnimationPop new];
//    }else{
//        return nil;
//    }
//}
@end
