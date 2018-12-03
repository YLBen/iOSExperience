//
//  WZPhotoAlbumController.m
//  WZPhotoPickerController
//
//  Created by williamzhang on 15/10/23.
//  Copyright © 2015年 William Zhang. All rights reserved.
//

#import "WZPhotoAlbumController.h"
#import "WZPhotoPickerController.h"
#import "WZPhotosViewController.h"
//#import "MyDefine.h"

@interface WZPhotoAlbumController ()

@property (nonatomic, strong) NSArray *groupArray;

@end

@implementation WZPhotoAlbumController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    self.title = LOCAL(GALLERY);
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc] initWithTitle:@"done" style:UIBarButtonItemStyleBordered target:self action:@selector(clickToDismiss)];
    self.navigationItem.leftBarButtonItem = leftItem;
    
    self.tableView.separatorInset = UIEdgeInsetsZero;
    
    __weak typeof(self) weakSelf = self;
    [self setUpAlbumWithComplection:^(NSArray *assetsGroups) {
        __strong typeof(weakSelf) strongSelf = weakSelf;
        strongSelf.groupArray = assetsGroups;
        [strongSelf.tableView reloadData];
        
        [strongSelf setUpPhotosViewController];
    }];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(assetsLibraryChanged:)
                                                 name:ALAssetsLibraryChangedNotification
                                               object:nil];
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:ALAssetsLibraryChangedNotification
                                                  object:nil];
}

- (void)setUpAlbumWithComplection:(void (^)(NSArray *))completion {
    __block NSMutableArray *groupArrayTmp = [NSMutableArray array];
    
    // assetsLibrary需要持有住，不然获取完数据数据会清空
    [self.assetsLibrary enumerateGroupsWithTypes:ALAssetsGroupSavedPhotos|ALAssetsGroupPhotoStream|ALAssetsGroupAlbum usingBlock:^(ALAssetsGroup *group, BOOL *stop) {
        if (!group) {
            if (completion) {
                groupArrayTmp = [NSMutableArray arrayWithArray:[[groupArrayTmp reverseObjectEnumerator] allObjects]];
                completion(groupArrayTmp);
            }
            return;
        }
        
        [group setAssetsFilter:[ALAssetsFilter allPhotos]];
        if (![group numberOfAssets]) {
            return;
        }

        [groupArrayTmp addObject:group];
    } failureBlock:^(NSError *error) {
        NSLog(@"Group not found\n");
    }];
}

#pragma mark - Assets Library Changes
- (void)assetsLibraryChanged:(NSNotification *)notification {
    dispatch_async(dispatch_get_main_queue(), ^{
        
        __weak typeof(self) weakSelf = self;
        [self setUpAlbumWithComplection:^(NSArray *assetsGroups) {
            __strong typeof(weakSelf) strongSelf = weakSelf;
            strongSelf.groupArray = assetsGroups;
            [strongSelf.tableView reloadData];
        }];
    });
}

#pragma mark - Private Method
- (void)setUpPhotosViewController {
    ALAssetsGroup *cameraRollGourp = [self.groupArray firstObject];
    
    for (ALAssetsGroup *group in self.groupArray) {
        if ([[group valueForProperty:ALAssetsGroupPropertyType] integerValue] == ALAssetsGroupSavedPhotos) {
            cameraRollGourp = group;
        }
    }
    
    if (!cameraRollGourp) {
        return;
    }
    
    WZPhotosViewController *photosViewController = [[WZPhotosViewController alloc] initWithAssetsGroup:cameraRollGourp];
    photosViewController.pickerController = self.pickerController;
    photosViewController.assetsLibrary = self.assetsLibrary;
    
    [self.navigationController pushViewController:photosViewController animated:NO];
}

#pragma mark - Button Click
- (void)clickToDismiss {
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.groupArray count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 60;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifer = @"WZPhotoAlbum";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifer];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifer];
        [cell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
    }
    
    ALAssetsGroup *assetsGroup = [self.groupArray objectAtIndex:indexPath.row];
    
    [cell textLabel].text = [assetsGroup valueForProperty:ALAssetsGroupPropertyName];
    [cell detailTextLabel].text = [NSString stringWithFormat:@"%ld" ,[assetsGroup numberOfAssets]];
    [cell imageView].image = [UIImage imageWithCGImage:[assetsGroup posterImage]] ;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    WZPhotosViewController *photosViewController = [[WZPhotosViewController alloc] initWithAssetsGroup:self.groupArray[indexPath.item]];
    photosViewController.pickerController = self.pickerController;
    photosViewController.assetsLibrary = self.assetsLibrary;
    
    [self.navigationController pushViewController:photosViewController animated:YES];
}

#pragma mark - Initializer
- (ALAssetsLibrary *)assetsLibrary {
    if (!_assetsLibrary) {
        _assetsLibrary = [ALAssetsLibrary new];
    }
    return _assetsLibrary;
}

@end
