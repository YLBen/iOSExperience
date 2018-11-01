//
//  YLCleanCache.h
//  iOSExperience
//
//  Created by Ben Lv on 2018/10/31.
//  Copyright © 2018年 avatar. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef void(^cleanCacheBlock)();
NS_ASSUME_NONNULL_BEGIN

@interface YLCleanCache : NSObject

/**
 *  清理缓存
 */
+(void)cleanCache:(cleanCacheBlock)block;
/**
 *  整个缓存目录的大小
 */
+(float)folderSizeAtPath;

@end

NS_ASSUME_NONNULL_END
