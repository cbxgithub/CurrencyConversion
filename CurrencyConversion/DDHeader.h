//
//  DDHeader.h
//  CurrencyConversion
//
//  Created by yll on 2017/8/7.
//  Copyright © 2017年 yll. All rights reserved.
//

#ifndef DDHeader_h
#define DDHeader_h

#import "DDNetworkRequest.h" //请求
#import <SVProgressHUD.h>

// 设备物理尺寸
#define screen_width [UIScreen mainScreen].bounds.size.width

#define screen_height [UIScreen mainScreen].bounds.size.height

#define K_NAVBAR_COLOR RGB(32,178,170)

#define RGB(r, g, b)                        [UIColor colorWithRed:(r)/255.f green:(g)/255.f blue:(b)/255.f alpha:1.f]

#define RGBA(r, g, b, a)                    [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]

#define numberCellHeight (screen_height - 70)/10

#define SCREEN_SIZE [UIScreen mainScreen].bounds.size

#define scaleWithSize(s) ((s) * (SCREEN_SIZE.width / 375))

#define appkey @"60aac116996d8dbe"

#endif /* DDHeader_h */
