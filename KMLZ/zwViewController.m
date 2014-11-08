//
//  zwViewController.m
//  KMLZ
//
//  Created by ERIC on 14/11/1.
//  Copyright (c) 2014年 ERIC. All rights reserved.
//

#import "zwViewController.h"

@interface zwViewController ()
@end

@implementation zwViewController

- (instancetype)initWithText:(NSString *) text{
    self = [super init];
    if (self) {
        CGRect frm = self.view.frame;
        _zwTextView = [[UITextView alloc]initWithFrame:frm];
        _zwTextView.editable = NO;
        _zwTextView.text = text;
        [self.view addSubview:_zwTextView];
        self.view.backgroundColor = [UIColor greenColor];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
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
