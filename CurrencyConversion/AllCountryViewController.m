//
//  AllCountryViewController.m
//  CurrencyConversion
//
//  Created by yll on 2017/8/7.
//  Copyright © 2017年 yll. All rights reserved.
//

#import "AllCountryViewController.h"
#import "DDHeader.h"
#import "CountryDataHandler.h"
#import "SearchView.h"

@interface AllCountryViewController ()<UITableViewDelegate, UITableViewDataSource>
@property(nonatomic, strong)UITableView *tableView;
@property(nonatomic, strong)NSMutableArray *dataArray;
@property(nonatomic, strong)NSMutableArray *searchArray;

@property(nonatomic, strong)SearchView *searchView;

@property(nonatomic, strong)NSMutableArray *aArr;
@property(nonatomic, strong)NSMutableArray *bArr;
@property(nonatomic, strong)NSMutableArray *cArr;
@property(nonatomic, strong)NSMutableArray *dArr;
@property(nonatomic, strong)NSMutableArray *eArr;
@property(nonatomic, strong)NSMutableArray *fArr;
@property(nonatomic, strong)NSMutableArray *gArr;
@property(nonatomic, strong)NSMutableArray *hArr;
@property(nonatomic, strong)NSMutableArray *iArr;
@property(nonatomic, strong)NSMutableArray *jArr;
@property(nonatomic, strong)NSMutableArray *kArr;
@property(nonatomic, strong)NSMutableArray *lArr;
@property(nonatomic, strong)NSMutableArray *mArr;
@property(nonatomic, strong)NSMutableArray *nArr;
@property(nonatomic, strong)NSMutableArray *oArr;
@property(nonatomic, strong)NSMutableArray *pArr;
@property(nonatomic, strong)NSMutableArray *qArr;
@property(nonatomic, strong)NSMutableArray *rArr;
@property(nonatomic, strong)NSMutableArray *sArr;
@property(nonatomic, strong)NSMutableArray *tArr;
@property(nonatomic, strong)NSMutableArray *uArr;
@property(nonatomic, strong)NSMutableArray *vArr;
@property(nonatomic, strong)NSMutableArray *wArr;
@property(nonatomic, strong)NSMutableArray *xArr;
@property(nonatomic, strong)NSMutableArray *yArr;
@property(nonatomic, strong)NSMutableArray *zArr;

@end

@implementation AllCountryViewController

