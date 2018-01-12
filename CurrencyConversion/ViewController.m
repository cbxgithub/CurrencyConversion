//
//  ViewController.m
//  CurrencyConversion
//
//  Created by yll on 2017/8/7.
//  Copyright © 2017年 yll. All rights reserved.
//

#import "ViewController.h"
#import "DDHeader.h"
#import "NumberTableViewCell.h"
#import "DDYouChooseWho.h"
#import "AllCountryViewController.h"
#import "SearchTableViewController.h"


@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>
@property(nonatomic, strong)UITableView *tableView;
@property(nonatomic, strong)NSMutableArray *dataArray;

@property(nonatomic, strong)DDYouChooseWho *ddYouChooseWho;

@property(nonatomic, copy)NSString *leftCountryString;
@property(nonatomic, copy)NSString *rightCountryString;
@property(nonatomic, copy)NSString *updateTimeString;
@property(nonatomic, copy)NSString *rateString;

@property(nonatomic, strong)UILabel *leftLabel;
@property(nonatomic, strong)UILabel *rightLabel;

@property(nonatomic, strong)UISwipeGestureRecognizer *left;//手势

@property(nonatomic, strong)UISwipeGestureRecognizer *right;//手势

@property(nonatomic, assign)NSInteger multiple;//倍数因子

@property(nonatomic, strong)UIButton *exchangeButton;//切换按钮

//新手
@property (nonatomic, strong) UIView *Guidview;
@property (nonatomic, strong) UIImageView *imgView1;
@property (nonatomic, strong) UIImageView *imgView2;
@property (nonatomic, strong) NSString *step;
@property(nonatomic, strong)UIButton *gaoliangButton;

@property (nonatomic, strong) UILabel *arrowLab;

@end

@implementation ViewController

- (void)getDataWithUrl{
    
    [_dataArray removeAllObjects];
    
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    
    if (_leftCountryString != nil) {
        dic[@"from"] = _leftCountryString;
    } else {
        dic[@"from"] = @"CNY";
    }
    
    if (_rightCountryString != nil) {
        dic[@"to"] = _rightCountryString;
    } else {
        dic[@"to"] = @"USD";
    }
    
    dic[@"amount"] = @"10";
    dic[@"appkey"] = appkey;
    
    [[DDNetworkRequest sharedClient] post:@"http://api.jisuapi.com/exchange/convert" parame:dic success:^(id object) {
        
        if ([object[@"status"] intValue] == 0) {
            NumberModel *model = [[NumberModel alloc] init];
            [model setValuesForKeysWithDictionary:object[@"result"]];
            
            self.updateTimeString = model.updatetime;
            self.rateString = model.rate;
            
            [self.dataArray addObject:model];
            
        }
        NSLog(@"%@",object);
        
        [_tableView reloadData];
        
    } failure:^(NSError *err) {
        
    }];
}

//- (UIStatusBarStyle)preferredStatusBarStyle{
//    return UIStatusBarStyleLightContent;
//}
////设置状态栏颜色
//- (void)setStatusBarBackgroundColor:(UIColor *)color {
//    
//    UIView *statusBar = [[[UIApplication sharedApplication] valueForKey:@"statusBarWindow"] valueForKey:@"statusBar"];
//    if ([statusBar respondsToSelector:@selector(setBackgroundColor:)]) {
//        statusBar.backgroundColor = color;
//    }
//}

- (void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:animated];
    
