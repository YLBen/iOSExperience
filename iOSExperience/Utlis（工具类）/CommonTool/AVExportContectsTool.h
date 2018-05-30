//
//  AVExportContectsTool.h
//  CPPCC_iOS
//
//  Created by SimonMiao on 2017/6/30.
//  Copyright © 2017年 Avatar. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AVExportContectsTool : NSObject

+ (BOOL)av_exportToPhoneWithFirstName:(NSString *)firstName
                           department:(NSString *)department
                               mobile:(NSString *)mobile
                            telephone:(NSString *)telephone
                              u_email:(NSString *)u_email;

@end
