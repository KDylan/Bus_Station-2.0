//
//  TLLoginViewController.m
//  巴士驿站
//
//  Created by Edge on 16/10/9.
//  Copyright © 2016年 Edge. All rights reserved.
//

#import "TLLoginViewController.h"
#import "TLOrderTableViewController.h"
@interface TLLoginViewController ()
//@property (nonatomic,strong)UIViewController *orderViewController;
//
//@property (nonatomic,strong)UIViewController *topViewController;
@end

@implementation TLLoginViewController

//-(instancetype)init{
//    
// [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(LoadTLOrderViewController) name:@"LoadTLOrderViewControllerNotifacation" object:nil];
//    
//    return self;
//}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"订单";
    [self layout];
 }

//-(void)LoadTLOrderViewController{
//    
//    NSLog(@"消息接收成功");
//   // UIViewController *top = [UIApplication sharedApplication].keyWindow.rootViewController;
//    
//    TLOrderTableViewController *orderViewController = [[TLOrderTableViewController alloc]init];
//    self.orderViewController = orderViewController;
//    
//    [self.topViewController  presentViewController:self.orderViewController animated:YES completion:nil];
//    
//  //  [self.view addSubview:self.orderViewController.view];
//}

//- (UIViewController*) topMostController {
//    UIViewController *topController = [UIApplication sharedApplication].keyWindow.rootViewController;
//    
//    while (topController.presentedViewController) {
//        topController = topController.presentedViewController;
//    }
//    self.topViewController = topController;
//    return topController;
//}
//
//-(void)dealloc{
//    
//    [[NSNotificationCenter defaultCenter]removeObserver:self];
//}
-(void)layout{
    UILabel *label = [[UILabel alloc]init];
    label.text =@"巴 士 驿 站";
    label.textColor = [UIColor grayColor];
    label.font = [UIFont boldSystemFontOfSize:30];  // 黑体18号字
   // label.backgroundColor = [UIColor redColor];
    [self.view addSubview:label];
    
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(104);
        make.centerX.equalTo(self.view);
        make.width.equalTo(@150);
        make.height.equalTo(@20);
    }];
    
    UIImageView *imageView = [[UIImageView alloc]init];
    imageView.image = [UIImage imageNamed:@"done.jpg"];
    [self.view addSubview:imageView];
    
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(label.mas_bottom).offset(30);
        make.left.equalTo(self.view).offset(80);
        make.right.equalTo(self.view).offset(-80);
        make.height.equalTo(imageView.mas_width).offset(-50);
    }];
    
    UILabel *label1 = [[UILabel alloc]init];
    label1.text =@"请登录后操作";
    label1.textColor = [UIColor grayColor];
    label1.font = [UIFont boldSystemFontOfSize:18];
    label1.textAlignment = NSTextAlignmentCenter;
   //  label.backgroundColor = [UIColor redColor];
    [self.view addSubview:label1];
    
    [label1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(imageView.mas_bottom).offset(30);
        make.centerX.equalTo(self.view);
        make.width.equalTo(@200);
        make.height.equalTo(@20);
    }];

    
    UIButton *button = [[UIButton alloc]init];
    [button setBackgroundImage:[UIImage imageNamed:@"login_btn_blue_nor"] forState:UIControlStateNormal];
    [button setBackgroundImage:[UIImage imageNamed:@"login_btn_blue_press"] forState:UIControlStateSelected];
    [button setTitle:@"登 录" forState:(UIControlStateNormal)];
    
    [button addTarget:self action:@selector(login) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:button];
    
    [button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(label1.mas_bottom).offset(40);
        make.left.equalTo(self.view).offset(20);
        make.right.equalTo(self.view).offset(-20);
        make.height.equalTo(@40);
    }];
}
//  弹出登录界面
-(void)login{
    NSLog(@"登录");
    LoginViewController *Login = [[LoginViewController alloc]init];
    UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:Login];
    [self presentViewController:nav animated:YES completion:nil];
}
//- (UIViewController *)viewController {
//    for (UIView* next = [self superview]; next; next = next.superview) {
//        UIResponder *nextResponder = [next nextResponder];
//        if ([nextResponder isKindOfClass:[UIViewController class]]) {
//            return (UIViewController *)nextResponder;
//        }
//    }
//    return nil;
//}

@end