//    [self setStatusBarBackgroundColor:RGB(128,0,0)];
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.view.backgroundColor = [UIColor whiteColor];

    //倍数，用来x10 /10
    _multiple = 1;
    
    UIImageView *bgImgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, screen_width, screen_height)];
    bgImgView.image = [UIImage imageNamed:@"bgImgView"];
    [self.view addSubview:bgImgView];
    
    _leftLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 20, screen_width/2.0, 50)];
    _leftLabel.text = @"CNY";
    _leftLabel.textColor = RGB(244,164,96);
    _leftLabel.font = [UIFont boldSystemFontOfSize:scaleWithSize(25)];
    _leftLabel.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:_leftLabel];
    
    _rightLabel = [[UILabel alloc] initWithFrame:CGRectMake(screen_width/2.0, 20, screen_width/2.0, 50)];
    _rightLabel.text = @"USD";
    _rightLabel.textColor = RGB(244,164,96);
    _rightLabel.font = [UIFont boldSystemFontOfSize:scaleWithSize(25)];
    _rightLabel.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:_rightLabel];
    
    //初始化左右string
    _leftCountryString = _leftLabel.text;
    _rightCountryString = _rightLabel.text;
    
    UIButton *actionButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 20, screen_width, 50)];
    [actionButton addTarget:self action:@selector(actionButton:) forControlEvents:(UIControlEventTouchUpInside)];
    [self.view addSubview:actionButton];
    
    [self getDataWithUrl];
    
    self.tableView.hidden = NO;
    
    _left = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(handleSwipes:)];
    
    _left.direction = UISwipeGestureRecognizerDirectionLeft;
    
    [self.tableView addGestureRecognizer:_left];
    
    _right = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(handleSwipes:)];
    
    _right.direction = UISwipeGestureRecognizerDirectionRight;
    
    [self.tableView addGestureRecognizer:_right];
    
    _exchangeButton = [[UIButton alloc] initWithFrame:CGRectMake(screen_width/2.0-20, 25, 40, 40)];
    _exchangeButton.layer.cornerRadius = 20;
    _exchangeButton.layer.masksToBounds = YES;
    [_exchangeButton addTarget:self action:@selector(qiehuan:) forControlEvents:(UIControlEventTouchUpInside)];
    [_exchangeButton setImage:[UIImage imageNamed:@"qiehuan"] forState:(UIControlStateNormal)];
    _exchangeButton.backgroundColor = RGB(178,34,34);
    [self.view addSubview:_exchangeButton];
    
//    UIPanGestureRecognizer *pan=[[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(handlePan:)];
//    [_exchangeButton addGestureRecognizer:pan];//给按钮添加拖拉手势
    
    //此为找到plist文件中得版本号所对应的键 一般不知道这个健
    
    NSString *key = (NSString *)kCFBundleVersionKey;
    
    // 1.从plist中取出版本号
    
    NSString *version = [NSBundle mainBundle].infoDictionary[key];
    
    // 2.从沙盒中取出上次存储的版本号
    
    NSString *saveVersion = [[NSUserDefaults standardUserDefaults] objectForKey:key];
    
    if([version isEqualToString:saveVersion]) {
        
        //不是第一次使用这个
        NSLog(@"---不是第一次--");
        
    }else{
        //版本号不一样：第一次使用新版本
        
        //将新版本号写入沙盒
        
        [[NSUserDefaults standardUserDefaults] setObject:version forKey:key];
        
        [[NSUserDefaults standardUserDefaults] synchronize];
        
        //显示版本新特性界面
        NSLog(@"---第一次--");
        
        [self addGuidView];
    }

}

- (void)actionButton:(UIButton *)sender {
    //不知道为啥，这个数组有时候是空的，有时候是有值的
//    NumberModel *model = _dataArray[0];
    
    _Guidview.hidden = YES;
    
    if ([_rightCountryString isEqualToString:@""]||_rightCountryString == nil||[_rightCountryString isKindOfClass: NULL]) {
        _rightCountryString = @"";
    }
    if ([_updateTimeString isEqualToString:@""]||_updateTimeString == nil||[_updateTimeString isKindOfClass: NULL]) {
        _updateTimeString = @"";
    }
    if ([_leftCountryString isEqualToString:@""]||_leftCountryString == nil||[_leftCountryString isKindOfClass: NULL]) {
        _leftCountryString = @"";
    }
    if ([_rateString isEqualToString:@""]||_rateString == nil||[_rateString isKindOfClass: NULL]) {
        _rateString = @"";
    }
    NSString *str = [NSString stringWithFormat:@" 1%@ -> %@%@\n updatetime：%@",_leftCountryString, _rateString, _rightCountryString,_updateTimeString];
    
    
    _ddYouChooseWho = [DDYouChooseWho paymentMethod:@[@{imgTitleKey:str,imgNameKey:@""},
                                                      @{imgTitleKey:@"Search Table",imgNameKey:@"searchTable"},
                                                      @{imgTitleKey:@"Choose Other",imgNameKey:@"qita"}
                                                      ]];
    //    _ddYouChooseWho.showCancel = YES;
    __weak typeof(self) weakSelf = self;
    
    [_ddYouChooseWho setChooseComplete:^(NSInteger chooseIndex) {
        NSLog(@"---3----now selectIndex = %ld",chooseIndex);
        
        __strong typeof(weakSelf) strongSelf = weakSelf;
        
        if (chooseIndex == 1) {
            
            SearchTableViewController *vc = [[SearchTableViewController alloc] init];
            
            [strongSelf presentViewController:vc animated:YES completion:nil];
            
        }
        
        if (chooseIndex == 2) {
            
            AllCountryViewController *vc = [[AllCountryViewController alloc] init];
            
            vc.didCellClick = ^(NSString *labelText) {
                
                NSArray *arr = [labelText componentsSeparatedByString:@" "];
                strongSelf.leftCountryString = arr[0];
                strongSelf.leftLabel.text = strongSelf.leftCountryString;
                [strongSelf getDataWithUrl];
            };
            
            [strongSelf presentViewController:vc animated:YES completion:nil];
            
        }
    }];
    
    [_ddYouChooseWho show];

}

