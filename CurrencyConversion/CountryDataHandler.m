//
//  CountryDataHandler.m
//  CurrencyConversion
//
//  Created by yll on 2017/8/8.
//  Copyright © 2017年 yll. All rights reserved.
//

#import "CountryDataHandler.h"


@implementation CountryDataHandler

+ (CountryDataHandler *)shareCountryDataHandler {
    
    static CountryDataHandler *countryDataHandler = nil;
    
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken,^{
        countryDataHandler = [[CountryDataHandler alloc] init];
       
    });
    return countryDataHandler;
}

//重写init方法
- (instancetype)init {
    
    self = [super init];
    if (self) {
        //内部的实例变量开辟空间
        self.countryDic = [NSMutableDictionary dictionary];
        self.keysArray = [NSMutableArray array];
    }
    
    return self;
    
}

@end
