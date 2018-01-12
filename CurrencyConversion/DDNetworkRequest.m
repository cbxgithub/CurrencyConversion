//
//  DDNetworkRequest.m
//  CurrencyConversion
//
//  Created by yll on 2017/8/7.
//  Copyright © 2017年 yll. All rights reserved.
//

#import "DDNetworkRequest.h"

static AFNetworkReachabilityManager *netStatus = nil;

@implementation DDNetworkRequest

+ (DDNetworkRequest *)sharedClient
{
    static DDNetworkRequest *_sharedClient = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken,^{
        _sharedClient = [[DDNetworkRequest alloc] init];
//        if (!netStatus) {
//            [_sharedClient getNetWorkState:nil isNot:YES];
//        }
    });
    return _sharedClient;
}

//- (void)getNetWorkState:(void (^)(AFNetworkReachabilityStatus))success isNot:(BOOL)isNot{
//    
//    netStatus = [AFNetworkReachabilityManager sharedManager];
//    [netStatus startMonitoring];
//    [netStatus setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
//        if (success) {
//            success(status);
//        }
//        if (status == AFNetworkReachabilityStatusNotReachable) {
//            [SVProgressHUD showErrorWithStatus:@"当前未连接网络"];
//        }
//        
//        if (isNot) {
//            [[NSNotificationCenter defaultCenter] postNotificationName:@"NETWORK_STATUS_CHANGE_NOT" object:@(status)];
//        }
//
//    }];
//    
//}

- (void)get:(NSString *)url parame:(NSDictionary *)parame success:(void (^)(id object))success failure:(void (^)(NSError *err))failure{
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript", @"text/html",@"text/plain", nil];
    
    [manager GET:url parameters:parame progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
             success(responseObject);
         } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull   error) {
             NSLog(@"%@",error);  //这里打印错误信息
         }];
}

- (void)post:(NSString *)url parame:(NSDictionary *)parame success:(void (^)(id object))success failure:(void (^)(NSError *err))failure{
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    manager.responseSerializer.acceptableContentTypes =  [NSSet setWithObjects:@"text/html",@"application/json",@"text/javascript",@"text/json",@"text/plain",@"charset=UTF-8", nil];
    
    [manager.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    
    [manager POST:url parameters:parame progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        success(responseObject);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        failure(error);
        
    }];
}

@end