- (void)getDataWithUrl{
    
    [_dataArray removeAllObjects];

    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    
    dic[@"appkey"] = appkey;
    
    CountryDataHandler *countryDataHandler = [CountryDataHandler shareCountryDataHandler];
    
    [SVProgressHUD showWithStatus:@"loading..."];

    [[DDNetworkRequest sharedClient] post:@"http://api.jisuapi.com/exchange/currency" parame:dic success:^(id object) {
        
        if ([object[@"status"] intValue] == 0) {
            
            for (NSDictionary *dic in object[@"result"]) {
                
                NSString *str = [NSString stringWithFormat:@"%@ %@",dic[@"currency"], dic[@"name"]];
                
                [self.dataArray addObject:str];
                
                NSString *firstString = [str substringToIndex:1];
                
                if ([firstString isEqualToString:@"A"]) {
                    [self.aArr addObject:str];
                } else if ([firstString isEqualToString:@"B"]){
                    [self.bArr addObject:str];
                } else if ([firstString isEqualToString:@"C"]){
                    [self.cArr addObject:str];
                } else if ([firstString isEqualToString:@"D"]){
                    [self.dArr addObject:str];
                } else if ([firstString isEqualToString:@"E"]){
                    [self.eArr addObject:str];
                } else if ([firstString isEqualToString:@"F"]){
                    [self.fArr addObject:str];
                } else if ([firstString isEqualToString:@"G"]){
                    [self.gArr addObject:str];
                } else if ([firstString isEqualToString:@"H"]){
                    [self.hArr addObject:str];
                } else if ([firstString isEqualToString:@"I"]){
                    [self.iArr addObject:str];
                } else if ([firstString isEqualToString:@"J"]){
                    [self.jArr addObject:str];
                } else if ([firstString isEqualToString:@"K"]){
                    [self.kArr addObject:str];
                } else if ([firstString isEqualToString:@"L"]){
                    [self.lArr addObject:str];
                } else if ([firstString isEqualToString:@"M"]){
                    [self.mArr addObject:str];
                } else if ([firstString isEqualToString:@"N"]){
                    [self.nArr addObject:str];
                } else if ([firstString isEqualToString:@"O"]){
                    [self.oArr addObject:str];
                } else if ([firstString isEqualToString:@"P"]){
                    [self.pArr addObject:str];
                } else if ([firstString isEqualToString:@"Q"]){
                    [self.qArr addObject:str];
                } else if ([firstString isEqualToString:@"R"]){
                    [self.rArr addObject:str];
                } else if ([firstString isEqualToString:@"S"]){
                    [self.sArr addObject:str];
                } else if ([firstString isEqualToString:@"T"]){
                    [self.tArr addObject:str];
                } else if ([firstString isEqualToString:@"U"]){
                    [self.uArr addObject:str];
                } else if ([firstString isEqualToString:@"V"]){
                    [self.vArr addObject:str];
                } else if ([firstString isEqualToString:@"W"]){
                    [self.wArr addObject:str];
                } else if ([firstString isEqualToString:@"X"]){
                    [self.xArr addObject:str];
                } else if ([firstString isEqualToString:@"Y"]){
                    [self.yArr addObject:str];
                } else if ([firstString isEqualToString:@"Z"]){
                    [self.zArr addObject:str];
                }
            }

            if (self.aArr.count > 0) {
                [countryDataHandler.countryDic setValue:self.aArr forKey:@"A"];
                [countryDataHandler.keysArray addObject:@"A"];
            }
            if (self.bArr.count > 0) {
                [countryDataHandler.countryDic setValue:self.bArr forKey:@"B"];
                [countryDataHandler.keysArray addObject:@"B"];
            }
            if (self.cArr.count > 0) {
                [countryDataHandler.countryDic setValue:self.cArr forKey:@"C"];
                [countryDataHandler.keysArray addObject:@"C"];
            }
            if (self.dArr.count > 0) {
                [countryDataHandler.countryDic setValue:self.dArr forKey:@"D"];
                [countryDataHandler.keysArray addObject:@"D"];
            }
            if (self.eArr.count > 0) {
                [countryDataHandler.countryDic setValue:self.eArr forKey:@"E"];
                [countryDataHandler.keysArray addObject:@"E"];
            }
            if (self.fArr.count > 0) {
                [countryDataHandler.countryDic setValue:self.fArr forKey:@"F"];
                [countryDataHandler.keysArray addObject:@"F"];
            }
            if (self.gArr.count > 0) {
                [countryDataHandler.countryDic setValue:self.gArr forKey:@"G"];
                [countryDataHandler.keysArray addObject:@"G"];
            }
            if (self.hArr.count > 0) {
                [countryDataHandler.countryDic setValue:self.hArr forKey:@"H"];
                [countryDataHandler.keysArray addObject:@"H"];
            }
            if (self.iArr.count > 0) {
                [countryDataHandler.countryDic setValue:self.iArr forKey:@"I"];
                [countryDataHandler.keysArray addObject:@"I"];
            }
            if (self.jArr.count > 0) {
                [countryDataHandler.countryDic setValue:self.jArr forKey:@"J"];
                [countryDataHandler.keysArray addObject:@"J"];
            }
            if (self.kArr.count > 0) {
                [countryDataHandler.countryDic setValue:self.kArr forKey:@"K"];
                [countryDataHandler.keysArray addObject:@"K"];
            }
            if (self.lArr.count > 0) {
                [countryDataHandler.countryDic setValue:self.lArr forKey:@"L"];
                [countryDataHandler.keysArray addObject:@"L"];
            }
            if (self.mArr.count > 0) {
                [countryDataHandler.countryDic setValue:self.mArr forKey:@"M"];
                [countryDataHandler.keysArray addObject:@"M"];
            }
            if (self.nArr.count > 0) {
                [countryDataHandler.countryDic setValue:self.nArr forKey:@"N"];
                [countryDataHandler.keysArray addObject:@"N"];
            }
            if (self.oArr.count > 0) {
                [countryDataHandler.countryDic setValue:self.oArr forKey:@"O"];
                [countryDataHandler.keysArray addObject:@"O"];
            }
            if (self.pArr.count > 0) {
                [countryDataHandler.countryDic setValue:self.pArr forKey:@"P"];
                [countryDataHandler.keysArray addObject:@"P"];
            }
            if (self.qArr.count > 0) {
                [countryDataHandler.countryDic setValue:self.qArr forKey:@"Q"];
                [countryDataHandler.keysArray addObject:@"Q"];
            }
            if (self.rArr.count > 0) {
                [countryDataHandler.countryDic setValue:self.rArr forKey:@"R"];
                [countryDataHandler.keysArray addObject:@"R"];
            }
            if (self.sArr.count > 0) {
                [countryDataHandler.countryDic setValue:self.sArr forKey:@"S"];
                [countryDataHandler.keysArray addObject:@"S"];
            }
            if (self.tArr.count > 0) {
                [countryDataHandler.countryDic setValue:self.tArr forKey:@"T"];
                [countryDataHandler.keysArray addObject:@"T"];
            }
            if (self.uArr.count > 0) {
                [countryDataHandler.countryDic setValue:self.uArr forKey:@"U"];
                [countryDataHandler.keysArray addObject:@"U"];
            }
            if (self.vArr.count > 0) {
                [countryDataHandler.countryDic setValue:self.vArr forKey:@"V"];
                [countryDataHandler.keysArray addObject:@"V"];
            }
            if (self.wArr.count > 0) {
                [countryDataHandler.countryDic setValue:self.wArr forKey:@"W"];
                [countryDataHandler.keysArray addObject:@"W"];
            }
            if (self.xArr.count > 0) {
                [countryDataHandler.countryDic setValue:self.xArr forKey:@"X"];
                [countryDataHandler.keysArray addObject:@"X"];
            }
            if (self.yArr.count > 0) {
                [countryDataHandler.countryDic setValue:self.yArr forKey:@"Y"];
                [countryDataHandler.keysArray addObject:@"Y"];
            }
            if (self.zArr.count > 0) {
                [countryDataHandler.countryDic setValue:self.zArr forKey:@"Z"];
                [countryDataHandler.keysArray addObject:@"Z"];
            }
            
            [SVProgressHUD dismiss];
        } else {
            [SVProgressHUD showInfoWithStatus:object[@"msg"]];
        }

        
        [self.tableView reloadData];
        
    } failure:^(NSError *err) {
        
    }];
}