- (NSMutableArray *)dataArray {
    
    if (!_dataArray) {
        _dataArray = [[NSMutableArray alloc] init];
    }
    
    return _dataArray;
}
- (UITableView *)tableView {
    
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 70, screen_width, screen_height - 70) style:(UITableViewStylePlain)];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.backgroundColor = [UIColor clearColor];
        [self.view addSubview:_tableView];
    }
    
    return _tableView;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NumberTableViewCell *cell = [[NumberTableViewCell alloc] initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:@"numberCell"];
    if (_dataArray.count > 0) {
        
        NumberModel *model = _dataArray[0];
        
        cell.numberLabel1.text = [NSString stringWithFormat:@"%.2f",((float)indexPath.row + 1) * _multiple];
        cell.numberLabel2.text = [NSString stringWithFormat:@"%.2f",([model.rate floatValue] * (indexPath.row+1)) *_multiple];
        
    }

    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return numberCellHeight;
}


//左滑右滑手势
- (void)handleSwipes:(UISwipeGestureRecognizer *)sender

{
    
    if (sender.direction == UISwipeGestureRecognizerDirectionLeft) {
        
        _multiple *= 10;
        
        if (_multiple <= 10000) {
            [_tableView reloadData];
        } else {
            _multiple = 10000;
        }
    }
    
    if (sender.direction == UISwipeGestureRecognizerDirectionRight) {
        
        _multiple /= 10;
        if (_multiple >= 1) {
            [_tableView reloadData];
        } else {
            _multiple = 1;
        }
    }
    
}
//切换
- (void)qiehuan:(UIButton *)sender {
    
    self.leftCountryString = self.leftLabel.text;
    self.rightCountryString = self.rightLabel.text;
    
    self.leftLabel.text = self.rightCountryString;
    self.rightLabel.text = self.leftCountryString;
    
    self.leftCountryString = self.leftLabel.text;
    self.rightCountryString = self.rightLabel.text;
    
    [self getDataWithUrl];
}
////切换按钮上下拖动
//- (void)handlePan:(UIPanGestureRecognizer *)sender {
//    
//    //返回在横坐标上、纵坐标上拖动了多少像素
//    CGPoint point = [sender translationInView:self.view];
//    
//    CGFloat f = sender.view.center.y+point.y;
//    
//    if (f < sender.view.frame.size.height/2.0 + 70) {
//        f = sender.view.frame.size.height/2.0 + 70;
//    }
//    
//    if (f > screen_height - sender.view.frame.size.height/2.0 - 20) {
//        f = screen_height - sender.view.frame.size.height/2.0 - 20;
//    }
//    sender.view.center = CGPointMake(sender.view.center.x, f);
//    //拖动完之后，每次都要用setTranslation:方法制0这样才不至于不受控制般滑动出视图
//    [sender setTranslation:CGPointMake(0, 0) inView:self.view];
//}

