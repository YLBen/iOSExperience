//
//  YLLocalImageUpload.m
//  iOSExperience
//
//  Created by Ben Lv on 2018/5/28.
//  Copyright © 2018年 avatar. All rights reserved.
//

#import "YLLocalImageUpload.h"
#import "FYSystemCameraController.h"
#import "VPImageCropperViewController.h"
#import <AVFoundation/AVCaptureDevice.h>
#import "ATSettingPermissionCheckTool.h"
#import "UIImage+YLHelper.h"
#import "UIView+YLLoading.h"
@interface YLLocalImageUpload ()<UINavigationControllerDelegate,UIImagePickerControllerDelegate,FYSystemCameraControllerDelegate,VPImageCropperDelegate>
{
    UIViewController *_currentCameraOrPhotoCtr;
}
@property (weak, nonatomic) IBOutlet UIImageView *headerV;

@property(nonatomic,strong) UIImagePickerController *imagePicker; //声明全局的UIImagePickerController

@end

@implementation YLLocalImageUpload

#pragma mark - life cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setImgUI];
}

#pragma mark - private methods
- (void)setImgUI {
    //UIimageView的基本设置
    _headerV.layer.cornerRadius = 100/2;
    _headerV.clipsToBounds = YES;
    _headerV.layer.borderWidth = 1;
    _headerV.layer.borderColor = [UIColor lightGrayColor].CGColor;
    _headerV.userInteractionEnabled = YES;
    [_headerV addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(headClick)]];
}

- (void)headClick {
    [self userAvatarUpdateInMyView];
    
}

- (void)userAvatarUpdateInMyView {
    UIAlertController *alertCtr = [UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    UIAlertAction *cameraAction = [UIAlertAction actionWithTitle:@"拍照" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        if (TARGET_IPHONE_SIMULATOR) {
            [self.view av_postMessage:@"只能在真机中运行"];
            return;
        }

        AVAuthorizationStatus status = [AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeVideo];
        switch (status) {
            case AVAuthorizationStatusNotDetermined:{
                // 许可对话没有出现，发起授权许可
                
                [AVCaptureDevice requestAccessForMediaType:AVMediaTypeVideo completionHandler:^(BOOL granted) {
                    dispatch_async(dispatch_get_main_queue(), ^{
                        if (granted) {
                            //第一次用户接受
                            [self goToSystemCamera];
                        }else{
                            //用户拒绝
                            [ATSettingPermissionCheckTool at_showAlertAndjumpToSettingPageWithTitle:@"相机权限未开启" message:@"相机权限未开启，请进入系统【设置】>【隐私】>【相机】中打开开关,开启相机功能" currentCtr:self];
                        }
                    });
                }];
                break;
            }
            case AVAuthorizationStatusAuthorized:{
                [self goToSystemCamera];
                break;
            }
            case AVAuthorizationStatusDenied:
            case AVAuthorizationStatusRestricted:
                // 用户明确地拒绝授权，或者相机设备无法访问
                [ATSettingPermissionCheckTool at_showAlertAndjumpToSettingPageWithTitle:@"相机权限未开启" message:@"相机权限未开启，请进入系统【设置】>【隐私】>【相机】中打开开关,开启相机功能" currentCtr:self];
                break;
            default:
                break;
        }
        
    }];
    UIAlertAction *photoAction = [UIAlertAction actionWithTitle:@"相册" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        // 相册
        FYSystemCameraController *ctr = [[FYSystemCameraController alloc] init];
        ctr.btnIndex = 1;
        ctr.ncSCDelegate = self;
        ctr.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        [self presentViewController:ctr animated:YES completion:nil];
        self->_currentCameraOrPhotoCtr = ctr;
    }];
    if ([cameraAction valueForKey:@"titleTextColor"]) {
        [cameraAction setValue:[UIColor redColor] forKey:@"titleTextColor"];
    }
    if ([photoAction valueForKey:@"titleTextColor"]) {
        [photoAction setValue:[UIColor redColor] forKey:@"titleTextColor"];
    }
    
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
    }];
    
    [alertCtr addAction:cameraAction];
    [alertCtr addAction:photoAction];
    [alertCtr addAction:cancelAction];
    [self presentViewController:alertCtr animated:YES completion:nil];
}

#pragma mark - private methods

- (void)goToSystemCamera {
    // 相机
    FYSystemCameraController *controller = [[FYSystemCameraController alloc] init];
    controller.btnIndex = 0;
    controller.ncSCDelegate = self;
    controller.sourceType = UIImagePickerControllerSourceTypeCamera;
    [self presentViewController:controller animated:YES completion:nil];
    _currentCameraOrPhotoCtr = controller;
}
#pragma mark - FYSystemCameraControllerDelegate

- (void)systemCameraController:(FYSystemCameraController *)controller DidFinishReturnBtnIndex:(NSUInteger)btnIndex image:(UIImage *)image {
    UIImage *portraitImg = [UIImage av_imageByScalingToMaxSize:image];
    //[UIImage fy_imageByScalingToMaxSize:image];
    // 裁剪
    VPImageCropperViewController *imgEditorVC = [[VPImageCropperViewController alloc] initWithImage:portraitImg cropFrame:CGRectMake(0, 100.0f, self.view.frame.size.width, self.view.frame.size.width) limitScaleRatio:3.0];
    imgEditorVC.delegate = self;
    imgEditorVC.isRectangleClip = NO;
    [controller presentViewController:imgEditorVC animated:YES completion:^{
        // TO DO
    }];
    //    [controller dismissViewControllerAnimated:YES completion:^{
    //
    //    }];
}
#pragma mark - VPImageCropperDelegate

- (void)imageCropper:(VPImageCropperViewController *)cropperViewController didFinished:(UIImage *)editedImage {
    
    editedImage = [editedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    [self.headerV setImage:editedImage];
    
    
    [cropperViewController dismissViewControllerAnimated:YES completion:^{
        // TO DO
    }];
    if (_currentCameraOrPhotoCtr) {
        [_currentCameraOrPhotoCtr dismissViewControllerAnimated:NO completion:nil];
    }
}

- (void)imageCropperDidCancel:(VPImageCropperViewController *)cropperViewController {
    [cropperViewController dismissViewControllerAnimated:YES completion:^{
    }];
}


@end
