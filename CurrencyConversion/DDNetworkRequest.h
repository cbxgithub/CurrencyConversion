//
//  DDNetworkRequest.h
//  CurrencyConversion
//
//  Created by yll on 2017/8/7.
//  Copyright © 2017年 yll. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking.h>

@interface DDNetworkRequest : NSObject

+ (DDNetworkRequest *)sharedClient;

- (void)get:(NSString *)url parame:(NSDictionary *)parame success:(void (^)(id object))success failure:(void (^)(NSError *err))failure;

- (void)post:(NSString *)url parame:(NSDictionary *)parame success:(void (^)(id object))success failure:(void (^)(NSError *err))failure;
@end
