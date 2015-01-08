//
//  OldChatViewController.h
//  Isa3
//
//  Created by hirotaka muranaka on 2014/12/25.
//  Copyright (c) 2014年 hirotaka.muranaka. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OldChatViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>
@property (retain, nonatomic) NSMutableArray* items;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@end
