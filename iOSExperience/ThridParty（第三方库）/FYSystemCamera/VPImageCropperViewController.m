//
//  VPImageCropperViewController.m
//  VPolor
//
//  Created by Vinson.D.Warm on 12/30/13.
//  Copyright (c) 2013 Huang Vinson. All rights reserved.
//

#import "VPImageCropperViewController.h"

#define SCALE_FRAME_Y 100.0f
#define BOUNDCE_DURATION 0.3f

@interface VPImageCropperViewController ()

@property (nonatomic, retain) UIImage *originalImage;
@property (nonatomic, retain) UIImage *editedImage;

@property (nonatomic, retain) UIImageView *showImgView;
@property (nonatomic, retain) UIView *overlayView;
@property (nonatomic, retain) UIView *ratioView;

@property (nonatomic, assign) CGRect oldFrame;
@property (nonatomic, assign) CGRect largeFrame;
@property (nonatomic, assign) CGFloat limitRatio;

@property (nonatomic, assign) CGRect latestFrame;

@end

@implementation VPImageCropperViewController

- (void)dealloc {
    self.originalImage = nil;
    self.showImgView = nil;
    self.editedImage = nil;
    self.overlayView = nil;
    self.ratioView = nil;
}

- (id)initWithImage:(UIImage *)originalImage cropFrame:(CGRect)cropFrame limitScaleRatio:(NSInteger)limitRatio {
    self = [super init];
    if (self) {
        self.cropFrame = cropFrame;
        self.limitRatio = limitRatio;
        self.originalImage = originalImage;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self initView];
    [self initControlBtn];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation {
    return NO;
}

- (void)initView {
    self.showImgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, 480)];
    [self.showImgView setMultipleTouchEnabled:YES];
    [self.showImgView setUserInteractionEnabled:YES];
    [self.showImgView setImage:self.originalImage];
    [self.showImgView setUserInteractionEnabled:YES];
    [self.showImgView setMultipleTouchEnabled:YES];
    
    // scale to fit the screen  缩放比例以适应屏幕
    CGFloat oriWidth = self.cropFrame.size.width;
    CGFloat oriHeight = self.originalImage.size.height * (oriWidth / self.originalImage.size.width);
    CGFloat oriX = self.cropFrame.origin.x + (self.cropFrame.size.width - oriWidth) / 2;
    CGFloat oriY = self.cropFrame.origin.y + (self.cropFrame.size.height - oriHeight) / 2;
    self.oldFrame = CGRectMake(oriX, oriY, oriWidth, oriHeight);
    self.latestFrame = self.oldFrame;
    self.showImgView.frame = self.oldFrame;
    
    self.largeFrame = CGRectMake(0, 0, self.limitRatio * self.oldFrame.size.width, self.limitRatio * self.oldFrame.size.height);
    
    [self addGestureRecognizers];
    [self.view addSubview:self.showImgView];
    
    self.overlayView = [[UIView alloc] initWithFrame:self.view.bounds];
    self.overlayView.alpha = .5f;
    self.overlayView.backgroundColor = [UIColor blackColor];
    self.overlayView.userInteractionEnabled = NO;
    self.overlayView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    [self.view addSubview:self.overlayView];
    
    if (self.isRectangleClip) {
        self.ratioView = [[UIView alloc] initWithFrame:CGRectMake(self.cropFrame.origin.x, self.cropFrame.origin.y, self.cropFrame.size.width, self.view.frame.size.width*0.8)];
        self.ratioView.layer.borderColor = [UIColor yellowColor].CGColor;
        self.ratioView.layer.borderWidth = 1.0f;
        
    } else {
        //默认区域裁剪
        self.ratioView = [[UIView alloc] initWithFrame:CGRectMake(self.cropFrame.origin.x, self.cropFrame.origin.y, self.cropFrame.size.width, self.cropFrame.size.width)];
        self.ratioView.layer.borderColor = [UIColor yellowColor].CGColor;
        self.ratioView.layer.borderWidth = 1.0f;
    }
    
    
    
    self.ratioView.autoresizingMask = UIViewAutoresizingNone;
    [self.view addSubview:self.ratioView];
    
    [self overlayClipping];
}

