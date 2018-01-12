//
//  DDYouChooseWho.m
//  DDActionSheet
//
//  Created by GumGum on 2016/10/26.
//  Copyright © 2016年 鱼蛋蛋. All rights reserved.
//

#import "DDYouChooseWho.h"
#import "PureLayout.h"
#import "AdomaDefine.h"

NSString *const imgNameKey = @"img";
NSString *const imgTitleKey = @"title";

#define buttonWidth Main_Screen_Width - 20
#define buttonHeight 50
#define buttonMargin 1
#define margin 15


@interface DMSImgBtnView : UIControl

@property (nonatomic,strong) UIImageView *imgView;

@property (nonatomic,strong) UILabel *titleLabel;

@property (nonatomic,strong) UIImageView *selectImg;

@end

@implementation DMSImgBtnView

- (instancetype)init {
    if (self = [super init]) {
        [self prepare];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self prepare];
    }
    return self;
}

- (void)prepare {
    _imgView = [UIImageView new];
    _imgView.frame = CGRectMake(10, (buttonHeight-30)/2.0, 30, 30);
    [self addSubview:_imgView];

    _titleLabel = [UILabel new];
    _titleLabel.frame = CGRectMake(20+_imgView.width, 0, self.width-30-_imgView.width-18, buttonHeight);
    [self addSubview:_titleLabel];
    
    _titleLabel.font = [UIFont systemFontOfSize:14];
    _titleLabel.textColor = [UIColor whiteColor];
    _titleLabel.numberOfLines = 0;
    
    _selectImg = [UIImageView new];
    _selectImg.frame = CGRectMake(self.width-28, (buttonHeight-18)/2.0, 18, 18);
    [self addSubview:_selectImg];
    
    _selectImg.image = [UIImage imageNamed:@"rb_seleceted"];
    
}

@end

@interface DDYouChooseWho ()<UIGestureRecognizerDelegate>

//@property (nonatomic,strong) UIWindow *paymentWindow;//

@property (nonatomic,weak) UIView *paymentView;//

@property (nonatomic,weak) UIView *grayBackgroundView;//

@property (nonatomic,copy) NSArray *arr;

@property (nonatomic,weak) UIButton *cancelButton;

@property (nonatomic, assign) BOOL isNumber;

@end


@implementation DDYouChooseWho

+ (instancetype)paymentMethod:(NSArray<NSDictionary<NSString *,NSString *> *> *)arr {
    id dandan = [DDYouChooseWho alloc];
    return [dandan initWith:arr];
}

- (instancetype)initWith:(NSArray<NSDictionary<NSString *,NSString *> *> *)arr {
    if (self = [super init]) {
        _arr = arr;
        
    }
    return self;
}

- (void)showView {
//    if (!_paymentWindow) {
    
        UIView *v = [[UIView alloc] initWithFrame:CGRectMake(0, 0, Main_Screen_Width, Main_Screen_Height)];
        UIWindow *window = [[UIApplication sharedApplication].windows lastObject];
        [window addSubview:v];
        
        _grayBackgroundView = v;
        _grayBackgroundView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.3];
    
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hide)];
        tap.delegate = self;
        [_grayBackgroundView addGestureRecognizer:tap];
    
        UIView *paymentView = [[UIView alloc] initWithFrame:CGRectMake(10, Main_Screen_Height, buttonWidth, 50)];
        paymentView.backgroundColor = [UIColor lightGrayColor];
        ViewRadius(paymentView, 10);//设置圆角
        [_grayBackgroundView addSubview:paymentView];
        
        [paymentView autoPinEdge:(ALEdgeLeft) toEdge:(ALEdgeLeft) ofView:_grayBackgroundView withOffset:10];
        [paymentView autoPinEdge:(ALEdgeRight) toEdge:(ALEdgeRight) ofView:_grayBackgroundView withOffset:-10];
        [paymentView autoPinEdge:(ALEdgeTop) toEdge:(ALEdgeTop) ofView:_grayBackgroundView withOffset:Main_Screen_Height];
        [paymentView autoSetDimension:ALDimensionHeight toSize:(buttonHeight*_arr.count + buttonMargin*(_arr.count - 1))];//高
        _paymentView = paymentView;
        
        UIButton *cancelButton = [UIButton buttonWithType:(UIButtonTypeSystem)];
        [cancelButton setTitle:@"取消" forState:(UIControlStateNormal)];
        cancelButton.backgroundColor = [UIColor whiteColor];
        [_grayBackgroundView addSubview:cancelButton];
        
        [cancelButton autoPinEdge:(ALEdgeLeft) toEdge:(ALEdgeLeft) ofView:_paymentView withOffset:0];
        [cancelButton autoPinEdge:(ALEdgeRight) toEdge:(ALEdgeRight) ofView:_paymentView withOffset:0];
        [cancelButton autoPinEdge:(ALEdgeTop) toEdge:(ALEdgeBottom) ofView:_paymentView withOffset:margin];
        [cancelButton autoSetDimension:(ALDimensionHeight) toSize:buttonHeight];
        
        _cancelButton = cancelButton;
        
        
        //取消，视图消失
        [_cancelButton addTarget: self action:@selector(hide) forControlEvents:(UIControlEventTouchUpInside)];
        ViewRadius(_cancelButton, 10);//设置圆角
        
