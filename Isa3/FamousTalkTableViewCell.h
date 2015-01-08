//
//  FamousTalkTableViewCell.h
//  Isa3
//
//  Created by hirotaka muranaka on 2014/12/24.
//  Copyright (c) 2014年 hirotaka.muranaka. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FamousTalkTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *labelTalk;

+(CGFloat)rowHeight;
@end
