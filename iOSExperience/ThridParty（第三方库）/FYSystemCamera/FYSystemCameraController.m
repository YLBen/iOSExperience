//
//  FYSystemCameraController.m
//  NCHospital
//
//  Created by SimonMiao on 16/6/13.
//  Copyright © 2016年 com.mintmedical. All rights reserved.
//

#import "FYSystemCameraController.h"
#import <MediaPlayer/MediaPlayer.h>
#import <MobileCoreServices/MobileCoreServices.h>

@interface FYSystemCameraController () <UINavigationControllerDelegate, UIImagePickerControllerDelegate>
{
//    UIImagePickerController *_imagePickerController;
}
@end

@implementation FYSystemCameraController

- (void)viewDidLoad {
    [super viewDidLoad];
//    _imagePickerController = [[UIImagePickerController alloc] init];
    self.delegate = self;
//    self.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    self.allowsEditing = NO;
    
    if (self.sourceType == UIImagePickerControllerSourceTypeCamera) {
        [self selectImageFromCamera];
    } else {
        
    }
}

- (void)selectImageFromCamera {
//    self.sourceType = UIImagePickerControllerSourceTypeCamera;
    
    self.mediaTypes = @[(NSString *)kUTTypeImage];
    //设置摄像头模式（拍照模式，录制视频模型包含拍照模式）
    self.cameraCaptureMode = UIImagePickerControllerCameraCaptureModePhoto;
}

- (void)selectImageFromAlbum
{
    //NSLog(@"相册");
//    self.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    
}

#pragma mark - UIImagePickerControllerDelegate

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info {
    NSString *mediaType=[info objectForKey:UIImagePickerControllerMediaType];
    if ([mediaType isEqualToString:(NSString *)kUTTypeImage]) {
        UIImage *originalImg = [info objectForKey:UIImagePickerControllerOriginalImage];
//        UIImage *cropImg = [info objectForKey:UIImagePickerControllerCropRect];
//        CCLog(@"&&&&&&&info&&&&&&&&&&:%@",info);
        if ([_ncSCDelegate respondsToSelector:@selector(systemCameraController:DidFinishReturnBtnIndex:image:)]) {
            [_ncSCDelegate systemCameraController:self DidFinishReturnBtnIndex:_btnIndex image:originalImg];
        }
    }
//    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
