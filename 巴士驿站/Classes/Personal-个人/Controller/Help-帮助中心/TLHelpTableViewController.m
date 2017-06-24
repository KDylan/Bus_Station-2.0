//
//  TLHelpTableViewController.m
//  巴士驿站
//
//  Created by Edge on 16/7/13.
//  Copyright © 2016年 Edge. All rights reserved.
//

#import "TLHelpTableViewController.h"
#import "TLhChangePViewController.h"
#import "TLFeedbackViewController.h"
#import "TLhAddCommonViewController.h"

@interface TLHelpTableViewController ()

@property (nonatomic,strong) NSArray *dataSource ;

@end

@implementation TLHelpTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"帮助中心";
    self.tableView.backgroundColor= [UIColor colorWithRed:0.888 green:0.865 blue:0.872 alpha:1.000];
    _dataSource=@[@"怎么更换头像？",@"怎么添加常用旅客？",@"怎么注册新用户？",@"怎么下订单？"];
    self.tableView.tableFooterView = [[UIView alloc]init];
}
#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//    if (section==0) {
        return _dataSource.count;
//    }else{
//        return 1;
//    }
}

//每个分组上边预留的空白高度
//-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
//{
//    return 20;
//}
//每个分组下边预留的空白高度
//-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
//{
////    if (section==1) {
////        return 40;
////    }
//    return 30;
//}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *ID =@"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    
//    if (indexPath.section==0) {
        cell.textLabel.text = [_dataSource objectAtIndex:indexPath.row];
        cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
//    }else{
//        cell.textLabel.text=@"意见反馈";
//        cell.textLabel.textAlignment=NSTextAlignmentCenter;
  //  }
    //  分割线左对齐
    [cell setLayoutMargins:UIEdgeInsetsZero];
    [cell setSeparatorInset:UIEdgeInsetsZero];
    [self.tableView setLayoutMargins:UIEdgeInsetsZero];
    [self.tableView setSeparatorInset:UIEdgeInsetsZero];
    
    return cell;
}

//每一个分组下对应的tableview 高度
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50;
}
- (void)tableView:(UITableView*)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section==0) {
        switch (indexPath.row) {
            case 0:
            { TLhChangePViewController *pushCell01 = [[TLhChangePViewController alloc]init];
                UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithTitle:@"帮助中心" style:UIBarButtonItemStylePlain target:nil action:nil];
                self.navigationItem.backBarButtonItem = item;
                pushCell01.navigationItem.title = [_dataSource objectAtIndex:indexPath.row];
                [self.navigationController pushViewController:pushCell01 animated:YES ];
            }break;
            case 1:
            { TLhAddCommonViewController *pushCell01 = [[TLhAddCommonViewController alloc]init];
                UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithTitle:@"帮助中心" style:UIBarButtonItemStylePlain target:nil action:nil];
                self.navigationItem.backBarButtonItem = item;
                pushCell01.navigationItem.title = [_dataSource objectAtIndex:indexPath.row];
                [self.navigationController pushViewController:pushCell01 animated:YES ];
            }break;
                
        }

    }
//    if (indexPath.section==1) {
//        TLFeedbackViewController *pushCell10 = [[TLFeedbackViewController alloc]init];
//        UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithTitle:@"帮助中心" style:UIBarButtonItemStylePlain target:nil action:nil];
//        self.navigationItem.backBarButtonItem = item;
//        [self.navigationController pushViewController:pushCell10 animated:YES ];
//    }
//}
}


@end
