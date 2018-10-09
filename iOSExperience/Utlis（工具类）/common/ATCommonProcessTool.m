//
//  ATCommonProcessTool.m
//  launcher 下城1call
//
//  Created by SimonMiao on 2017/10/9.
//  Copyright © 2017年 Avatar. All rights reserved.
//

#import "ATCommonProcessTool.h"
//#import "ContactPersonDetailInformationModel.h"
//#import "ATCurrentUserMgr.h"

@implementation ATCommonProcessTool

+ (NSString *)at_getDisplayStrByReplacingWithFormartStr:(NSString *)formartStr {
    NSString *displayStr = [formartStr stringByReplacingOccurrencesOfString:@"●" withString:@"、"];
    if (!displayStr) {
        displayStr = @"";
    }
    
    return displayStr;
}

+ (NSString *)at_getFormartStrByReplacingWithDisplayStr:(NSString *)displayStr {
    NSString *formartStr = [displayStr stringByReplacingOccurrencesOfString:@"、" withString:@"●"];
    if (!formartStr) {
        formartStr = @"";
    }
    
    return formartStr;
}

+ (NSString *)at_getDisplayStrByJoinWithArr:(NSArray *)arr {
    if (0 == arr.count) {
        return @"";
    }
    else {
        NSString *displayStr = [arr componentsJoinedByString:@"、"];
        
        return displayStr;
    }
}

+ (NSString *)at_getApprovePathDisplayStrByJoinWithArr:(NSArray *)arr {
    if (0 == arr.count) {
        return @"";
    }
    else {
        NSString *displayStr = [arr componentsJoinedByString:@"->"];
        
        return displayStr;
    }
}

+ (NSString *)at_getFormartStrByJoinWithArr:(NSArray *)arr {
    if (0 == arr.count) {
        return @"";
    }
    else {
        NSString *formartStr = [arr componentsJoinedByString:@"●"];
        
        return formartStr;
    }
}

+ (NSArray *)at_getSeparateArrWithFormartStr:(NSString *)formartStr {
    NSArray *separateArr = [formartStr componentsSeparatedByString:@"●"];
    return separateArr;
}

+ (NSString *)at_getChineseWeekWithWeekday:(NSInteger)weekday {
    NSString *weekStr = @"";
    switch (weekday) {
        case 1:
            weekStr = @"日";
            break;
        case 2:
            weekStr = @"一";
            break;
        case 3:
            weekStr = @"二";
            break;
        case 4:
            weekStr = @"三";
            break;
        case 5:
            weekStr = @"四";
            break;
        case 6:
            weekStr = @"五";
            break;
        case 7:
            weekStr = @"六";
            break;
            
        default:
            break;
    }
    
    return weekStr;
}

//+ (NSArray *)at_getFormartStrArrWithSelectUserArr:(NSArray <ContactPersonDetailInformationModel *>*)userArr {
//    if (![userArr.firstObject isKindOfClass:[ContactPersonDetailInformationModel class]]) {
//        return @[@"",@""];
//    }
//    NSString *showId = @"";
//    NSString *name = @"";
//    for (ContactPersonDetailInformationModel *model in userArr)
//    {
//        showId = [showId stringByAppendingString:model.show_id];
//        name = [name stringByAppendingString:model.u_true_name];
//        if (![model isEqual:userArr.lastObject]) {
//            showId = [showId stringByAppendingString:@"●"];
//            name = [name stringByAppendingString:@"●"];
//        }
//    }
//    NSArray *strArr = @[showId,name];
//    return strArr;
//}

+ (NSString *)getCacheSizeWithSize:(NSUInteger)cacheSize {
    NSString *cacheSizeStr = nil;
    if (cacheSize < 1024) {
        cacheSizeStr = [NSString stringWithFormat:@"%.2f B", (float)cacheSize];
    } else if (cacheSize >= 1024 && cacheSize < 1024 * 1024) { // KB
        cacheSizeStr = [NSString stringWithFormat:@"%.2f KB", (float)cacheSize / 1024];
    } else if (cacheSize >= 1024 * 1024 && cacheSize < 1024 * 1024 * 1024) { // MB
        cacheSizeStr = [NSString stringWithFormat:@"%.2f MB", (float)cacheSize / (1024 * 1024)];
    }
    
    return cacheSizeStr;
}

+ (NSString *)at_getFileIconPathWithFileName:(NSString *)fileName {
//    NSString *fileIconPath;
    NSString *fileTypeName = [[NSString alloc] init];
    
    fileTypeName = [fileName pathExtension];
    fileTypeName = [fileTypeName lowercaseString];
    
    if ([fileTypeName isEqualToString:@"txt"]) {
        return @"file_icon_txt";
    }
    else if ([@[@"htm", @"html"] containsObject:fileTypeName]) {
        return @"file_icon_html5";
    }
    else if ([@[@"jpg", @"jpeg", @"png", @"gif"] containsObject:fileTypeName]) {
        return @"file_icon_image";
    }
    else if ([fileTypeName isEqualToString:@"xml"]) {
        return @"file_icon_xml";
    }
    else if ([@[@"doc",@"docx"] containsObject:fileTypeName]) {
        return @"file_icon_word";
    }
    else if ([@[@"xls",@"xlsx"] containsObject:fileTypeName]) {
        return @"file_icon_xls";
    }
    else if ([@[@"pptx",@"ppt"] containsObject:fileTypeName]) {
        return @"file_icon_ppt";
    }
    else if ([fileTypeName isEqualToString:@"pdf"]) {
        return @"file_icon_pdf";
    }
    else if ([@[@"rar", @"zip"] containsObject:fileTypeName]) {
        return @"file_icon_rar";
    }
    else if ([@[@"wps"] containsObject:fileTypeName])
    {
        return @"file_icon_wps";
    }
    else
    {
        return @"file_icon_unknown";
    }
    
}

//+ (NSString *)at_getSpecifiedLoginNameFromLoginInfo {
//    ATUserModel *userModel = [[ATCurrentUserMgr shareInstance] getCurrentUserModel];
//    NSString *tempName = userModel.userName;
//    if (0 == tempName.length) {
//        tempName = userModel.mail;
//        if (0 == tempName.length) {
//            tempName = userModel.phone;
//        }
//    }
//    
//    return tempName;
//}
    
@end
