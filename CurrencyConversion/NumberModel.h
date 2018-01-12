//
//  NumberModel.h
//  CurrencyConversion
//
//  Created by yll on 2017/8/7.
//  Copyright © 2017年 yll. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NumberModel : NSObject
@property(nonatomic, copy)NSString *from;
@property(nonatomic, copy)NSString *to;
@property(nonatomic, copy)NSString *fromname;
@property(nonatomic, copy)NSString *toname;
@property(nonatomic, copy)NSString *updatetime;
@property(nonatomic, copy)NSString *rate;
@property(nonatomic, copy)NSString *camount;
@property(nonatomic, copy)NSString *name;

@end
