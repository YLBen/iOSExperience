//
//  WZPhotosViewController.m
//  WZPhotoPickerController
//
//  Created by williamzhang on 15/12/29.
//  Copyright © 2015年 William Zhang. All rights reserved.
//

#import "WZPhotosViewController.h"
#import <AssetsLibrary/AssetsLibrary.h>
#import "WZPhotoThumbnailCollectionViewCell.h"
#import "WZPhotoPickerController.h"
#import <Masonry/Masonry.h>
//#import "UIView+Util.h"
//#import "MyDefine.h"
//#import "Category.h"

@interface WZPhotosViewController () <UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) UILabel  *selectCountLabel;
@property (nonatomic, strong) UIButton *doneButton;

@property (nonatomic, readonly) ALAssetsGroup *assetsGroup;

@property (nonatomic, strong) NSMutableArray *photosArray;
@property (nonatomic, strong) NSMutableOrderedSet *selectedAssetURLs;

@property (nonatomic, strong) NSIndexPath *lastSelectedItemIndexPath;

@end

@implementation WZPhotosViewController

- (instancetype)initWithAssetsGroup:(ALAssetsGroup *)assetsGroup {
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.minimumInteritemSpacing = 2;
    layout.minimumLineSpacing = 2;
    layout.sectionInset = UIEdgeInsetsMake(2, 2, 2, 2);
    
    self = [super initWithCollectionViewLayout:layout];
    if (self) {
        _assetsGroup = assetsGroup;
        [self setUpPhotos];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(assetsLibraryChanged:)
                                                 name:ALAssetsLibraryChangedNotification
                                               object:nil];
    
    self.title = [self.assetsGroup valueForProperty:ALAssetsGroupPropertyName];

    self.collectionView.allowsMultipleSelection = self.pickerController.allowMutipleSelection;
    self.collectionView.backgroundColor = [UIColor whiteColor];
    [self.collectionView registerClass:[WZPhotoThumbnailCollectionViewCell class] forCellWithReuseIdentifier:[WZPhotoThumbnailCollectionViewCell identifier]];
    
    [self performSelector:@selector(scrollToBottom) withObject:nil afterDelay:0.0];
    
    [self setUpToolbarItems];
    [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.equalTo(self.view);
        make.bottom.equalTo(self.view).offset(-49);
    }];
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:ALAssetsLibraryChangedNotification
                                                  object:nil];
}

#pragma mark - SetUp
- (void)setUpPhotos {
    NSMutableArray *photos = [NSMutableArray array];
    [self.assetsGroup enumerateAssetsUsingBlock:^(ALAsset *result, NSUInteger index, BOOL *stop) {
        if (!result) {
            return;
        }
        
        [photos addObject:result];
    }];
    
    self.photosArray = photos;
}

- (void)setUpToolbarItems {
    UIView *toolbarView = [[UIView alloc] init];
    [toolbarView setBackgroundColor:[UIColor colorWithWhite:1 alpha:0.5]];
    [self.view addSubview:toolbarView];
    
    [toolbarView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(self.view);
        make.height.equalTo(@49);
    }];
    
    [toolbarView addSubview:self.selectCountLabel];
    [self.selectCountLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(toolbarView);
        make.left.equalTo(toolbarView).offset(12);
    }];
    
    [toolbarView addSubview:self.doneButton];
    [self.doneButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(toolbarView);
        make.right.equalTo(toolbarView).offset(-12);
    }];
}

#pragma mark - Button Click
- (void)clickToDone {
    if (![self.pickerController.delegate respondsToSelector:@selector(wz_imagePickerController:didSelectAssets:)]) {
        return;
    }
    
    [self fetchAssetsFromSelectedAssetURLsWithCompletion:^(NSArray *assets) {
        [self.pickerController.delegate wz_imagePickerController:self.pickerController didSelectAssets:assets];
    }];
}

#pragma mark - Private Method
- (void)updateDoneButtonState {
    NSUInteger selectedCount = [self.selectedAssetURLs count];
    
    [self.doneButton setEnabled:selectedCount != 0];
    [self.selectCountLabel setText:[NSString stringWithFormat:@"%ld/%ld",selectedCount, self.pickerController.maximumNumberOfSelection]];
}

- (void)scrollToBottom {
    [self.collectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForItem:[self.photosArray count] - 1 inSection:0] atScrollPosition:UICollectionViewScrollPositionBottom animated:NO];
}