- (void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:animated];
    
//    [self setStatusBarBackgroundColor:RGB(205,92,92)];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = RGB(205,92,92);
    
    UIImageView *bgImgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 375, 450)];
    bgImgView.image = [UIImage imageNamed:@"xuehua"];
//    [self.view addSubview:bgImgView];
    
    [[CountryDataHandler shareCountryDataHandler].keysArray removeAllObjects];
    [[CountryDataHandler shareCountryDataHandler].countryDic removeAllObjects];
    
    UIButton *cancelButton = [[UIButton alloc] initWithFrame:CGRectMake(screen_width - 70, 20, 60, 50)];
    [cancelButton setTitle:@"cancel" forState:(UIControlStateNormal)];
    [cancelButton setTitleColor:RGB(128,0,0) forState:(UIControlStateNormal)];
    [cancelButton addTarget:self action:@selector(cancelExchangeCountry:) forControlEvents:(UIControlEventTouchUpInside)];
    [self.view addSubview:cancelButton];
    
    _searchView = [[SearchView alloc] initWithFrame:CGRectMake(10, 30, screen_width-10-80, 30)];
    [_searchView.textField addTarget:self action:@selector(textFieldDidChange:) forControlEvents:(UIControlEventEditingChanged)];
    [self.view addSubview:_searchView];
    
    [self getDataWithUrl];
    
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

