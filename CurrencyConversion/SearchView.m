//
//  SearchView.m
//  CurrencyConversion
//
//  Created by yll on 2017/8/8.
//  Copyright © 2017年 yll. All rights reserved.
//

#import "SearchView.h"
#import "DDHeader.h"
@implementation SearchView
- (instancetype)initWithFrame:(CGRect)frame {
    
    if ([super initWithFrame:frame]) {
        
        self.layer.cornerRadius = 15;
        self.layer.masksToBounds = YES;
        self.backgroundColor = RGB(128,0,0);
        
        UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 5, 20, 20)];
        imgView.image = [UIImage imageNamed:@"search"];
        [self addSubview:imgView];
        
        _textField = [[UITextField alloc] initWithFrame:CGRectMake(40, 8, CGRectGetWidth(frame) - 60, 14)];
        _textField.textColor = [UIColor whiteColor];
        _textField.font = [UIFont systemFontOfSize:14];
//        _textField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"请输入货币名称" attributes:@{NSForegroundColorAttributeName: [UIColor whiteColor], NSFontAttributeName:[UIFont systemFontOfSize:14]}];
        _textField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Please enter the currency name" attributes:@{NSForegroundColorAttributeName: [UIColor whiteColor]}];
        [self addSubview:_textField];
        
    }
    
    return self;
}

@end
