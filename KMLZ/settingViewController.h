//
//  settingViewController.h
//  KMLZ
//
//  Created by 何忠杰 on 14/11/9.
//  Copyright (c) 2014年 ERIC. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol settingVCDelegate <NSObject>

- (void) fontsizeChangeTO:(CGFloat)fontsize;

@end

@interface settingViewController : UIViewController{
    NSObject<settingVCDelegate> *zwVC;
}
@property (nonatomic) CGFloat fontSize;
@property (nonatomic, weak)NSObject *zwVC;
@end
