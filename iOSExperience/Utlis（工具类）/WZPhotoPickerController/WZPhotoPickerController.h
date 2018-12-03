//
//  WZPhotoPickerController.h
//  WZPhotoPickerController
//
//  Created by williamzhang on 15/10/23.
//  Copyright © 2015年 William Zhang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AssetsLibrary/AssetsLibrary.h>

@class WZPhotoPickerController;

@protocol WZPhotoPickerControllerDelegate <NSObject>

/// assets:ALAsset
- (void)wz_imagePickerController:(WZPhotoPickerController *)photoPickerController didSelectAssets:(NSArray *)assets;

@end

@interface WZPhotoPickerController : UIViewController

@property (nonatomic, weak) id<WZPhotoPickerControllerDelegate> delegate;

/// 默认YES
@property (nonatomic, assign) BOOL allowMutipleSelection;
/// 默认9张
@property (nonatomic, assign) NSUInteger maximumNumberOfSelection;

@end
