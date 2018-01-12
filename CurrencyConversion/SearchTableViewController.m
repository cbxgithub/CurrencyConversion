//
//  SearchTableViewController.m
//  CurrencyConversion
//
//  Created by yll on 2017/8/11.
//  Copyright © 2017年 yll. All rights reserved.
//

#import "SearchTableViewController.h"
#import "DDHeader.h"
#import "NumberModel.h"

@interface SearchTableViewController ()<UITableViewDelegate, UITableViewDataSource>
@property(nonatomic, strong)UITableView *tableView;
@property(nonatomic, strong)NSMutableArray *dataArray;
@property(nonatomic, strong)NSMutableArray *keyArr;
@property(nonatomic, strong)UIButton *addButton;

@property(nonatomic, copy)NSString *currencyString;

@property (nonatomic, strong) UIButton *btn1;
@property (nonatomic, strong) UIButton *btn2;
@property (nonatomic, strong) UIButton *btn3;
@property (nonatomic, strong) UIButton *btn4;
@property (nonatomic, strong) UIButton *btn5;

@end

@implementation SearchTableViewController

- (void)getDataWithUrl{
    
    [_dataArray removeAllObjects];
    [_keyArr removeAllObjects];
    
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    
    dic[@"currency"] = self.currencyString;
    dic[@"appkey"] = appkey;
    
    [[DDNetworkRequest sharedClient] post:@"http://api.jisuapi.com/exchange/single" parame:dic success:^(id object) {
        
        if ([object[@"status"] intValue] == 0) {
            
            NSDictionary *dic1 = object[@"result"];
            
            self.currencyString = dic1[@"currency"];
            
            NSDictionary *dic = dic1[@"list"];
            
            for (NSString *keyStr in dic) {
                
                [self.keyArr addObject:keyStr];
                [self.dataArray addObject:dic[keyStr]];
                
            }
        }
        
        [self.tableView reloadData];
        
    } failure:^(NSError *err) {
        
    }];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = RGB(205,92,92);
    
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 20, screen_width, 50)];
    titleLabel.text = @"☆Popular currency";
    titleLabel.textColor = RGB(244,164,96);
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.font = [UIFont boldSystemFontOfSize:scaleWithSize(20)];
    [self.view addSubview:titleLabel];
    
    UIButton *cancelButton = [[UIButton alloc] initWithFrame:CGRectMake(screen_width - 60, 20, 50, 50)];
    [cancelButton setImage:[UIImage imageNamed:@"cancel"] forState:(UIControlStateNormal)];
    [cancelButton setTitleColor:RGB(128,0,0) forState:(UIControlStateNormal)];
    [cancelButton addTarget:self action:@selector(cancelExchangeCountry:) forControlEvents:(UIControlEventTouchUpInside)];
    [self.view addSubview:cancelButton];
 
    self.tableView.hidden = NO;
    
    self.currencyString = @"CNY";
    
    //右下角按钮
    _addButton = [[UIButton alloc] initWithFrame:CGRectMake(screen_width - 60, screen_height - 60, 50, 50)];
    _addButton.backgroundColor = RGB(128,0,0);
    [_addButton setTitle:@"more" forState:(UIControlStateNormal)];
    _addButton.layer.cornerRadius = 25;
    _addButton.layer.masksToBounds = YES;
    [_addButton addTarget:self action:@selector(addFiveCountry:) forControlEvents:(UIControlEventTouchUpInside)];
    [self.view addSubview:_addButton];
    //右下角按钮衍生出来的按钮
    [self mapAddBtn];
    
    [self getDataWithUrl];
}
//取消按钮
- (void)cancelExchangeCountry:(UIButton *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
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
    
//    [self setStatusBarBackgroundColor:RGB(205,92,92)];
    
}

- (NSMutableArray *)dataArray {
    
    if (!_dataArray) {
        _dataArray = [[NSMutableArray alloc] init];
    }
    
    return _dataArray;
}

- (NSMutableArray *)keyArr {
    
    if (!_keyArr) {
        _keyArr = [[NSMutableArray alloc] init];
    }
    
    return _keyArr;
}

- (UITableView *)tableView {
    
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 70, screen_width, screen_height - 20 - 50) style:(UITableViewStylePlain)];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        //分区索引的背景色和字体色
        _tableView.sectionIndexBackgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.5];
        _tableView.sectionIndexColor = [UIColor whiteColor];
        //滚动收键盘
        _tableView.keyboardDismissMode = UIScrollViewKeyboardDismissModeOnDrag;
        _tableView.backgroundColor = [UIColor clearColor];
        [self.view addSubview:_tableView];
    }
    
    return _tableView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 40;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    
    UIView *v = [[UIView alloc] initWithFrame:CGRectMake(0, 0, screen_width, 40)];
    
    v.backgroundColor = RGBA(178,34,34,0.7);
    
    if (_dataArray.count > 0) {
        
        NSDictionary *dic = _dataArray[0];
        
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, screen_width-20, 40)];
        label.font = [UIFont systemFontOfSize:14];
        if (dic[@"updatetime"] != nil) {
            label.text = [NSString stringWithFormat:@"1 %@    updatetime：%@",self.currencyString,dic[@"updatetime"]];
        }
        
        label.textColor = [UIColor blackColor];
        
        [v addSubview:label];
    }

    
    return v;

}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _keyArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *idStr = @"searchCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:idStr];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1  reuseIdentifier: idStr];
    }
    
    if (_dataArray.count > 0) {
        
        NSDictionary *dic = _dataArray[indexPath.row];
        
        cell.textLabel.text = [NSString stringWithFormat:@"%@    %@    %@",dic[@"rate"], _keyArr[indexPath.row],dic[@"name"]];
    }
    
    cell.backgroundColor = [UIColor clearColor];
    
    cell.textLabel.textColor = [UIColor whiteColor];
    
    return cell;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
}

