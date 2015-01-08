//
//  FamousChatViewController.m
//  Isa3
//
//  Created by hirotaka muranaka on 2014/12/24.
//  Copyright (c) 2014年 hirotaka.muranaka. All rights reserved.
//

#import "FamousChatViewController.h"
#import "FamousTalkTableViewCell.h"

@interface FamousChatViewController ()

@end

@implementation FamousChatViewController

@synthesize items;

- (void)viewDidLoad {
    [super viewDidLoad];

    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    items = [[NSMutableArray alloc]initWithObjects:@"いいね", @"この分野はのびるよね", @"そりゃ当たり前", @"めっちゃ美味いよ", @"スマホでええやん", @"早く欲しいな", nil];

    UINib *nib = [UINib nibWithNibName:@"FamousTalkCell" bundle:nil];
    [self.tableView registerNib:nib forCellReuseIdentifier:@"FamousTalkCell"];
    self.tableView.separatorColor = [UIColor clearColor];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.items.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *CellIdentifier;
    CellIdentifier = @"FamousTalkCell";
    FamousTalkTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.labelTalk.text = [items objectAtIndex:indexPath.row];
    return cell;
}

@end
