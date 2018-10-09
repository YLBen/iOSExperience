//
//  ATBaseRequest.h
//  AttendanceDemo
//
//  Created by SimonMiao on 2017/12/22.
//  Copyright © 2017年 Avatar. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ATHttpConfig.h"
#import "AFNetworking/AFNetworking.h"
typedef void(^SuccessBlock)(id data);
typedef void(^FailureBlock)(NSInteger resultId,NSString *errorMsg);
/** lxw add*/
typedef void (^SUCCESS_BLOCK)(id data);
typedef void (^FAILURE_BLOCK)(NSDictionary* dictionary);
@interface ATBaseRequest : NSObject

@property (nonatomic, strong) NSMutableDictionary *params;
/** lxw add*/
@property (nonatomic,copy) FAILURE_BLOCK errorBlock;
@property (nonatomic,copy) SUCCESS_BLOCK successBlock;
@property (nonatomic,copy) NSString *requestUrl;
@property (nonatomic,copy) NSString *requestType;

+ (void)postRequestWithMethod:(NSString *)method param:(NSDictionary *)param success:(SuccessBlock)success failure:(FailureBlock)failure;

+ (void)getRequestWithMethod:(NSString *)method param:(NSDictionary *)param success:(SuccessBlock)success failure:(FailureBlock)failure;

+ (void)putRequestWithMethod:(NSString *)method param:(NSDictionary *)param success:(SuccessBlock)success failure:(FailureBlock)failure;

+ (void)deleteRequestWithMethod:(NSString *)method param:(NSDictionary *)param success:(SuccessBlock)success failure:(FailureBlock)failure;


/** 图片分包上传 */
+ (void)updateImageWithMethod:(NSString *)method
             uploadDataNeeded:(NSData *)uploadDataNeeded
                        param:(NSDictionary *)param
                      success:(SuccessBlock)success
                      failure:(FailureBlock)failure;
/*lxw add*/

-(void)excute;

-(NSString*)requestUrl;

-(void)successHandle:(id)data;

-(void)errorHandle:(NSDictionary*)dictionary;

-(void)networkWithUrl:(NSString*)url method:(NSString*)method;

-(void)networkWithUrl:(NSString *)url method:(NSString *)method params:(NSDictionary*)param;

@end
