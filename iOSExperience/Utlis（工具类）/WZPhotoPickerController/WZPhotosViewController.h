//
//  WZPhotosViewController.h
//  WZPhotoPickerController
//
//  Created by williamzhang on 15/12/29.
//  Copyright © 2015年 William Zhang. All rights reserved.
//  相册界面

#import <UIKit/UIKit.h>

@class ALAssetsGroup, ALAssetsLibrary, WZPhotoPickerController;

@interface WZPhotosViewController : UICollectionViewController

@property (nonatomic, strong) WZPhotoPickerController *pickerController;
@property (nonatomic, strong) ALAssetsLibrary *assetsLibrary;

- (instancetype)initWithAssetsGroup:(ALAssetsGroup *)assetsGroup;

@end
