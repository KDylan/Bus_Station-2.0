//
//  TLhAddCommonViewController.m
//  巴士驿站
//
//  Created by Maominghui on 16/7/15.
//  Copyright © 2016年 Edge. All rights reserved.
//

#import "TLhAddCommonViewController.h"

@interface TLhAddCommonViewController ()

@end

@implementation TLhAddCommonViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIView *view1=[[UIView alloc]initWithFrame:self.view.bounds];
    [self.view addSubview:view1];
    view1.backgroundColor=[UIColor redColor];
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
