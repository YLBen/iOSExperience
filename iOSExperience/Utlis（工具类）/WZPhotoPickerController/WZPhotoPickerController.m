//
//  WZPhotoPickerController.m
//  WZPhotoPickerController
//
//  Created by williamzhang on 15/10/23.
//  Copyright © 2015年 William Zhang. All rights reserved.
//

#import "WZPhotoPickerController.h"
#import "BaseNavigationController.h"
#import "WZPhotoAlbumController.h"

@interface WZPhotoPickerController ()

@end

@implementation WZPhotoPickerController

- (instancetype)init {
    self = [super init];
    
    if (self) {
        self.allowMutipleSelection = YES;
        self.maximumNumberOfSelection = 9;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpAlbumsViewController];
}

- (void)setUpAlbumsViewController {
    WZPhotoAlbumController *albumsViewController = [[WZPhotoAlbumController alloc] init];
    albumsViewController.pickerController = self;
    BaseNavigationController *navigationController = [[BaseNavigationController alloc] initWithRootViewController:albumsViewController];
    
    [self addChildViewController:navigationController];

    navigationController.view.frame = self.view.bounds;
    [self.view addSubview:navigationController.view];
    
    [navigationController didMoveToParentViewController:self];
}

#pragma mark - Setter
- (void)setMaximumNumberOfSelection:(NSUInteger)maximumNumberOfSelection {
    _maximumNumberOfSelection = maximumNumberOfSelection;
    if (_maximumNumberOfSelection == 1) {
        self.allowMutipleSelection = NO;
    }
}

@end
