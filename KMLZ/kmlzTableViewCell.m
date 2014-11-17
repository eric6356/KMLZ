//
//  kmlzTableViewCell.m
//  KMLZ
//
//  Created by 何忠杰 on 14/11/8.
//  Copyright (c) 2014年 ERIC. All rights reserved.
//

#import "kmlzTableViewCell.h"

@implementation kmlzTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    // ignore the style argument, use our own to override
    self = [super initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:reuseIdentifier];
    if (self) {
        // If you need any further customization
    }
    return self;
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
