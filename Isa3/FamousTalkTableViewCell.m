//
//  FamousTalkTableViewCell.m
//  Isa3
//
//  Created by hirotaka muranaka on 2014/12/24.
//  Copyright (c) 2014年 hirotaka.muranaka. All rights reserved.
//

#import "FamousTalkTableViewCell.h"

@implementation FamousTalkTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

+(CGFloat)rowHeight {
    return 50.0f;
}

@end
