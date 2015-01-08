//
//  TalkTableViewCell.h
//  Isa3
//
//  Created by hirotaka muranaka on 2014/12/23.
//  Copyright (c) 2014年 hirotaka.muranaka. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TalkTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *labelTalk;
@property (weak, nonatomic) IBOutlet UIImageView *imageThumb;

+(CGFloat)rowHeight;
@end
