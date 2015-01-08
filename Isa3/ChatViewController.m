//
//  ChatViewController.m
//  Isa3
//
//  Created by hirotaka muranaka on 2014/12/23.
//  Copyright (c) 2014年 hirotaka.muranaka. All rights reserved.
//

#import "ChatViewController.h"
#import "TalkTableViewCell.h"
#import "MyTalkTableViewCell.h"
#import "ECSlidingViewController.h"
#import "UIViewController+ECSlidingViewController.h"

#define WINDOW_SIZE [[UIScreen mainScreen] applicationFrame].size

@interface ChatViewController ()
@property (nonatomic, strong) NSArray *resMessages;
@end

@implementation ChatViewController

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
   
//    items = [[NSMutableArray alloc]initWithObjects:@"ほー", @"これ買うわー", @"CMひまー", @"寒い", @"おもしろい", @"録画しとこ。", nil];
    self.resMessages = @[@"そうだねー", @"これ買うわー", @"CMひまー", @"寒い", @"こいつらおもしろすぎw", @"録画必須w", @"神回！！！！", @"っっっっっっw", @"笑笑笑笑笑笑笑", @"これはっっっw", @"（○´∀｀○）ｧﾊﾊ★w", @"きたーーーーーー", @"かわいいなぁ^^"];
    
    [self.textField setDelegate:self];
    [self.scrollView setScrollEnabled:NO];
    [self.scrollView setDelaysContentTouches:NO];

    [self.talkButton addTarget:self action:@selector(addEvent) forControlEvents:UIControlEventTouchUpInside];
    self.talkButton.layer.borderColor = [UIColor colorWithRed:1.0f green:0.078f blue:0.576f alpha:1.0f].CGColor;
    self.talkButton.layer.borderWidth = 1.0f;
    self.talkButton.layer.cornerRadius = 7.5f;
    self.talkButton.layer.backgroundColor = [UIColor colorWithRed:1.0f green:0.078f blue:0.576f alpha:1.0f].CGColor;

    //キーボード表示の通知
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardOn:)
                                                 name:UIKeyboardDidShowNotification
                                               object:nil];
    //キーボード非表示の通知
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardOff:)
                                                 name:UIKeyboardDidHideNotification
                                               object:nil];

    
    UINib *nib = [UINib nibWithNibName:@"TalkCell" bundle:nil];
    UINib *nib2 = [UINib nibWithNibName:@"MyTalkCell" bundle:nil];
    [self.tableView registerNib:nib forCellReuseIdentifier:@"TalkCell"];
    [self.tableView registerNib:nib2 forCellReuseIdentifier:@"MyTalkCell"];
    self.tableView.separatorColor = [UIColor clearColor];
    
    if (![self.slidingViewController.underRightViewController isKindOfClass:[UIViewController class]]) {
        self.slidingViewController.underRightViewController  = [self.storyboard instantiateViewControllerWithIdentifier:@"FamousChat"];
    }
    [self.view addGestureRecognizer:self.slidingViewController.panGesture];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    
    //スクロール範囲を設定
    [self.scrollView setContentSize:CGSizeMake(WINDOW_SIZE.width, WINDOW_SIZE.height)];
}

