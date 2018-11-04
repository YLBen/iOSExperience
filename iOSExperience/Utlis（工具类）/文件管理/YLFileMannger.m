//
//  YLFileMannger.m
//  iOSExperience
//
//  Created by Ben Lv on 2018/11/4.
//  Copyright © 2018年 avatar. All rights reserved.
//

#define DIRECTORY_ATTATCHMENT    @"attachment"
#define DIRECTORY_Audio @"attachment/Audio"
#import "YLFileMannger.h"

@implementation YLFileMannger
+(YLFileMannger *)instance {
    
    static YLFileMannger *mannger = nil;
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        mannger = [[YLFileMannger alloc] init];
    });
    return mannger;
    
}
#pragma mark documents
- (NSString *)documentsPathWithName:(NSString *)name
{
    NSFileManager *mannger = [NSFileManager defaultManager];
    NSArray  *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *userId = @"YL";
    NSString *documentPathAtUserId = [[paths objectAtIndex:0] stringByAppendingPathComponent:userId];
    NSString *documentPathAtUserIdByName = [documentPathAtUserId stringByAppendingPathComponent:name];
    BOOL isDirectory;
    BOOL exist = [mannger fileExistsAtPath:documentPathAtUserIdByName isDirectory:&isDirectory];
    if (!(exist && isDirectory))
    {
        [mannger createDirectoryAtPath:documentPathAtUserIdByName withIntermediateDirectories:YES attributes:nil error:nil];
    }
    
    return documentPathAtUserIdByName;
}
#pragma mark caches
- (NSString *)cachesPathWithName:(NSString *)name
{
    NSFileManager *mannger = [NSFileManager defaultManager];
    NSArray  *paths = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
    NSString *userId = @"YL";
    NSString *documentPathAtUserId = [[paths objectAtIndex:0] stringByAppendingPathComponent:userId];
    NSString *documentPathAtUserIdByName = [documentPathAtUserId stringByAppendingPathComponent:name];
    BOOL isDirectory;
    BOOL exist = [mannger fileExistsAtPath:documentPathAtUserIdByName isDirectory:&isDirectory];
    if (!(exist && isDirectory))
    {
        [mannger createDirectoryAtPath:documentPathAtUserIdByName withIntermediateDirectories:YES attributes:nil error:nil];
    }
    
    return documentPathAtUserIdByName;
}
#pragma mark Tmp
- (NSString *)tmpPathWithName:(NSString *)name
{
    NSFileManager *mannger = [NSFileManager defaultManager];
    NSString  *paths = NSTemporaryDirectory();
    NSString *userId = @"YL";
    NSString *documentPathAtUserId = [paths stringByAppendingPathComponent:userId];
    NSString *documentPathAtUserIdByName = [documentPathAtUserId stringByAppendingPathComponent:name];
    BOOL isDirectory;
    BOOL exist = [mannger fileExistsAtPath:documentPathAtUserIdByName isDirectory:&isDirectory];
    if (!(exist && isDirectory))
    {
        [mannger createDirectoryAtPath:documentPathAtUserIdByName withIntermediateDirectories:YES attributes:nil error:nil];
    }
    
    return documentPathAtUserIdByName;
}


-(NSString*)directoryForAttatchment
{
    return [self cachesPathWithName:DIRECTORY_Audio];
}

- (BOOL)deleteCachesFile {
     NSFileManager *fileManager = [NSFileManager defaultManager];
    NSError *error;
    BOOL res=[fileManager removeItemAtPath:[self directoryForAttatchment] error:&error];
    if (!res) {
        YLLog(@"%@",error);
    }
    return res;
}

//获取文件及目录的大小
- (float)sizeOfDirectory:(NSString *)dir{
    NSDirectoryEnumerator *direnum = [[NSFileManager defaultManager] enumeratorAtPath:dir];
    NSString *pname;
    int64_t s=0;
    while (pname = [direnum nextObject]){
        //NSLog(@"pname   %@",pname);
        NSDictionary *currentdict=[direnum fileAttributes];
        NSString *filesize=[NSString stringWithFormat:@"%@",[currentdict objectForKey:NSFileSize]];
        NSString *filetype=[currentdict objectForKey:NSFileType];
        
        if([filetype isEqualToString:NSFileTypeDirectory]) continue;
        s=s+[filesize longLongValue];
    }
    return s*1.0;
}
//根据路径获取文件目录下所有文件
- (NSArray *)getAllFloderByName:(NSString *)path
{
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    NSArray * fileAndFloderArr = [self getAllFileByName:path];
    
    NSMutableArray *dirArray = [[NSMutableArray alloc] init];
    BOOL isDir = NO;
    //在上面那段程序中获得的fileList中列出文件夹名
    for (NSString * file in fileAndFloderArr){
        
        NSString *paths = [path stringByAppendingPathComponent:file];
        [fileManager fileExistsAtPath:paths isDirectory:(&isDir)];
        if (isDir) {
            [dirArray addObject:file];
        }
        isDir = NO;
    }
    return dirArray;
}
//根据路径获取该路径下所有目录
-(NSArray *)getAllFileByName:(NSString *)path
{
    NSFileManager *defaultManager = [NSFileManager defaultManager];
    NSArray *array = [defaultManager contentsOfDirectoryAtPath:path error:nil];
    return array;
}

@end
