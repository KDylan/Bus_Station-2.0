//
//  TLOrderTableViewController.m
//  巴士驿站
//
//  Created by 胡潇炜 on 16/7/13.
//  Copyright © 2016年 Edge. All rights reserved.
//

#import "TLOrderTableViewController.h"
#import "TLOrderTableViewCell.h"
//#import "TLOrderDetailTableViewController.h"
//#import "LoginViewController.h"
//#import "AppDelegate.h"
//#import "TLHomePageViewController.h"
#import "TLPayTabBarController.h"
@interface TLOrderTableViewController ()

@end

@implementation TLOrderTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"订单";
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;//  取消分割线
    self.view.backgroundColor = [UIColor whiteColor];
//    /**
//     *  设置tableView的分割线
//     */
//    self.tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
//    
//    [self.tableView setSeparatorColor:[UIColor blueColor]];
//    
//    if ([self.tableView respondsToSelector:@selector(setSeparatorInset:)]) {
//        [self.tableView setSeparatorInset:UIEdgeInsetsZero];
//    }
//    if ([self.tableView respondsToSelector:@selector(setLayoutMargins:)]) {
//        [self.tableView setLayoutMargins:UIEdgeInsetsZero];
//    }
    
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
    
    TLOrderTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[TLOrderTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    
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

    TLPayTabBarController *view = [[TLPayTabBarController alloc] init];
    
    //隐藏tabBar
    self.tabBarController.tabBar.hidden = YES;
    
    [self.navigationController pushViewController:view animated:YES];
}


@end