- (void)addEvent {
    //追加するアイテムを設定
//    NSString* item = self.textField.text;
    NSDictionary *item = [NSDictionary dictionaryWithObjectsAndKeys:
                         self.textField.text, @"text", @"false", @"famous", nil];
    
    //アイテムの挿入位置を配列の最後尾に指定
    NSInteger row = [self.items count];
    [self.items insertObject:item atIndex:row];
    
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:row inSection:0];
    //テーブルの最後の行にアイテムを追加
    [self.tableView insertRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    //追加した行へスクロール
    [self.tableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:row inSection:0] atScrollPosition:UITableViewScrollPositionTop animated:YES];
    self.textField.text = @"";

    int rand = arc4random() % 5;
    if (rand >= 4) {
        [self performSelector:@selector(addResponseMessage) withObject:nil afterDelay:1.0];
    } else if (rand >= 3) {
        [self performSelector:@selector(addResponseMessage) withObject:nil afterDelay:1.0];
        [self performSelector:@selector(addResponseMessage) withObject:nil afterDelay:1.5];
    } else if (rand >= 2) {
        [self performSelector:@selector(addResponseMessage) withObject:nil afterDelay:1.0];
        [self performSelector:@selector(addResponseMessage) withObject:nil afterDelay:1.5];
        [self performSelector:@selector(addResponseMessage) withObject:nil afterDelay:2.0];
    } else {
        [self performSelector:@selector(addResponseMessage) withObject:nil afterDelay:1.0];
        [self performSelector:@selector(addResponseMessage) withObject:nil afterDelay:1.5];
        [self performSelector:@selector(addResponseMessage) withObject:nil afterDelay:2.0];
        [self performSelector:@selector(addResponseMessage) withObject:nil afterDelay:2.5];
    }
}

- (void)addResponseMessage
{
    int rand = arc4random() % [self.resMessages count];
    NSDictionary *item = [NSDictionary dictionaryWithObjectsAndKeys:
                          [self.resMessages objectAtIndex:rand], @"text", @"true", @"famous", nil];
    //アイテムの挿入位置を配列の最後尾に指定
    NSInteger row = [self.items count];
    [self.items insertObject:item atIndex:row];
    
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:row inSection:0];
    //テーブルの最後の行にアイテムを追加
    [self.tableView insertRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    //追加した行へスクロール
    [self.tableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:row inSection:0] atScrollPosition:UITableViewScrollPositionTop animated:YES];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.items.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSDictionary *dic = [items objectAtIndex:indexPath.row];
    NSString *CellIdentifier;

    if ([[dic objectForKey:@"famous"] isEqual:@"true"]) {
        CellIdentifier = @"TalkCell";
        TalkTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        int rand = random() % 100 + 1;
        if (rand >= 80) {
            UIImage *imageThumb = [UIImage imageNamed:@"manThumb"];
            cell.imageThumb.image = imageThumb;
        } else if (rand >= 60) {
            UIImage *imageThumb = [UIImage imageNamed:@"ishiharaThumb"];
            cell.imageThumb.image = imageThumb;
        } else if (rand >= 40) {
            UIImage *imageThumb = [UIImage imageNamed:@"jobsThumb"];
            cell.imageThumb.image = imageThumb;
        } else if (rand >= 20) {
            UIImage *imageThumb = [UIImage imageNamed:@"gaijinThumb"];
            cell.imageThumb.image = imageThumb;
        } else {
            UIImage *imageThumb = [UIImage imageNamed:@"horieThumb"];
            cell.imageThumb.image = imageThumb;            
        }

        NSDictionary *dic = [items objectAtIndex:indexPath.row];
        cell.labelTalk.text = [dic objectForKey:@"text"];
        return cell;
    } else {
        CellIdentifier = @"MyTalkCell";
        MyTalkTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        NSDictionary *dic = [items objectAtIndex:indexPath.row];
        cell.labelTalk.text = [dic objectForKey:@"text"];
        return cell;
    }
}

//キーボードを表示した時に呼ばれる
-(void)keyboardOn:(NSNotification *)notification
{
    NSDictionary *info  = [notification userInfo];
    CGSize keyboardSize = [[info objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue].size;
    //NSLog(@"%f",keyboardSize.height);
    //CGPoint scrollPoint = CGPointMake(0.0f, keyboardSize.height);
    CGPoint scrollPoint = CGPointMake(0.0f, 138.0f);
    [self.scrollView setContentOffset:scrollPoint animated:YES];
}

//キーボードを閉じた時に呼ばれる
-(void)keyboardOff:(NSNotification *)notification
{
    [self.scrollView setContentOffset:CGPointMake(0.0f, -65.0f) animated:YES];
}

//リターンキーでキーボードを閉じる
-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}
@end
