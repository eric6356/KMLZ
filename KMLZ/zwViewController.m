//
//  zwViewController.m
//  KMLZ
//
//  Created by ERIC on 14/11/1.
//  Copyright (c) 2014年 ERIC. All rights reserved.
//

#import "zwViewController.h"
#import "settingViewController.h"

@interface zwViewController () <settingVCDelegate>
@property (nonatomic, strong) UIMenuController *popupMenu;
@property (nonatomic, strong) UIBarButtonItem *settingButton;
@property (nonatomic, strong) settingViewController * settingVC;
@property (nonatomic) BOOL menuShown;
@end

@implementation zwViewController

- (void)fontsizeChangeTO:(CGFloat)fontsize{
    _zwTextView.font = [_zwTextView.font fontWithSize:fontsize];
}

- (void)themeChangeTo:(NSInteger)theme{
    NSLog(@"%d", theme);
    switch (theme) {
        case 0:
            _zwTextView.backgroundColor = [UIColor whiteColor];
            break;
        case 1:
            _zwTextView.backgroundColor = [UIColor darkGrayColor];
        default:
            break;
    }
}
//-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
//    NSLog(@"点击空白");
//    [super touchesBegan:touches withEvent:event];
//    if (_menuShown) {
//        self.navigationItem.rightBarButtonItem.title = @"设置";
//        _zwTextView.font = [_zwTextView.font fontWithSize:self.settingVC.fontSize];
//        _menuShown = NO;
//    }
//}

- (void) showSetting:(id) sender {
//    _zwTextView.font = [_zwTextView.font fontWithSize:20];
    if (_menuShown) {
        NSLog(@"closeSetting");
        self.navigationItem.rightBarButtonItem.title = @"设置";
        [self.settingVC.view removeFromSuperview];
//        _zwTextView.font = [_zwTextView.font fontWithSize:self.settingVC.fontSize];
        _menuShown = NO;
    } else{
        NSLog(@"showSetting");
        self.navigationItem.rightBarButtonItem.title = @"完成";
        [self.view addSubview:_settingVC.view];
        _menuShown = YES;
    }
}

- (instancetype)initWithText:(NSString *) text{
    self = [super init];
    if (self) {
        // 读取数据
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        
        //读取字体大小，赋值给textView
        CGFloat fz = [defaults floatForKey:@"fontsize"];
        CGRect frm = self.view.frame;
        _zwTextView = [[UITextView alloc]initWithFrame:frm];
        _zwTextView.editable = NO;
        _zwTextView.text = text;
        if (fz) {
            _zwTextView.font = [_zwTextView.font fontWithSize:fz];
        }else{
            _zwTextView.font = [_zwTextView.font fontWithSize:15];
        }
        
        //读取主题背景
        NSInteger thm = [defaults integerForKey:@"theme"];
        [self themeChangeTo:thm];
        
        //阅读进度
//        [_zwTextView setContentOffset:CGPointMake(0, 500)];
//        CGPoint offset = CGPointMake(<#CGFloat x#>, <#CGFloat y#>)
        
        [self.view addSubview:_zwTextView];
        _settingVC = [[settingViewController alloc]init];
        _settingVC.delegate = self;
        self.view.backgroundColor = [UIColor greenColor];
        _menuShown = NO;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.settingButton = [[UIBarButtonItem alloc]initWithTitle:@"设置" style:UIBarButtonItemStylePlain target:self action:@selector(showSetting:)];
    self.popupMenu = [[UIMenuController alloc]init];
    self.navigationItem.rightBarButtonItem = self.settingButton;
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//- (void)viewWillAppear:(BOOL)animated{
////    self.zwTextView.text = self.zwText;
//}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