- (NSMutableArray *)dataArray {
    
    if (!_dataArray) {
        _dataArray = [[NSMutableArray alloc] init];
    }
    
    return _dataArray;
}

- (NSMutableArray *)searchArray {
    if (!_searchArray) {
        _searchArray = [[NSMutableArray alloc] init];
    }
    
    return _searchArray;
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
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    if (_searchArray.count > 0) {
        return 1;
    }
    return [CountryDataHandler shareCountryDataHandler].keysArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    if (_searchArray.count > 0) {
        return _searchArray.count;
    } else {
        
        NSArray *arr = [[NSArray alloc] init];
        //获取 A-Z 中的一个字母(有序的)
        NSString *keyString = [CountryDataHandler shareCountryDataHandler].keysArray[section];
        
        //遍历无序字典，直到找到与keystring相同的字母，将找到的那个key下的value赋值到对应区头下的cell上
        for (int i = 0; i < [CountryDataHandler shareCountryDataHandler].countryDic.allKeys.count; i ++) {
            
            NSString *dicKeyStr = [CountryDataHandler shareCountryDataHandler].countryDic.allKeys[i];
            
            if ([dicKeyStr isEqualToString:keyString]) {
                
                arr = [CountryDataHandler shareCountryDataHandler].countryDic[dicKeyStr];
            }
            
        }
        
        return arr.count;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:@"UITableViewCell"];
    
    NSArray *arr = [[NSArray alloc] init];

    if (_searchArray.count > 0) {
        
        cell.textLabel.text = [NSString stringWithFormat:@"%@",_searchArray[indexPath.row]];

    } else {
        
        //获取 A-Z 中的一个字母(有序的)
        NSString *keyString = [CountryDataHandler shareCountryDataHandler].keysArray[indexPath.section];
        
        //遍历无序字典，直到找到与keystring相同的字母，将找到的那个key下的value赋值到对应区头下的cell上
        for (int i = 0; i < [CountryDataHandler shareCountryDataHandler].countryDic.allKeys.count; i ++) {
            
            NSString *dicKeyStr = [CountryDataHandler shareCountryDataHandler].countryDic.allKeys[i];
            
            if ([dicKeyStr isEqualToString:keyString]) {
                
                arr = [CountryDataHandler shareCountryDataHandler].countryDic[dicKeyStr];
                
            }
        }
        
        cell.textLabel.text = [NSString stringWithFormat:@"%@",arr[indexPath.row]];
    }
    cell.textLabel.textColor = [UIColor whiteColor];
    cell.backgroundColor = [UIColor clearColor];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 44;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 30;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    
    UIView *v = [[UIView alloc] initWithFrame:CGRectMake(0, 0, screen_width, 30)];
    
    v.backgroundColor = RGBA(178,34,34,0.7);
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, 100, 30)];
    
    label.textColor = [UIColor blackColor];
    
    if (_searchArray.count > 0) {
        label.text = [NSString stringWithFormat:@""];

    } else {
        NSArray *arr = [CountryDataHandler shareCountryDataHandler].keysArray;
        
        label.text = [NSString stringWithFormat:@"%@",arr[section]];
        
    }
    
    [v addSubview:label];
    
    return v;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSLog(@"%ld-%ld",indexPath.section,indexPath.row);
    
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    
    NSString *str = cell.textLabel.text;
    
    if (_didCellClick) {
        _didCellClick(str);
    }
    [self dismissViewControllerAnimated:YES completion:nil];

}

//分区索引
- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView {
    
    NSArray *arr = [CountryDataHandler shareCountryDataHandler].keysArray;

    return arr;
}