// 初始化按钮
- (void)initControlBtn {
    UIView *btnBgView = [[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetHeight(self.view.bounds) - 50.0f, CGRectGetWidth(self.view.bounds), 50)];
    btnBgView.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.6];
    [self.view addSubview:btnBgView];
    
    UIButton *cancelBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    cancelBtn.titleLabel.textColor = [UIColor whiteColor];
    [cancelBtn setTitle:@"取消" forState:UIControlStateNormal];
    UIFont *btnFont = [UIFont systemFontOfSize:18.0f];
    [cancelBtn.titleLabel setFont:btnFont];
    CGSize btnTitleSize = [cancelBtn.titleLabel.text sizeWithAttributes:@{NSFontAttributeName : btnFont}];
    cancelBtn.frame = CGRectMake(10, (CGRectGetHeight(btnBgView.frame) - btnTitleSize.height) / 2, btnTitleSize.width, btnTitleSize.height);
//    [cancelBtn.titleLabel setTextAlignment:NSTextAlignmentCenter];
//    [cancelBtn.titleLabel setLineBreakMode:NSLineBreakByWordWrapping];
//    [cancelBtn.titleLabel setNumberOfLines:0];
//    [cancelBtn setTitleEdgeInsets:UIEdgeInsetsMake(5.0f, 5.0f, 5.0f, 5.0f)];
    [cancelBtn addTarget:self action:@selector(cancel:) forControlEvents:UIControlEventTouchUpInside];
    [btnBgView addSubview:cancelBtn];
    
    UIButton *confirmBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    confirmBtn.titleLabel.textColor = [UIColor whiteColor];
    [confirmBtn setTitle:@"确定" forState:UIControlStateNormal];
    [confirmBtn.titleLabel setFont:btnFont];
    btnTitleSize = [confirmBtn.titleLabel.text sizeWithAttributes:@{NSFontAttributeName : btnFont}];
    confirmBtn.frame = CGRectMake(CGRectGetWidth(btnBgView.frame) - btnTitleSize.width - 10, CGRectGetMinX(cancelBtn.frame), btnTitleSize.width, btnTitleSize.height);
//    [confirmBtn.titleLabel setTextAlignment:NSTextAlignmentCenter];
    confirmBtn.titleLabel.textColor = [UIColor whiteColor];
//    [confirmBtn.titleLabel setLineBreakMode:NSLineBreakByWordWrapping];
//    [confirmBtn.titleLabel setNumberOfLines:0];
//    [confirmBtn setTitleEdgeInsets:UIEdgeInsetsMake(5.0f, 5.0f, 5.0f, 5.0f)];
    [confirmBtn addTarget:self action:@selector(confirm:) forControlEvents:UIControlEventTouchUpInside];
    [btnBgView addSubview:confirmBtn];
}

- (void)cancel:(id)sender {
    if (self.delegate && [self.delegate conformsToProtocol:@protocol(VPImageCropperDelegate)]) {
        [self.delegate imageCropperDidCancel:self];
    }
}

- (void)confirm:(id)sender {
    if (self.delegate && [self.delegate conformsToProtocol:@protocol(VPImageCropperDelegate)]) {
        [self.delegate imageCropper:self didFinished:[self getSubImage]];
    }
}

