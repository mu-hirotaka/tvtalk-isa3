//
//  OldChatListViewController.m
//  Isa3
//
//  Created by hirotaka muranaka on 2014/12/23.
//  Copyright (c) 2014年 hirotaka.muranaka. All rights reserved.
//

#import "OldChatListViewController.h"
#import "CustomTableViewCell.h"
#import "ECSlidingViewController.h"
#import "UIViewController+ECSlidingViewController.h"
#import "MenuTableViewController.h"

#define RGB(r, g, b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1]

@interface OldChatListViewController ()

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSArray *dataSourceThumbs;
@property (nonatomic, strong) NSArray *dataSourceCompany;
@property (nonatomic, strong) NSArray *dataSourcePrograms;
@property (nonatomic, strong) NSArray *dataSourceHumanNum;
@property (nonatomic, strong) NSArray *dataSourcePoints;

@end

@implementation OldChatListViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.tableView.delegate = self;
    self.tableView.dataSource = self;

    self.dataSourceThumbs = @[@"sportsThumb", @"eatThumb", @"comedyThumb", @"horieThumb"];
    self.dataSourceCompany = @[@"フジテレビ", @"日本テレビ", @"TBS", @"テレビ朝日", @"テレビ東京", @"NHK"];
    self.dataSourcePrograms = @[@"ぴったんこカン・カンのトーク", @"news everyのトーク", @"ペケポンのトーク", @"妖怪ウォッチのトーク", @"すぽるとのトーク"];
    self.dataSourceHumanNum = @[@"100人", @"200人", @"150人", @"500人", @"1000人"];
    self.dataSourcePoints = @[@"20ポイント", @"40ポイント", @"100ポイント", @"200ポイント"];
    
    // カスタマイズしたセルをテーブルビューにセット
    UINib *nib = [UINib nibWithNibName:@"TableViewCustomCell" bundle:nil];
    [self.tableView registerNib:nib forCellReuseIdentifier:@"OnAirCell"];
    
    // ECSlidingViewControllerのunderLeftViewControllerにMenuTableViewControllerを指定する
    if (![self.slidingViewController.underLeftViewController isKindOfClass:[MenuTableViewController class]]) {
        self.slidingViewController.underLeftViewController  = [self.storyboard instantiateViewControllerWithIdentifier:@"Menu"];
    }
    [self.view addGestureRecognizer:self.slidingViewController.panGesture];
    [self.slidingViewController setAnchorRightRevealAmount:130.0f];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.dataSourceThumbs count];    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [CustomTableViewCell rowHeight];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *CellIdentifier = @"OnAirCell";
    CustomTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    NSString *imageThumbStr = [self.dataSourceThumbs objectAtIndex:indexPath.row];
    
    UIImage *imageThumb = [UIImage imageNamed:imageThumbStr];
    UIImage *imageHuman = [UIImage imageNamed:@"human"];
    UIImage *imagePoint = [UIImage imageNamed:@"point"];
    cell.imageThumb.image = imageThumb;
    cell.imageHuman.image = imageHuman;
    cell.imagePoint.image = imagePoint;
    
    int companyRandomIndex = arc4random() % [self.dataSourceCompany count];
    int programRandomIndex = arc4random() % [self.dataSourcePrograms count];
    int humanNumRandomIndex = arc4random() % [self.dataSourceHumanNum count];
    int pointRandomIndex = arc4random() % [self.dataSourcePoints count];
    
    cell.labelCompany.text = [self.dataSourceCompany objectAtIndex:companyRandomIndex];
    cell.labelProgramName.text = [self.dataSourcePrograms objectAtIndex:programRandomIndex];
    cell.labelHumanNumber.text = [self.dataSourceHumanNum objectAtIndex:humanNumRandomIndex];
    cell.labelHumanNumber.textColor = RGB(100, 149, 237);
    cell.labelPointValue.text = [self.dataSourcePoints objectAtIndex:pointRandomIndex];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self performSegueWithIdentifier:@"Chat" sender:self];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)menuTapped:(id)sender {
    if (self.slidingViewController.currentTopViewPosition == ECSlidingViewControllerTopViewPositionCentered) {
        [self.slidingViewController anchorTopViewToRightAnimated:YES];
    } else {
        [self.slidingViewController resetTopViewAnimated:YES];
    }
}
@end
