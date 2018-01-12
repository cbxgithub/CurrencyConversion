//
//  AllCountryViewController.h
//  CurrencyConversion
//
//  Created by yll on 2017/8/7.
//  Copyright © 2017年 yll. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^DidCellClick)(NSString *labelText);

@interface AllCountryViewController : UIViewController

@property(nonatomic, strong)DidCellClick didCellClick;

@end
