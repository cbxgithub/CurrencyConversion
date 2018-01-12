//
//  NumberTableViewCell.h
//  CurrencyConversion
//
//  Created by yll on 2017/8/7.
//  Copyright © 2017年 yll. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NumberModel.h"

@interface NumberTableViewCell : UITableViewCell
@property(nonatomic, strong)UILabel *numberLabel1;
@property(nonatomic, strong)UILabel *numberLabel2;

@property(nonatomic, strong)NumberModel *numberModel;

@end
