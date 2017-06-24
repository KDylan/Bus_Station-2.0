//
//  TLNotPaidViewController.m
//  巴士驿站
//
//  Created by mac on 16/12/2.
//  Copyright © 2016年 Edge. All rights reserved.
//

#import "TLNotPaidViewController.h"
#import "TLOrderDetailTableViewController.h"
#import "TLNotPayView.h"
#import "UIButton+button.h"
@interface TLNotPaidViewController ()

@end

@implementation TLNotPaidViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"订单详情";
    
    /**
     *  自定义导航栏左上角的按钮
     *
     */
    UIButton *button = [UIButton setImage:@"appbar.back" addTarget:self action:@selector(cancelPressed) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:button];
    /**
     *底部的支付tabBar的创建和添加
     */
    TLNotPayView *payTabBar = [[TLNotPayView alloc] init];
    
    [self.view addSubview:payTabBar];
    
    [payTabBar mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left);
        make.right.equalTo(self.view.mas_right);
        make.bottom.equalTo(self.view.mas_bottom);
        make.height.equalTo(@50);
    }];
    
    
    /**
     *滚动订单详情视图
     */
    TLOrderDetailTableViewController *orderDetail = [[TLOrderDetailTableViewController alloc] init];
    [self addChildViewController:orderDetail];

    
    // Do any additional setup after loading the view.
}
-(void)cancelPressed
{
    [self.navigationController popViewControllerAnimated:YES];
    self.tabBarController.tabBar.hidden=NO;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
