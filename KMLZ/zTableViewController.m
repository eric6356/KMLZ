//
//  zTableViewController.m
//  KMLZ
//
//  Created by ERIC on 14/11/2.
//  Copyright (c) 2014年 ERIC. All rights reserved.
//

#import "zTableViewController.h"
#import "KMLZzwz.h"

@interface zTableViewController ()

@end

@implementation zTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.zw = [[KMLZzwz alloc]init];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
