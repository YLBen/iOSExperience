//
//  YLFileMannger.h
//  iOSExperience
//
//  Created by Ben Lv on 2018/11/4.
//  Copyright © 2018年 avatar. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface YLFileMannger : NSObject
+(YLFileMannger *)instance;
- (NSString*)directoryForAttatchment;
- (BOOL)deleteCachesFile;
@end

NS_ASSUME_NONNULL_END