//叠加裁剪
- (void)overlayClipping
{
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
    CGMutablePathRef path = CGPathCreateMutable();
    // Left side of the ratio view   左侧的比例视图
    CGPathAddRect(path, nil, CGRectMake(0, 0,
                                        self.ratioView.frame.origin.x,
                                        self.overlayView.frame.size.height));
    // Right side of the ratio view   右侧的比例视图
    CGPathAddRect(path, nil, CGRectMake(
                                        self.ratioView.frame.origin.x + self.ratioView.frame.size.width,
                                        0,
                                        self.overlayView.frame.size.width - self.ratioView.frame.origin.x - self.ratioView.frame.size.width,
                                        self.overlayView.frame.size.height));
    // Top side of the ratio view   比例视图的顶部边
    CGPathAddRect(path, nil, CGRectMake(0, 0,
                                        self.overlayView.frame.size.width,
                                        self.ratioView.frame.origin.y));
    // Bottom side of the ratio view   比例视图的底部边
    CGPathAddRect(path, nil, CGRectMake(0,
                                        self.ratioView.frame.origin.y + self.ratioView.frame.size.height,
                                        self.overlayView.frame.size.width,
                                        self.overlayView.frame.size.height - self.ratioView.frame.origin.y + self.ratioView.frame.size.height));
    maskLayer.path = path;
    self.overlayView.layer.mask = maskLayer;
    CGPathRelease(path);
}

// register all gestures   登记所有的手势
- (void) addGestureRecognizers
{
    // add pinch gesture 增加捏手势
    UIPinchGestureRecognizer *pinchGestureRecognizer = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(pinchView:)];
    [self.view addGestureRecognizer:pinchGestureRecognizer];
    
    // add pan gesture  添加平移手势
    UIPanGestureRecognizer *panGestureRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panView:)];
    [self.view addGestureRecognizer:panGestureRecognizer];
}

// pinch gesture handler 捏手势处理程序
- (void) pinchView:(UIPinchGestureRecognizer *)pinchGestureRecognizer
{
    UIView *view = self.showImgView;
    if (pinchGestureRecognizer.state == UIGestureRecognizerStateBegan || pinchGestureRecognizer.state == UIGestureRecognizerStateChanged) {
        view.transform = CGAffineTransformScale(view.transform, pinchGestureRecognizer.scale, pinchGestureRecognizer.scale);
        pinchGestureRecognizer.scale = 1;
    }
    else if (pinchGestureRecognizer.state == UIGestureRecognizerStateEnded) {
        CGRect newFrame = self.showImgView.frame;
        newFrame = [self handleScaleOverflow:newFrame];
        newFrame = [self handleBorderOverflow:newFrame];
        [UIView animateWithDuration:BOUNDCE_DURATION animations:^{
            self.showImgView.frame = newFrame;
            self.latestFrame = newFrame;
        }];
    }
}

// pan gesture handler   平移手势处理程序
- (void) panView:(UIPanGestureRecognizer *)panGestureRecognizer
{
    UIView *view = self.showImgView;
    if (panGestureRecognizer.state == UIGestureRecognizerStateBegan || panGestureRecognizer.state == UIGestureRecognizerStateChanged) {
        // calculate accelerator
        CGFloat absCenterX = self.cropFrame.origin.x + self.cropFrame.size.width / 2;
        CGFloat absCenterY = self.cropFrame.origin.y + self.cropFrame.size.height / 2;
        CGFloat scaleRatio = self.showImgView.frame.size.width / self.cropFrame.size.width;
        CGFloat acceleratorX = 1 - ABS(absCenterX - view.center.x) / (scaleRatio * absCenterX);
        CGFloat acceleratorY = 1 - ABS(absCenterY - view.center.y) / (scaleRatio * absCenterY);
        CGPoint translation = [panGestureRecognizer translationInView:view.superview];
        [view setCenter:(CGPoint){view.center.x + translation.x * acceleratorX, view.center.y + translation.y * acceleratorY}];
        [panGestureRecognizer setTranslation:CGPointZero inView:view.superview];
    }
    else if (panGestureRecognizer.state == UIGestureRecognizerStateEnded) {
        // bounce to original frame
        CGRect newFrame = self.showImgView.frame;
        newFrame = [self handleBorderOverflow:newFrame];
        [UIView animateWithDuration:BOUNDCE_DURATION animations:^{
            self.showImgView.frame = newFrame;
            self.latestFrame = newFrame;
        }];
    }
}

