//
//  TLOrderDetailTableViewController.m
//  巴士驿站
//
//  Created by 胡潇炜 on 16/7/13.
//  Copyright © 2016年 Edge. All rights reserved.
//

#import "TLOrderDetailTableViewController.h"
#import "TLOrderDetailTableViewCell.h"
#import "AddressPickerDemo.h"
#import "BAddressPickerController.h"
@interface TLOrderDetailTableViewController ()
//<MycellDelegate>

@end

@implementation TLOrderDetailTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
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

    return 1;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *ID = @"cell";
    TLOrderDetailTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[TLOrderDetailTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
        cell.selectionStyle=UITableViewCellSelectionStyleNone;
    }
//    cell.delegate=self;
    
    return cell;
}
//-(void)addSiteDetailaction:(UIButton *)button
//{
//    _selectOrderDetail=@"1";
//    AddressPickerDemo *vc = [[AddressPickerDemo alloc]init];
//    vc.selectOrderDetailView=_selectOrderDetail;
//    vc.siteBlock  = ^(NSString *str){
//        [button setTitle:str forState:UIControlStateNormal];
//        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
//    };
//    [self.navigationController pushViewController:vc animated:YES];
//}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 800;
}


@end
