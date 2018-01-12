//
//  NumberTableViewCell.m
//  CurrencyConversion
//
//  Created by yll on 2017/8/7.
//  Copyright © 2017年 yll. All rights reserved.
//

#import "NumberTableViewCell.h"
#import "DDHeader.h"

@implementation NumberTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    if ([super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.backgroundColor = [UIColor clearColor];
        
        _numberLabel1 = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, screen_width/2.0 - 30, numberCellHeight)];
        _numberLabel1.textColor = RGB(205,92,92);
        _numberLabel1.textAlignment = NSTextAlignmentRight;
        _numberLabel1.font = [UIFont systemFontOfSize:scaleWithSize(20)];
        [self addSubview:_numberLabel1];
        
        UIView *lineView1 = [[UIView alloc] initWithFrame:CGRectMake(10, numberCellHeight, screen_width/2.0-10, 0.5)];
        lineView1.backgroundColor = RGB(205,92,92);
        [self addSubview:lineView1];
        
        _numberLabel2 = [[UILabel alloc] initWithFrame:CGRectMake(screen_width/2.0 + 20, 0, screen_width/2.0 - 20, numberCellHeight)];
        _numberLabel2.textColor = RGB(250,246,235);
        _numberLabel2.font = [UIFont systemFontOfSize:scaleWithSize(20)];
        [self addSubview:_numberLabel2];
        
        UIView *lineView2 = [[UIView alloc] initWithFrame:CGRectMake(screen_width/2.0, numberCellHeight, screen_width/2.0-10, 0.5)];
        lineView2.backgroundColor = RGB(250,246,235);
        [self addSubview:lineView2];
        
    }
    
    return self;
}

- (void)setNumberModel:(NumberModel *)numberModel {
    
    _numberModel = numberModel;
    _numberLabel2.text = [NSString stringWithFormat:@"%.2f",([numberModel.rate floatValue])];
    
}

@end