- (void)textFieldDidChange:(UITextField *)theTextField {

    [_searchArray removeAllObjects];
    
    for (int i = 0; i < _dataArray.count; i ++) {
        
        NSString *str = _dataArray[i];
        
        if ([str containsString:theTextField.text]) {
            
            [self.searchArray addObject:str];
        }
    }
    
    [_tableView reloadData];
}
//取消按钮
- (void)cancelExchangeCountry:(UIButton *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (NSMutableArray *)aArr {
    if (!_aArr) {
        _aArr = [[NSMutableArray alloc] init];
    }
    return _aArr;
}
- (NSMutableArray *)bArr {
    if (!_bArr) {
        _bArr = [[NSMutableArray alloc] init];
    }
    return _bArr;
}
- (NSMutableArray *)cArr {
    if (!_cArr) {
        _cArr = [[NSMutableArray alloc] init];
    }
    return _cArr;
}
- (NSMutableArray *)dArr {
    if (!_dArr) {
        _dArr = [[NSMutableArray alloc] init];
    }
    return _dArr;
}
- (NSMutableArray *)eArr {
    if (!_eArr) {
        _eArr = [[NSMutableArray alloc] init];
    }
    return _eArr;
}
- (NSMutableArray *)fArr {
    if (!_fArr) {
        _fArr = [[NSMutableArray alloc] init];
    }
    return _fArr;
}
- (NSMutableArray *)gArr {
    if (!_gArr) {
        _gArr = [[NSMutableArray alloc] init];
    }
    return _gArr;
}
- (NSMutableArray *)hArr {
    if (!_hArr) {
        _hArr = [[NSMutableArray alloc] init];
    }
    return _hArr;
}
- (NSMutableArray *)iArr {
    if (!_iArr) {
        _iArr = [[NSMutableArray alloc] init];
    }
    return _iArr;
}
- (NSMutableArray *)jArr {
    if (!_jArr) {
        _jArr = [[NSMutableArray alloc] init];
    }
    return _jArr;
}
- (NSMutableArray *)kArr {
    if (!_kArr) {
        _kArr = [[NSMutableArray alloc] init];
    }
    return _kArr;
}
- (NSMutableArray *)lArr {
    if (!_lArr) {
        _lArr = [[NSMutableArray alloc] init];
    }
    return _lArr;
}
- (NSMutableArray *)mArr {
    if (!_mArr) {
        _mArr = [[NSMutableArray alloc] init];
    }
    return _mArr;
}
- (NSMutableArray *)nArr {
    if (!_nArr) {
        _nArr = [[NSMutableArray alloc] init];
    }
    return _nArr;
}
- (NSMutableArray *)oArr {
    if (!_oArr) {
        _oArr = [[NSMutableArray alloc] init];
    }
    return _oArr;
}
- (NSMutableArray *)pArr {
    if (!_pArr) {
        _pArr = [[NSMutableArray alloc] init];
    }
    return _pArr;
}
- (NSMutableArray *)qArr {
    if (!_qArr) {
        _qArr = [[NSMutableArray alloc] init];
    }
    return _qArr;
}
- (NSMutableArray *)rArr {
    if (!_rArr) {
        _rArr = [[NSMutableArray alloc] init];
    }
    return _rArr;
}
- (NSMutableArray *)sArr {
    if (!_sArr) {
        _sArr = [[NSMutableArray alloc] init];
    }
    return _sArr;
}
- (NSMutableArray *)tArr {
    if (!_tArr) {
        _tArr = [[NSMutableArray alloc] init];
    }
    return _tArr;
}
- (NSMutableArray *)uArr {
    if (!_uArr) {
        _uArr = [[NSMutableArray alloc] init];
    }
    return _uArr;
}
- (NSMutableArray *)vArr {
    if (!_vArr) {
        _vArr = [[NSMutableArray alloc] init];
    }
    return _vArr;
}
- (NSMutableArray *)wArr {
    if (!_wArr) {
        _wArr = [[NSMutableArray alloc] init];
    }
    return _wArr;
}
- (NSMutableArray *)xArr {
    if (!_xArr) {
        _xArr = [[NSMutableArray alloc] init];
    }
    return _xArr;
}
- (NSMutableArray *)yArr {
    if (!_yArr) {
        _yArr = [[NSMutableArray alloc] init];
    }
    return _yArr;
}
- (NSMutableArray *)zArr {
    if (!_zArr) {
        _zArr = [[NSMutableArray alloc] init];
    }
    return _zArr;
}
@end