//    }
}
//
- (void)prepareSelectIndex:(NSInteger)selectIndex {
    
    for (NSInteger i = 0; i < _arr.count ; i ++) {
        
        DMSImgBtnView *button = [[DMSImgBtnView alloc] initWithFrame:CGRectMake(0, i*(buttonHeight+buttonMargin), buttonWidth, buttonHeight)];
        
        [_paymentView addSubview:button];
        
        button.backgroundColor = RGBCOLOR(178,100,100);
        
        NSString *imageName = [_arr[i] valueForKey:imgNameKey];
        NSString *title = [_arr[i] valueForKey:imgTitleKey];
        
        button.imgView.image = [UIImage imageNamed:imageName];
        button.titleLabel.text = title;
        button.selectImg.hidden = !(i == selectIndex);
        
        button.tag = 100 + i;
        
        [button addTarget:self action:@selector(click:) forControlEvents:(UIControlEventTouchUpInside)];
    }
    //任何时候，当视图的布局发生改变时，UIKit 会激活每个视图的自动尺寸调整行为，然后调用各自的 layoutSubviews 方法，使您有机会进一步调整子视图的几何尺寸。 您的应用程序调用视图的 setNeedsLayout 或 layoutIfNeeded 方法来强制进行布局。
    [_grayBackgroundView layoutIfNeeded];//
}
- (void)dealloc {
    NSLog(@"dfghjkydcvbjuytfcvbnjuytgfgvb");
}
//视图选择完之后消失
- (void)hide {

//    [_paymentView autoPinEdgeToSuperviewEdge:(ALEdgeTop) withInset:Main_Screen_Height];
    
    [UIView animateWithDuration:0.3 animations:^{
        if (_showCancel) {
            _paymentView.frame = CGRectMake(10, Main_Screen_Height, buttonWidth, _paymentView.height);
            _cancelButton.frame = CGRectMake(10, _paymentView.height+_paymentView.y+margin, buttonWidth, buttonHeight);
        } else {
            _paymentView.frame = CGRectMake(10, Main_Screen_Height, buttonWidth, _paymentView.height);
        }
    } completion:^(BOOL finished) {
        _grayBackgroundView.alpha = 0;
        _grayBackgroundView.hidden = YES;
        _grayBackgroundView = nil;
    }];
}
- (void)show {
//    self.paymentWindow.hidden = NO;
    [self showView];
    [self prepareSelectIndex:_seletedIndex];
    
    //是否显示 取消 按钮的视图适配
    if (_showCancel) {//1
        
        [_paymentView autoPinEdge:(ALEdgeTop) toEdge:(ALEdgeTop) ofView:_grayBackgroundView withOffset: (Main_Screen_Height - _paymentView.height - _cancelButton.height - margin * 2)];

    } else {//0
        
       [_paymentView autoPinEdge:(ALEdgeTop) toEdge:(ALEdgeTop) ofView:_grayBackgroundView withOffset:(Main_Screen_Height - (_paymentView.height + margin))];
        
    }
    
    [UIView animateWithDuration:0.3 animations:^{
        [_grayBackgroundView layoutIfNeeded];
    }];
}

- (void)click:(DMSImgBtnView *)sender {
    NSInteger index = sender.tag - 100;
    
    for (DMSImgBtnView *v in _paymentView.subviews) {
        v.selectImg.hidden = YES;
    }
    sender.selectImg.hidden = NO;
    
    if (!_showCancel) {
        [self hide];//视图选择完之后消失    
    }
    
    !self.chooseComplete?:self.chooseComplete(index);
}

#pragma mark -- 手势识别器代理
- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer {
    
    if ([gestureRecognizer.view isEqual:_grayBackgroundView]) {
        
        CGPoint locationPoint = [gestureRecognizer locationInView:self.paymentView];
        
        return ![self.paymentView pointInside:locationPoint withEvent:nil];
    }
    
    return YES;
}
@end
