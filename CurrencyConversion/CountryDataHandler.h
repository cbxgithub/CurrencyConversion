//
//  CountryDataHandler.h
//  CurrencyConversion
//
//  Created by yll on 2017/8/8.
//  Copyright © 2017年 yll. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CountryDataHandler : NSObject

@property (nonatomic, retain) NSMutableDictionary *countryDic;

//2.存放有序键的数据
@property (nonatomic, retain) NSMutableArray *keysArray;

//3.获取单例对象的类方法
+ (CountryDataHandler *)shareCountryDataHandler;

@end
