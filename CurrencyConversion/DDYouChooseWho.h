//
//  DDYouChooseWho.h
//  DDActionSheet
//
//  Created by GumGum on 2016/10/26.
//  Copyright © 2016年 鱼蛋蛋. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

UIKIT_EXTERN NSString *const imgNameKey;
UIKIT_EXTERN NSString *const imgTitleKey;

@interface DDYouChooseWho : NSObject
//字典里有且只有以上两个key
+ (instancetype)paymentMethod:(NSArray<NSDictionary<NSString *,NSString *>*> *)arr;

@property (nonatomic,copy) void(^chooseComplete)(NSInteger buttonIndex);

//是否显示取消按钮 默认no
@property (nonatomic,assign) BOOL showCancel;

//已经选择的状态下标
@property (nonatomic,assign) NSInteger seletedIndex;

- (void)show;

//- (void)initWith:(NSArray<NSDictionary<NSString *,NSString *> *> *)arr;

@end

