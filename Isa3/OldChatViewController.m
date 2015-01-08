//
//  OldChatViewController.m
//  Isa3
//
//  Created by hirotaka muranaka on 2014/12/25.
//  Copyright (c) 2014年 hirotaka.muranaka. All rights reserved.
//

#import "OldChatViewController.h"
#import "TalkTableViewCell.h"

@interface OldChatViewController ()

@end

@implementation OldChatViewController

@synthesize items;

- (void)viewDidLoad {
    [super viewDidLoad];

    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    items = [[NSMutableArray alloc]initWithObjects:[NSDictionary dictionaryWithObjectsAndKeys:@"ほー", @"text", @"true", @"famous", nil],
             [NSDictionary dictionaryWithObjectsAndKeys:@"これ買うわー", @"text", @"true", @"famous", nil],
             [NSDictionary dictionaryWithObjectsAndKeys:@"CMひまー", @"text", @"true", @"famous", nil],
             [NSDictionary dictionaryWithObjectsAndKeys:@"寒い", @"text", @"true", @"famous", nil],
             [NSDictionary dictionaryWithObjectsAndKeys:@"おもしろい", @"text", @"true", @"famous", nil],
             [NSDictionary dictionaryWithObjectsAndKeys:@"録画しとこ。", @"text", @"true", @"famous", nil], nil];
    UINib *nib = [UINib nibWithNibName:@"TalkCell" bundle:nil];
    [self.tableView registerNib:nib forCellReuseIdentifier:@"TalkCell"];
    self.tableView.separatorColor = [UIColor clearColor];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return items.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSDictionary *dic = [items objectAtIndex:indexPath.row];
    NSString *CellIdentifier;

    CellIdentifier = @"TalkCell";
    TalkTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.labelTalk.text = [dic objectForKey:@"text"];
    return cell;

}

@end
