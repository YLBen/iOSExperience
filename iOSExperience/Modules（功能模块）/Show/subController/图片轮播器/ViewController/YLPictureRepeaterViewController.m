//
//  YLPictureRepeaterViewController.m
//  iOSExperience
//
//  Created by Ben Lv on 2018/8/23.
//  Copyright © 2018年 avatar. All rights reserved.
//

#import "YLPictureRepeaterViewController.h"
#import "UINavigationController+FDFullscreenPopGesture.h"
#import <Masonry.h>
@interface YLPictureRepeaterViewController ()<UIScrollViewDelegate>
@property(nonatomic,strong)UIScrollView *scrollView;
@property(nonatomic,strong)UIPageControl *pageControl;

@property(nonatomic,strong)NSTimer *timer;
@end

@implementation YLPictureRepeaterViewController

#pragma mark - life cycle
- (void)viewDidLoad {
    [super viewDidLoad];
//    self.navigationController.fd_fullscreenPopGestureRecognizer.enabled = NO;
    self.title = @"图片轮播器";
    [self buildUI];
//     self.timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(scrollImage) userInfo:nil repeats:YES];
////    改变timer 优先级
//    NSRunLoop *runLoop = [NSRunLoop currentRunLoop];
//    [runLoop addTimer:self.timer forMode:NSRunLoopCommonModes];
}
#pragma mark - public methods

#pragma mark - private methods
- (void)buildUI {
   
    [self.view addSubview:self.scrollView];
    //    [self.scrollView addSubview:self.pageControl];
    [self.view addSubview:self.pageControl];
    
    [self initConstraints];
    
    CGFloat imgW = 300;
    CGFloat imgH = 130;
    CGFloat imgY = 0;
    // 1. 循环创建5个UIImageView添加到ScrollView中
    for (int i = 0; i < 5; i++) {
        // 创建一个UIImageView
        UIImageView *imgView = [[UIImageView alloc] init];
        
        // 设置UIImageView中的图片
        NSString *imgName = [NSString stringWithFormat:@"img_%02d", i + 1];
        imgView.image = [UIImage imageNamed:imgName];
        
        // 计算每个UIImageView在UIScrollView中的x坐标值
        CGFloat imgX = i * imgW;
        // 设置imgView的frame
        imgView.frame = CGRectMake(imgX, imgY, imgW, imgH);
        
        // 把imgView添加到UIScrollView中
        [self.scrollView addSubview:imgView];
    }
    CGFloat maxW = self.scrollView.frame.size.width * 5;
    self.scrollView.contentSize = CGSizeMake(maxW, imgH);
    
 
}

- (void)scrollImage
{
    // 每次执行这个方法的时候, 都要让图片滚动到下一页
    // 如何让UIScrollView滚动到下一页?
    // 1. 获取当前的UIPageControl的页码
    NSInteger page = self.pageControl.currentPage;
    
    // 2. 判断页码是否到了最后一页, 如果到了最后一页, 那么设置页码为0（回到第一页）。如果没有到达最后一页, 则让页码+1
    if (page == self.pageControl.numberOfPages - 1) {
        // 表示已经到达最后一页了
        page = 0; // 回到第一页
    } else {
        page++;
    }
    // 3. 用每页的宽度 * (页码 + 1) == 计算除了下一页的contentOffset.x
    CGFloat offsetX = page * self.scrollView.frame.size.width;
    
    // 4. 设置UIScrollView的contentOffset等于新的偏移的值
    [self.scrollView setContentOffset:CGPointMake(offsetX, 0) animated:YES];
    
    
}

- (void)initConstraints {
    [self.scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.width.mas_equalTo(300);
        make.height.mas_equalTo(130);
        make.top.equalTo(self.view).offset(40);
    }];
    [self.pageControl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.scrollView);
        make.bottom.equalTo(self.scrollView.mas_bottom).offset(-10);
        make.width.mas_equalTo(150);
        make.height.mas_equalTo(20);
    }];
    
}
#pragma mark - getter && setter

#pragma mark - lazy loading
- (UIScrollView *)scrollView {
    if (!_scrollView) {
        _scrollView = [[UIScrollView alloc] init];
//        _scrollView.pagingEnabled = YES;
//        _scrollView.scrollEnabled = YES;
//        _scrollView.showsHorizontalScrollIndicator = NO;
        _scrollView.delegate = self;
    }
    return _scrollView;
    
}

- (UIPageControl *)pageControl {
    if (!_pageControl) {
        _pageControl = [[UIPageControl alloc] init];
        _pageControl.numberOfPages = 5;
        _pageControl.currentPage = 0;
        _pageControl.currentPageIndicatorTintColor = [UIColor redColor];
        _pageControl.tintColor = [UIColor blueColor];
    
    }
    return _pageControl;
    
}

#pragma mark - delegate scrollView代理方法
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    // 停止计时器
    // 调用invalidate一旦停止计时器, 那么这个计时器就不可再重用了。下次必须重新创建一个新的计时器对象。
    [self.timer invalidate];
    
    // 因为当调用完毕invalidate方法以后, 这个计时器对象就已经废了，无法重用了。所以可以直接将self.timer设置为nil
    self.timer = nil;
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    
    // 重新启动一个计时器
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(scrollImage) userInfo:nil repeats:YES];
    
    // 再次修改一下新创建的timer的优先级
    // 修改self.timer的优先级与控件一样
    // 获取当前的消息循环对象
    NSRunLoop *runLoop = [NSRunLoop currentRunLoop];
    // 改变self.timer对象的优先级
    [runLoop addTimer:self.timer forMode:NSRunLoopCommonModes];
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    
    // 如何计算当前滚动到了第几页？
    // 1. 获取滚动的x方向的偏移值
    CGFloat offsetX = scrollView.contentOffset.x;
    // 用已经偏移了得值, 加上半页的宽度
    offsetX = offsetX + (scrollView.frame.size.width * 0.5);
    
    // 2. 用x方向的偏移的值除以一张图片的宽度(每一页的宽度)，取商就是当前滚动到了第几页（索引）
    int page = offsetX / scrollView.frame.size.width;
    
    // 3. 将页码设置给UIPageControl
    self.pageControl.currentPage = page;
    
    //NSLog(@"滚了，要在这里根据当前的滚动来计算当前是第几页。");
}
@end