- (void)addFiveCountry:(UIButton *)sender {
    
    sender.selected = !sender.selected;
    
    if (sender.selected) {
        
        [UIView animateWithDuration:0.5 animations:^{
            
            _addButton.transform = CGAffineTransformMakeRotation(M_PI_4);
            
//            _arrowImg.transform = CGAffineTransformMakeRotation(M_PI_2);
            
        } completion:^(BOOL finished) {
            
            CGFloat lx = 40;
            
            [UIView animateWithDuration:0.3 animations:^{
                _btn1.frame = CGRectMake(screen_width - lx - 10, screen_height - 10 - 120 - lx, lx, lx);
                
            }];
            [UIView animateWithDuration:0.4 animations:^{
                _btn2.frame = CGRectMake(screen_width - 10 - 45 - lx, screen_height - 10 - 105 - lx, lx, lx);
            }];
            [UIView animateWithDuration:0.5 animations:^{
                _btn3.frame = CGRectMake(screen_width - 10 - 80 - lx, screen_height - 10 - 80 - lx, lx, lx);
            }];
            [UIView animateWithDuration:0.6 animations:^{
                _btn4.frame = CGRectMake(screen_width - 10 - 105 - lx, screen_height - 10 - 45 - lx, lx, lx);
            }];
            [UIView animateWithDuration:0.7 animations:^{
                _btn5.frame = CGRectMake(screen_width - 10 - 120 - lx, screen_height - lx - 10, lx, lx);
            }];
            
        }];
    }
    else {
        [UIView animateWithDuration:0.5 animations:^{
            
            _addButton.transform = CGAffineTransformMakeRotation(0);
            
        } completion:^(BOOL finished) {
            
            [UIView animateWithDuration:0.4 animations:^{
                _btn5.frame = CGRectMake(screen_width - 60, screen_height - 60, 0, 0);
            }];
            [UIView animateWithDuration:0.5 animations:^{
                _btn4.frame = CGRectMake(screen_width - 60, screen_height - 60, 0, 0);
            }];
            [UIView animateWithDuration:0.6 animations:^{
                _btn3.frame = CGRectMake(screen_width - 60, screen_height - 60, 0, 0);
            }];
            [UIView animateWithDuration:0.7 animations:^{
                _btn2.frame = CGRectMake(screen_width - 60, screen_height - 60, 0, 0);
            }];
            [UIView animateWithDuration:0.8 animations:^{
                _btn1.frame = CGRectMake(screen_width - 60, screen_height - 60, 0, 0);
            }];
            
        }];
    }

}

- (UIButton *)buttonWithTitle:(NSString *)titleStr backgroundColor:(UIColor *)color {
    
    UIButton *b = [[UIButton alloc] initWithFrame:CGRectMake(screen_width - 60, screen_height - 60, 0, 0)];
    
    [b setTitle:titleStr forState:(UIControlStateNormal)];
    [b setTitleColor:[UIColor whiteColor] forState:(UIControlStateNormal)];
    b.titleLabel.font = [UIFont systemFontOfSize:15];
    b.backgroundColor = color;
    b.layer.cornerRadius = 20;
    b.layer.masksToBounds = YES;
    [b addTarget:self action:@selector(btnclick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:b];
    return b;
}

- (void)mapAddBtn{
   
    _btn1 = [self buttonWithTitle:@"USD" backgroundColor:RGBA(60,179,113, 0.5)];
    _btn2 = [self buttonWithTitle:@"CNY" backgroundColor:RGBA(0,139,139, 0.6)];
    _btn3 = [self buttonWithTitle:@"EUR" backgroundColor:RGBA(255,20,147, 0.7)];
    _btn4 = [self buttonWithTitle:@"GBP" backgroundColor:RGBA(100,149,237, 0.8)];
    _btn5 = [self buttonWithTitle:@"CHF" backgroundColor:RGBA(218,165,32, 0.9)];
    
    _btn1.tag = 10000;
    _btn2.tag = 10001;
    _btn3.tag = 10002;
    _btn4.tag = 10003;
    _btn5.tag = 10004;
    
}

//衍生按钮执行
- (void)btnclick:(UIButton *)sender {
    
    switch (sender.tag) {
        case 10000:
            self.currencyString = @"USD";
            break;
        case 10001:
            self.currencyString = @"CNY";
            break;
        case 10002:
            self.currencyString = @"EUR";
            break;
        case 10003:
            self.currencyString = @"GBP";
            break;
        case 10004:
            self.currencyString = @"CHF";
            break;
        default:
            break;
    }
    [self getDataWithUrl];
}

@end
