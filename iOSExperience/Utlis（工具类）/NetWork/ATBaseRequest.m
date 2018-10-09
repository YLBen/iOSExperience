//
//  ATBaseRequest.m
//  AttendanceDemo
//
//  Created by SimonMiao on 2017/12/22.
//  Copyright © 2017年 Avatar. All rights reserved.
//

#import "ATBaseRequest.h"
#import <AFNetworking/AFNetworking.h>
#import "NSDictionary+ATHelper.h"
//#import "ATHttpConfig.h"
#import "ATNetworkManager.h"
//#import "ATCurrentUserMgr.h"

@interface ATBaseRequest ()

@property (nonatomic, strong) NSDictionary *requestDataDic;

@end

@implementation ATBaseRequest

#pragma mark - public method

+ (void)postRequestWithMethod:(NSString *)method param:(NSDictionary *)param success:(SuccessBlock)success failure:(FailureBlock)failure {
    [self postRequestWithMethod:method httpType:@"POST" param:param success:success failure:failure];
}

+ (void)getRequestWithMethod:(NSString *)method param:(NSDictionary *)param success:(SuccessBlock)success failure:(FailureBlock)failure {
    [self postRequestWithMethod:method httpType:@"GET" param:param success:success failure:failure];
    
    //    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    //    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    ////    manager.requestSerializer.timeoutInterval = 10.f;
    //    NSString *url = [NSString stringWithFormat:@"%@%@?",URLADDRESS,method];
    //
    //    NSDictionary *mutableParams = [self configRequestParam:param method:method httpType:@"GET"];
    //    [ATNetworkManager addNetworkProgress];
    ////    NSURLSessionDataTask *aTask =
    //    [manager GET:url parameters:mutableParams progress:^(NSProgress * _Nonnull downloadProgress) {
    //
    //    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
    //        [ATNetworkManager removeNetworkProgress];
    //        [self requestFinished:responseObject success:success failure:failure];
    //        ATLog(@"get responseObject:%@",responseObject);
    //    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
    //        [ATNetworkManager removeNetworkProgress];
    //        [self requestFailed:failure];
    //        ATLog(@"post error:%@",error.description);
    //    }];
    //    ATLog(@"url:%@",aTask.currentRequest.URL);
}

+ (void)putRequestWithMethod:(NSString *)method param:(NSDictionary *)param success:(SuccessBlock)success failure:(FailureBlock)failure {
    [self postRequestWithMethod:method httpType:@"PUT" param:param success:success failure:failure];
    //    NSDictionary *requestDataDic = [self configRequestParam:param  method:method httpType:@"PUT"];
    //    //    [self cancelRequestIfNeed];
    //    NSString *url = [NSString stringWithFormat:@"%@%@",URLADDRESS,method];
    //
    //    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    //    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    //    manager.requestSerializer.timeoutInterval = 10.0;
    //    //    [NetworkManager addNetworkProgress];
    //    [manager PUT:url parameters:requestDataDic success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
    //        [self requestFinished:responseObject success:success failure:failure];
    //    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
    //        [self requestFailed:failure];
    //        ATLog(@"post error:%@",error.description);
    //    }];
}

+ (void)deleteRequestWithMethod:(NSString *)method param:(NSDictionary *)param success:(SuccessBlock)success failure:(FailureBlock)failure {
    
    [self postRequestWithMethod:method httpType:@"DELETE" param:param success:success failure:failure];
    
    //    NSDictionary *requestDataDic = [self configRequestParam:param method:method httpType:@"DELETE"];
    //
    //    NSString *url = [NSString stringWithFormat:@"%@%@",URLADDRESS,method];
    //
    //    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    //    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    //    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html",@"application/json",@"text/javascript",@"text/json",@"text/plain", nil];
    //
    //    manager.requestSerializer.HTTPMethodsEncodingParametersInURI = [NSSet setWithObjects:@"GET", @"HEAD", nil];
    
    //    [NetworkManager addNetworkProgress];
    
    //    [manager DELETE:url parameters:requestDataDic success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
    //        [self requestFinished:responseObject success:success failure:failure];
    //        ATLog(@"post responseObject:%@",responseObject);
    //    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
    //        [self requestFailed:failure];
    //        ATLog(@"post error:%@",error.description);
    //    }];
}