/// 整理选择的图片
- (void)fetchAssetsFromSelectedAssetURLsWithCompletion:(void(^)(NSArray *assets))completion {
    
    ALAssetsLibrary *assetsLibrary = self.assetsLibrary;
    NSMutableOrderedSet *selectedAssetURLs = self.selectedAssetURLs;
    
    __block NSMutableArray *assets = [NSMutableArray array];
    
    void (^checkNumberOfAssets)(void) = ^{
        if (assets.count == selectedAssetURLs.count) {
            if (completion) {
                completion([assets copy]);
            }
        }
    };
    
    for (NSURL *assetURL in selectedAssetURLs) {
        [assetsLibrary assetForURL:assetURL
                       resultBlock:^(ALAsset *asset) {
                           if (asset) {
                               // Add asset
                               [assets addObject:asset];
                               
                               // Check if the loading finished
                               checkNumberOfAssets();
                           } else {
                               [assetsLibrary enumerateGroupsWithTypes:ALAssetsGroupPhotoStream usingBlock:^(ALAssetsGroup *group, BOOL *stop) {
                                   [group enumerateAssetsWithOptions:NSEnumerationReverse usingBlock:^(ALAsset *result, NSUInteger index, BOOL *stop) {
                                       if ([result.defaultRepresentation.url isEqual:assetURL]) {
                                           // Add asset
                                           [assets addObject:result];
                                           
                                           // Check if the loading finished
                                           checkNumberOfAssets();
                                           
                                           *stop = YES;
                                       }
                                   }];
                               } failureBlock:^(NSError *error) {
                                   NSLog(@"Error: %@", [error localizedDescription]);
                               }];
                           }
                       } failureBlock:^(NSError *error) {
                           NSLog(@"Error: %@", [error localizedDescription]);
                       }];
    }
}

#pragma mark - Handling Assets Library Changes

- (void)assetsLibraryChanged:(NSNotification *)notification
{
    dispatch_async(dispatch_get_main_queue(), ^{
        NSSet *updatedAssetsGroups = notification.userInfo[ALAssetLibraryUpdatedAssetGroupsKey];
        NSURL *assetsGroupURL = [self.assetsGroup valueForProperty:ALAssetsGroupPropertyURL];
        
        for (NSURL *updatedAssetsGroupURL in updatedAssetsGroups) {
            if ([updatedAssetsGroupURL isEqual:assetsGroupURL]) {
                [self setUpPhotos];
                [self.collectionView reloadData];
            }
        }
    });
}

#pragma mark - UICollectionView DataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [self.photosArray count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    WZPhotoThumbnailCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:[WZPhotoThumbnailCollectionViewCell identifier] forIndexPath:indexPath];
    
    // Image
    ALAsset *asset = self.photosArray[indexPath.item];
    UIImage *image = [UIImage imageWithCGImage:[asset thumbnail]];
    cell.imageView.image = image;
    
    NSURL *assetURL = [asset valueForProperty:ALAssetPropertyAssetURL];
    [cell setSelected:[self.selectedAssetURLs containsObject:assetURL]];
    
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    NSInteger numberOfColunms = 4;
    CGFloat width = (CGRectGetWidth(self.view.frame) - 2.0 * (numberOfColunms + 1)) / numberOfColunms;
    return CGSizeMake(width, width);
}

#pragma mark - UICollectionView Delegate
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    if (!self.pickerController.allowMutipleSelection) {
        return YES;
    }
    
    return [self.selectedAssetURLs count] < self.pickerController.maximumNumberOfSelection;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    ALAsset *asset = self.photosArray[indexPath.item];
    NSURL *assetURL = [asset valueForProperty:ALAssetPropertyAssetURL];
    
    if (self.lastSelectedItemIndexPath && !self.pickerController.allowMutipleSelection) {
        [collectionView deselectItemAtIndexPath:self.lastSelectedItemIndexPath animated:NO];
    }
    
    self.lastSelectedItemIndexPath = indexPath;
    
    [self.selectedAssetURLs addObject:assetURL];
    [self updateDoneButtonState];
}

- (void)collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath {
    ALAsset *asset = self.photosArray[indexPath.item];
    NSURL *assetURL = [asset valueForProperty:ALAssetPropertyAssetURL];
    
    self.lastSelectedItemIndexPath = nil;
    
    [self.selectedAssetURLs removeObject:assetURL];
    [self updateDoneButtonState];
}

#pragma mark - Initializer
- (NSMutableArray *)photosArray {
    if (!_photosArray) {
        _photosArray = [NSMutableArray array];
    }
    return _photosArray;
}

- (NSMutableOrderedSet *)selectedAssetURLs {
    if (!_selectedAssetURLs) {
        _selectedAssetURLs = [NSMutableOrderedSet orderedSet];
    }
    return _selectedAssetURLs;
}

- (UILabel *)selectCountLabel {
    if (!_selectCountLabel) {
        _selectCountLabel = [[UILabel alloc] init];
        _selectCountLabel.text = [NSString stringWithFormat:@"0/%ld",self.pickerController.maximumNumberOfSelection];
        _selectCountLabel.font = [UIFont systemFontOfSize:15];
        _selectCountLabel.textColor = [UIColor blackColor];
    }
    return _selectCountLabel;
}

- (UIButton *)doneButton {
    if (!_doneButton) {
        _doneButton = [UIButton new];
        
//        [_doneButton setBackgroundImage:[UIImage imageColor:[UIColor themeBlue]] forState:UIControlStateNormal];
        [_doneButton setTitle:@"done" forState:UIControlStateNormal];
//        _doneButton.expandSize = CGSizeMake(20, 10);
        [_doneButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        _doneButton.titleLabel.font = [UIFont systemFontOfSize:26];
        _doneButton.layer.cornerRadius = 3.0;
        [_doneButton setClipsToBounds:YES];
        
        [_doneButton addTarget:self action:@selector(clickToDone) forControlEvents:UIControlEventTouchUpInside];
    }
    return _doneButton;
}

@end
