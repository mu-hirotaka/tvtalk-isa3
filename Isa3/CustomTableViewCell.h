//
//  CustomTableViewCell.h
//  Isa3
//
//  Created by hirotaka muranaka on 2014/12/19.
//  Copyright (c) 2014年 hirotaka.muranaka. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *imageThumb;
@property (weak, nonatomic) IBOutlet UILabel *labelCompany;
@property (weak, nonatomic) IBOutlet UILabel *labelProgramName;
@property (weak, nonatomic) IBOutlet UIImageView *imageHuman;
@property (weak, nonatomic) IBOutlet UILabel *labelHumanNumber;
@property (weak, nonatomic) IBOutlet UIImageView *imagePoint;
@property (weak, nonatomic) IBOutlet UILabel *labelPointValue;
@property (weak, nonatomic) IBOutlet UILabel *labelFamousName;

+(CGFloat)rowHeight;

@end