//新手指导
- (void)addGuidView {
    
    _step = @"1";
    
    _Guidview = [[UIView alloc] initWithFrame:CGRectMake(0, 0, screen_width, screen_height)];
    _Guidview.backgroundColor = [UIColor lightGrayColor];
    _Guidview.userInteractionEnabled = YES;
    _Guidview.alpha = 0.7;
    [self.view addSubview:_Guidview];
    
    CGFloat lx = screen_width/2;
    CGFloat ly = screen_height/2;
    
    _arrowLab = [[UILabel alloc] initWithFrame:CGRectMake(0, 125, lx*2, 30)];
    _arrowLab.text = @"Right slide then multiply ten";
    _arrowLab.font = [UIFont systemFontOfSize:17];
    _arrowLab.textColor = [UIColor blackColor];
    _arrowLab.textAlignment = NSTextAlignmentCenter;
    _arrowLab.hidden = NO;
    [_Guidview addSubview:_arrowLab];
    
    _imgView1 = [[UIImageView alloc] initWithFrame:CGRectMake(lx-50, ly-lx/2, 100, 100)];
    [_Guidview addSubview:_imgView1];
    //添加轻扫手势
    _imgView1.userInteractionEnabled = YES;
    UISwipeGestureRecognizer *swipeGestureLeft = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeGesture:)];
    //设置轻扫的方向
    swipeGestureLeft.direction = UISwipeGestureRecognizerDirectionLeft; //默认向右
    [_Guidview addGestureRecognizer:swipeGestureLeft];
    
    UISwipeGestureRecognizer *swipeGestureRight = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeGesture1:)];
    //设置轻扫的方向
    swipeGestureRight.direction = UISwipeGestureRecognizerDirectionRight; //默认向右
    [_Guidview addGestureRecognizer:swipeGestureRight];
    _imgView1.image = [UIImage imageNamed:@"left"];
    
    //创建动画
    CAKeyframeAnimation * keyAnimaion = [CAKeyframeAnimation animation];
    keyAnimaion.keyPath = @"transform.rotation";
    keyAnimaion.values = @[@(-10 / 180.0 * M_PI),@(10 /180.0 * M_PI),@(-10/ 180.0 * M_PI)];//度数转弧度
    
    keyAnimaion.removedOnCompletion = NO;
    keyAnimaion.fillMode = kCAFillModeForwards;
    keyAnimaion.duration = 0.6;
    keyAnimaion.repeatCount = MAXFLOAT;
    [_imgView1.layer addAnimation:keyAnimaion forKey:nil];
    
    _imgView2 = [[UIImageView alloc] initWithFrame:CGRectMake(screen_width/2.0-75, 64, 50, 60)];
    [_Guidview addSubview:_imgView2];
    _imgView2.image = [UIImage imageNamed:@"uparrow"];
    _imgView2.hidden = YES;
   
    _gaoliangButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _gaoliangButton.frame = CGRectMake(0, 20, screen_width/2.0, 50);
    _gaoliangButton.layer.cornerRadius = 25;
    _gaoliangButton.layer.masksToBounds = YES;
    _gaoliangButton.backgroundColor = [UIColor whiteColor];
    [_gaoliangButton addTarget:self action:@selector(actionButton:) forControlEvents:UIControlEventTouchUpInside];
    [_Guidview addSubview:_gaoliangButton];
    _gaoliangButton.hidden = YES;
    
}

- (void)swipeGesture:(id)sender {
   
    if ([_step isEqualToString:@"1"]) {
        _step = @"2";
        _multiple = 10;
        [_tableView reloadData];
        _imgView1.image = [UIImage imageNamed:@"right"];
        _arrowLab.text = @"Left slide then divided by ten";

        NSLog(@"2");
    }
}

- (void)swipeGesture1:(id)sender {
    if ([_step isEqualToString:@"2"]) {
        _step = @"3";
        _multiple = 1;
        [_tableView reloadData];
        _imgView2.hidden = NO;
        _gaoliangButton.hidden = NO;
        _imgView1.hidden = YES;
        _arrowLab.text = @"点击可以选择其他";
        NSLog(@"3");
    }
}
//- (void)tapHead:(UIButton *)sender{
//    _Guidview.hidden = YES;
//    
//}

@end
