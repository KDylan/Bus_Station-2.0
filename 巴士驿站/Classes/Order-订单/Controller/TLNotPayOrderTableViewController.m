//
//  TLNotPayOrderTableViewController.m
//  巴士驿站
//
//  Created by mac on 16/12/2.
//  Copyright © 2016年 Edge. All rights reserved.
//

#import "TLNotPayOrderTableViewController.h"
#import "TLNotPaidOrderTableViewCell.h"
#import "TLNotPaidViewController.h"
@interface TLNotPayOrderTableViewController ()

@end

@implementation TLNotPayOrderTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"订单";
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;//  取消分割线
    self.view.backgroundColor = [UIColor whiteColor];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 10;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *ID = @"cell";
    
    TLNotPaidOrderTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[TLNotPaidOrderTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
        
    }
    
    if (indexPath.row >=1) {
        // 用view来画分割线
        UIView *customLine = [[UIView alloc] init];
        customLine.frame = CGRectMake(cell.frame.origin.x, cell.frame.origin.y, self.view.frame.size.width+55, 10);
        customLine.backgroundColor =  [UIColor colorWithRed:0.9278 green:0.9179 blue:0.9377 alpha:1.0];
        [cell.contentView addSubview:customLine];
    }
    
    return cell;
}

///**
// *  设置tableView的分割线
// *
// */
//- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
//
//    if ([cell respondsToSelector:@selector(setSeparatorInset:)]) {
//        [cell setSeparatorInset:UIEdgeInsetsZero];
//    }
//    if ([cell respondsToSelector:@selector(setLayoutMargins:)]) {
//        [cell setLayoutMargins:UIEdgeInsetsZero];
//    }
//}
//


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 90;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    TLNotPaidViewController *view = [[TLNotPaidViewController alloc] init];
    
    //隐藏tabBar
    self.tabBarController.tabBar.hidden = YES;
    
    [self.navigationController pushViewController:view animated:YES];
}


@end