+ (void)updateImageWithMethod:(NSString *)method
             uploadDataNeeded:(NSData *)uploadDataNeeded
                        param:(NSDictionary *)param
                      success:(SuccessBlock)success
                      failure:(FailureBlock)failure {
    if (!uploadDataNeeded) {
        if (failure) {
//            ATLog(@"###没有数据###");
            failure(0,@"");
        }
        return;
    }
    
    NSDictionary *requestDataDic = [self configRequestParam:param method:method httpType:@"POST"];
    
    NSError *error = nil;
    NSData *dataDict = [NSJSONSerialization dataWithJSONObject:requestDataDic options:NSJSONWritingPrettyPrinted error:&error];
    if (![dataDict length] || error) {
        dataDict = [NSData data];
    }
    NSUInteger length = [dataDict length];
    
    NSMutableData *dataFinal = [NSMutableData dataWithBytes:&length length:4];
    [dataFinal appendData:dataDict];
    [dataFinal appendData:uploadDataNeeded];
    
    
    NSString *url = [NSString stringWithFormat:@"%@%@",URLADDRESS,method];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:url]];
    [request setHTTPMethod:@"post"];
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:configuration];
    
    [ATNetworkManager addNetworkProgress];
    NSURLSessionUploadTask *uploadTask = [manager uploadTaskWithRequest:request fromData:dataFinal progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } completionHandler:^(NSURLResponse * _Nonnull response, id  _Nullable responseObject, NSError * _Nullable error) {
        [ATNetworkManager removeNetworkProgress];
//        ATLog(@"responseObject:%@",responseObject);
        if (responseObject && [responseObject isKindOfClass:[NSDictionary class]]) {
            [self requestFinished:responseObject success:success failure:failure];
        }
        else if (error) {
            [self requestFailed:failure];
//            ATLog(@"post error:%@",error.description);
        }
    }];
    [uploadTask resume];
}

#pragma mark - private method

+ (void)postRequestWithMethod:(NSString *)method
                     httpType:(NSString *)httpType
                        param:(NSDictionary *)param
                      success:(SuccessBlock)success
                      failure:(FailureBlock)failure {
    NSDictionary *requestDataDic = [self configRequestParam:param method:method httpType:httpType];
    //    [self cancelRequestIfNeed];
    NSString *url = [NSString stringWithFormat:@"%@%@",URLADDRESS,method];
//    ATLog(@"HttpRequest:(%@)",url);
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    [ATNetworkManager addNetworkProgress];
    [manager POST:url parameters:requestDataDic progress:^(NSProgress * _Nonnull uploadProgress) {
        //
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [ATNetworkManager removeNetworkProgress];
        [self requestFinished:responseObject success:success failure:failure];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [ATNetworkManager removeNetworkProgress];
        [self requestFailed:failure];
//        ATLog(@"post error:%@",error.description);
    }];
}

+ (void)requestFinished:(id)responseObj success:(SuccessBlock)success failure:(FailureBlock)failure {
    
    if ([responseObj isKindOfClass:[NSDictionary class]]) {
        NSDictionary *responseObjDic = (NSDictionary *)responseObj;
        
        id body = [responseObjDic at_safeValueForKey:@"Body"];
        if ([body isKindOfClass:[NSDictionary class]]) {
            NSDictionary *bodyDic = (NSDictionary *)body;
            id response = [bodyDic at_safeValueForKey:@"response"];
            if ([response isKindOfClass:[NSDictionary class]]) {
                NSDictionary *responseDic = (NSDictionary *)response;
                NSInteger result_code = [[responseDic at_safeValueForKey:kATReturn_code] integerValue];
                if (AF_Success == result_code) {
                    id data = [responseDic at_safeValueForKey:kATReturn_data];
//                    ATLog(@"data: %@",data);
                    NSString *reason = [responseDic at_safeValueForKey:kATReturn_reason];
                    if (reason.length > 0) {
//                        ATLog(@"reason:%@",reason);
                    }
                    if (success) {
                        success(data);
                    }
                }
                else {
                    NSString *reason = [responseDic at_safeValueForKey:kATReturn_reason];
//                    ATLog(@"reason:%@",reason);
                    if (failure) {
                        failure(result_code,reason);
                    }
                }
            }
            else {
                if (failure) {
                    failure(AF_Fail,@"回调数据有误");
                }
            }
        }
        else {
            if (failure) {
                failure(AF_Fail,@"回调数据有误");
            }
        }
    }
}

+ (void)requestFailed:(FailureBlock)failure {
    if (failure) {
        failure(AF_Fail,@"请求超时，请检查网络状况后重试");
    }
}

/** 取消网络请求 */
- (void)cancelRequestIfNeed {
    
}