- (CGRect)handleScaleOverflow:(CGRect)newFrame {
    // bounce to original frame    反弹到原始帧
    CGPoint oriCenter = CGPointMake(newFrame.origin.x + newFrame.size.width/2, newFrame.origin.y + newFrame.size.height/2);
    if (newFrame.size.width < self.oldFrame.size.width) {
        newFrame = self.oldFrame;
    }
    if (newFrame.size.width > self.largeFrame.size.width) {
        newFrame = self.largeFrame;
    }
    newFrame.origin.x = oriCenter.x - newFrame.size.width/2;
    newFrame.origin.y = oriCenter.y - newFrame.size.height/2;
    return newFrame;
}

- (CGRect)handleBorderOverflow:(CGRect)newFrame {
    // horizontally   水平
    if (newFrame.origin.x > self.cropFrame.origin.x) newFrame.origin.x = self.cropFrame.origin.x;
    if (CGRectGetMaxX(newFrame) < self.cropFrame.size.width) newFrame.origin.x = self.cropFrame.size.width - newFrame.size.width;
    // vertically   垂直
    if (newFrame.origin.y > self.cropFrame.origin.y) newFrame.origin.y = self.cropFrame.origin.y;
    if (CGRectGetMaxY(newFrame) < self.cropFrame.origin.y + self.cropFrame.size.height) {
        newFrame.origin.y = self.cropFrame.origin.y + self.cropFrame.size.height - newFrame.size.height;
    }
    // adapt horizontally rectangle     适应水平矩形
    if (self.showImgView.frame.size.width > self.showImgView.frame.size.height && newFrame.size.height <= self.cropFrame.size.height) {
        newFrame.origin.y = self.cropFrame.origin.y + (self.cropFrame.size.height - newFrame.size.height) / 2;
    }
    return newFrame;
}

//  得到子图像
-(UIImage *)getSubImage{
    CGRect squareFrame = self.cropFrame;
    CGFloat scaleRatio = self.latestFrame.size.width / self.originalImage.size.width;
    CGFloat x = (squareFrame.origin.x - self.latestFrame.origin.x) / scaleRatio;
    CGFloat y = (squareFrame.origin.y - self.latestFrame.origin.y) / scaleRatio;
    CGFloat w = squareFrame.size.width / scaleRatio;
    
    CGFloat h;
    if (self.isRectangleClip) {
        h = squareFrame.size.width / scaleRatio * 0.8;
    } else {
        h = squareFrame.size.width / scaleRatio;
    }
    
//    NSLog(@"w:%f,h:%f",w,h);
    
    if (self.latestFrame.size.width < self.cropFrame.size.width) {
        CGFloat newW = self.originalImage.size.width;
        CGFloat newH = newW * (self.cropFrame.size.height / self.cropFrame.size.width);
        x = 0; y = y + (h - newH) / 2;
        w = newH; h = newH;
    }
    if (self.latestFrame.size.height < self.cropFrame.size.height) {
        CGFloat newH = self.originalImage.size.height;
        CGFloat newW = newH * (self.cropFrame.size.width / self.cropFrame.size.height);
        x = x + (w - newW) / 2; y = 0;
        w = newH; h = newH;
    }
    CGRect myImageRect = CGRectMake(x, y, w, h);
    CGImageRef imageRef = self.originalImage.CGImage;
    CGImageRef subImageRef = CGImageCreateWithImageInRect(imageRef, myImageRect);
    CGSize size;
    size.width = myImageRect.size.width;
    size.height = myImageRect.size.height;
    UIGraphicsBeginImageContext(size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextDrawImage(context, myImageRect, subImageRef);
    UIImage* smallImage = [UIImage imageWithCGImage:subImageRef];
    UIGraphicsEndImageContext();
    return smallImage;
}

@end
