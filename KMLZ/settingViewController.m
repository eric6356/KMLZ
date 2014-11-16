//
//  settingViewController.m
//  KMLZ
//
//  Created by 何忠杰 on 14/11/9.
//  Copyright (c) 2014年 ERIC. All rights reserved.
//

#import "settingViewController.h"

@interface settingViewController ()
@property (weak, nonatomic) IBOutlet UISlider *fontSizeSlider;

@end

@implementation settingViewController
- (IBAction)fontSizeChanged:(id)sender {
    [self.delegate fontsizeChangeTO:self.fontSize];
    [self saveData];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 131)];
    [self readData];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (CGFloat)fontSize{
    return self.fontSizeSlider.value;
}

- (void)saveData{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    [defaults setFloat:self.fontSizeSlider.value forKey:@"fontsize"];
    
    [defaults synchronize];
}

- (void)readData{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    CGFloat fz = [defaults floatForKey:@"fontsize"];
    if (fz) {
        self.fontSizeSlider.value = [defaults floatForKey:@"fontsize"];
    } else {
        self.fontSizeSlider.value = 15;
    }
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
