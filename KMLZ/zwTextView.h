//
//  zwTextView.h
//  KMLZ
//
//  Created by 何忠杰 on 14/11/18.
//  Copyright (c) 2014年 ERIC. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol zwTVDelegate <NSObject>
- (void) saveOffset;
@end

@interface zwTextView : UITextView{
    id<zwTVDelegate> _dlgt;
}
@property (nonatomic, strong)id dlgt;
@end