/** 配置共同参数 */
+ (NSDictionary *)configRequestParam:(NSDictionary *)param
                              method:(NSString *)method
                            httpType:(NSString *)httpType {
//    if (!param) {
//        param = [NSDictionary dictionary];
//    }
//
//    NSMutableDictionary *headerDict = [NSMutableDictionary dictionaryWithCapacity:0];
//
//    if (method.length) {
//        [headerDict setObject:method forKey:@"resourceUri"];
//    }
//    else {
//        NSAssert(method && method.length, @"please use api interface");
//    }
//
//    ATUserModel *userModel = [[ATCurrentUserMgr shareInstance] getCurrentUserModel];
//    if (userModel.authToken) {
//        [headerDict setObject:userModel.authToken forKey:@"authToken"];//认证的Token
//    }
//
//    [headerDict setObject:@(NO) forKey:@"async"];//当前单位code
//    [headerDict setObject:kCompanyCode forKey:@"companyCode"];//当前单位code
//
//    [headerDict setObject:httpType forKey:@"type"];//当前请求方式
//    if (userModel.companyShowID) {
//        [headerDict setObject:userModel.companyShowID forKey:@"companyShowID"];//当前单位显示id
//    }
//
//    headerDict[@"language"] = @"zh-cn";
//
//    if (userModel.userId) {
//        [headerDict setObject:userModel.userId forKey:@"loginName"];//当前登录用户showId
//    }
//    if (userModel.userTrueName) {
//        [headerDict setObject:userModel.userTrueName forKey:@"userName"];//当前登录用户姓名
//    }
//
//
//    NSMutableDictionary *bodyParam = [NSMutableDictionary dictionaryWithDictionary:param];
//    if (userModel.DEPT_SHOW_ID) {
//        [bodyParam setObject:userModel.DEPT_SHOW_ID forKey:@"DEPT_SHOW_ID"];
//    }
//    if (userModel.DEPT_NAME) {
//        [bodyParam setObject:userModel.DEPT_NAME forKey:@"DEPT_NAME"];
//    }
//    if (userModel.ADMIN_LEVEL) {
//        [bodyParam setObject:userModel.ADMIN_LEVEL forKey:@"ADMIN_LEVEL"];
//    }
//    if (userModel.ADMIN_D_SHOW_ID) {
//        [bodyParam setObject:userModel.ADMIN_D_SHOW_ID forKey:@"ADMIN_D_SHOW_ID"];
//    }
//    if (userModel.ADMIN_D_NAME) {
//        [bodyParam setObject:userModel.ADMIN_D_NAME forKey:@"ADMIN_D_NAME"];
//    }
//
//    NSDictionary *bodyDict = @{@"param" : bodyParam};
//
//    NSMutableDictionary *reqDic = [NSMutableDictionary dictionaryWithCapacity:0];
//    [reqDic setObject:headerDict forKey:@"header"];
//    [reqDic setObject:bodyDict forKey:@"body"];
//
//    return reqDic;
    return nil;
}

#pragma mark lxw add
-(AFHTTPSessionManager*)networkEngine{
    static AFHTTPSessionManager *networkEngine = nil;
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        networkEngine = [[AFHTTPSessionManager alloc] initWithSessionConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
        [self setUpEngine:networkEngine];
    });
    return networkEngine;
}

-(void)setUpEngine:(AFHTTPSessionManager*)mannger{
    mannger.requestSerializer=[AFJSONRequestSerializer serializer];
    mannger.responseSerializer = [AFJSONResponseSerializer serializer];
    ((AFJSONResponseSerializer*)(mannger.responseSerializer)).removesKeysWithNullValues = YES;
}

-(void)networkWithUrl:(NSString*)url method:(NSString*)method{
    [self networkWithUrl:url method:method params:nil];
}

-(void)networkWithUrl:(NSString *)url method:(NSString *)method params:(NSDictionary*)param{
    NSDictionary *httpParam = [ATBaseRequest configRequestParam:param method:url httpType:method];
    NSString *requsetUrl = [NSString stringWithFormat:@"%@%@",URLADDRESS,url];
    NSString *encodingURLString=[requsetUrl stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    [[[self networkEngine] POST:encodingURLString parameters:httpParam progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [self superSuccessHandle:responseObject];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [self errorHandle:@{@"code":@(error.code),
                            @"msg" :error.localizedDescription
                            }];
    }] resume];
}

-(void)superSuccessHandle:(id)data{
    if ([data isKindOfClass:[NSDictionary class]]) {
        id body = [data objectForKey:@"Body"];
        if ([body isKindOfClass:[NSDictionary class]]) {
            id response = [body objectForKey:@"response"];
            if ([response isKindOfClass:[NSDictionary class]]) {
                NSInteger code = [[response objectForKey:@"Code"] integerValue];
                if (AF_Success == code) {
                    [self successHandle:response];
                }
                else {
                    NSString *reason = [response objectForKey:@"Reason"];
                    [self errorHandle:@{@"code":@(code),
                                        @"msg" :reason.length?reason:@""
                                        }];
                }
                
            }else{
                [self errorHandle:@{@"code":@(AF_Fail),
                                    @"msg" :@"数据回调有误"
                                    }];
            }
            
        }else{
            [self errorHandle:@{@"code":@(AF_Fail),
                                @"msg" :@"数据回调有误"
                                }];
        }
        
    }else{
        [self errorHandle:@{@"code":@(AF_Fail),
                            @"msg" :@"数据回调有误"
                            }];
    }
}

-(void)excute{
    [self networkWithUrl:self.requestUrl method:self.requestType params:self.params];
}

-(NSString*)requestUrl{
    return _requestUrl;
}

- (void)successHandle:(id)data{
    if (self.successBlock) {
        self.successBlock(data);
    }
}
-(void)errorHandle:(NSDictionary*)dictionary{
    if (self.errorBlock) {
        self.errorBlock(dictionary);
    }
}
@end
