//
//  版权所有,翻版必究
//  Created by adoma
//  Copyright © 2016年 adoma. All rights reserved.
//

// MainScreen Height&Width
#define Main_Screen_Height      [[UIScreen mainScreen] bounds].size.height
#define Main_Screen_Width       [[UIScreen mainScreen] bounds].size.width

// 系统控件默认高度
#define StatusBarHeight        (20.f)
#define TopBarHeight           (44.f)
#define BottomBarHeight        (49.f)
#define CellDefaultHeight      (44.f)
#define EnglishKeyboardHeight  (216.f)
#define ChineseKeyboardHeight  (252.f)

/// 沙盒路径
#define PATH_OF_APP_HOME    NSHomeDirectory()
#define PATH_OF_TEMP        NSTemporaryDirectory()
#define PATH_OF_DOCUMENT    [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0]

// 加载图片
#define PNGIMAGE(NAME)   [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:(NAME) ofType:@"png"]]
#define JPGIMAGE(NAME)   [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:(NAME) ofType:@"jpg"]]
#define IMAGE(NAME, EXT) [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:(NAME) ofType:(EXT)]]

// 颜色(RGB)
#define RGBCOLOR(r, g, b)       [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:1]
#define RGBACOLOR(r, g, b, a)   [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:(a)]
#define RGB16COLOR(rgbValue)    [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue &0xFF00) >>8))/255.0 blue:((float)(rgbValue &0xFF))/255.0 alpha:1.0]

//适配尺寸
#define ADHeightValue(value) ((value)/667.0f*[UIScreen mainScreen].bounds.size.height)
#define ADWidthValue(value)  ((value)/375.0f*[UIScreen mainScreen].bounds.size.width)

/// 当前语言
#define CURRENTLANGUAGE ([[NSLocale preferredLanguages] objectAtIndex:0])

// 本地化字符串
/** NSLocalizedString宏做的其实就是在当前bundle中查找资源文件名“Localizable.strings”(参数:键＋注释) */
#define LocalString(x, ...) NSLocalizedString(x, nil)

#define AppLocalString(x, ...) NSLocalizedStringFromTable(x, @"someName", nil)

#define IOS9 ([[[UIDevice currentDevice] systemVersion] floatValue] >=9.0 ? YES : NO)

#define IS_IPAD (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)

#define IS_IPHONE (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)

#define IS_IPHONE_5 (IS_IPHONE && Main_Screen_Height == 568.0)

/// View 圆角和加边框
#define ViewBorderRadius(View, Radius, Width, Color)\
\
[View.layer setCornerRadius:(Radius)];\
[View.layer setMasksToBounds:YES];\
[View.layer setBorderWidth:(Width)];\
[View.layer setBorderColor:[Color CGColor]]

/// View 圆角
#define ViewRadius(View, Radius)\
\
[View.layer setCornerRadius:(Radius)];\
[View.layer setMasksToBounds:YES]

/// 设置上两角为圆角
//#define ViewTopRadius(view,radius)

/// 设置下两角为圆角
//#define ViewBottomRadius(view,radius) 

#import <UIKit/UIKit.h>
@interface UIView (ext)

@property (nonatomic,assign)  CGFloat x;
@property (nonatomic,assign)  CGFloat y;

@property (nonatomic,assign)  CGFloat width;
@property (nonatomic,assign)  CGFloat height;

@property (nonatomic,assign)  CGPoint origin;
@property (nonatomic,assign)  CGSize  size;

@property (nonatomic,assign)  CGFloat centerX;
@property (nonatomic,assign)  CGFloat centerY;

@property (nonatomic,assign,readonly)  CGFloat MinX;
@property (nonatomic,assign,readonly)  CGFloat MinY;

@property (nonatomic,assign,readonly)  CGFloat MidX;
@property (nonatomic,assign,readonly)  CGFloat MidY;

@property (nonatomic,assign,readonly)  CGFloat MaxX;
@property (nonatomic,assign,readonly)  CGFloat MaxY;

@end

@interface UIColor (ext)

+ (UIColor *)randomColor;

@end
