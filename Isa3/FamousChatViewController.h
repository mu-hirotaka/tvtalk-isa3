//
//  FamousChatViewController.h
//  Isa3
//
//  Created by hirotaka muranaka on 2014/12/24.
//  Copyright (c) 2014年 hirotaka.muranaka. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FamousChatViewController : UIViewController <UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate, UIScrollViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (retain, nonatomic) NSMutableArray* items;
@end
