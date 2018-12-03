//
//  WZPhotoAlbumController.h
//  WZPhotoPickerController
//
//  Created by williamzhang on 15/10/23.
//  Copyright © 2015年 William Zhang. All rights reserved.
//  相册集界面

#import <UIKit/UIKit.h>
#import <AssetsLibrary/AssetsLibrary.h>
#import <Photos/Photos.h>

@class WZPhotoPickerController;

@interface WZPhotoAlbumController : UITableViewController

@property (nonatomic, strong) WZPhotoPickerController *pickerController;

@property (nonatomic, strong) ALAssetsLibrary *assetsLibrary;

@end
