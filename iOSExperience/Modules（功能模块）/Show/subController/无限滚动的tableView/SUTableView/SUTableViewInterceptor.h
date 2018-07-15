//
//  SUTableViewInterceptor.h
//  ZHIBO
//
//  Created by 万众科技 on 16/7/28.
//  Copyright © 2016年 WanZhong. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SUTableViewInterceptor : NSObject
//接受者
@property (nonatomic, weak) id receiver;
//中间人
@property (nonatomic, weak) id middleMan;

@end
