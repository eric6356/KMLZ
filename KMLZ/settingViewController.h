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
    id<settingVCDelegate> _delegate;
}
@property (nonatomic) CGFloat fontSize;
@property (nonatomic, strong)id delegate;
@end

