//
//  FYSystemCameraController.h
//  NCHospital
//
//  Created by SimonMiao on 16/6/13.
//  Copyright © 2016年 com.mintmedical. All rights reserved.
//

#import <UIKit/UIKit.h>

@class FYSystemCameraController;
@protocol FYSystemCameraControllerDelegate <NSObject>

- (void)systemCameraController:(FYSystemCameraController *)controller DidFinishReturnBtnIndex:(NSUInteger)btnIndex image:(UIImage *)image;

@end

@interface FYSystemCameraController : UIImagePickerController

@property (nonatomic, assign) NSUInteger btnIndex;
@property (nonatomic, weak) id <FYSystemCameraControllerDelegate> ncSCDelegate;

@end
