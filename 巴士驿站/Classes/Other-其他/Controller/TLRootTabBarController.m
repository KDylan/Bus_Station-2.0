//
//  TLRootTabBarController.m
//  巴士驿站
//
//  Created by Edge on 16/7/10.
//  Copyright © 2016年 Edge. All rights reserved.
//

#import "TLRootTabBarController.h"
#import "TLOrderTableViewController.h"
#import "TLPersonalViewController.h"
#import "TLHomePageViewController.h"
#import "TLMapViewController.h"
#import "LoginViewController.h"
#import "TLLoginViewController.h"
#import "TLOrderRootViewController.h"
@interface TLRootTabBarController ()

@end

@implementation TLRootTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    //初始化我们的子控制器
    [self setupChildeVC];
    
    //设置应用程序中所有的UITabBarItem的属性
    UITabBarItem * item = [UITabBarItem appearance];
    //属性字典
    NSDictionary * dict = @{
                            NSFontAttributeName : [UIFont systemFontOfSize:12],
                            NSForegroundColorAttributeName : [UIColor grayColor]
                            };
    NSDictionary * dictSelect = @{ NSForegroundColorAttributeName : [UIColor darkGrayColor]};
    
    [item setTitleTextAttributes:dict forState:UIControlStateNormal];
    [item setTitleTextAttributes:dictSelect forState:UIControlStateSelected];
   }

-(void)setupChildeVC
{
    //  首页
    [self setUpChildViewController:[[TLHomePageViewController alloc]init]title:@"首页" imageNamed:@"homepage" selectImageNamed:@"homepageselected"];
    
    //  地图
    
    [self setUpChildViewController:[[TLMapViewController alloc]init]title:@"地图" imageNamed:@"map" selectImageNamed:@"mapselected"];
   
//    NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
//    NSString *name = [userDefault objectForKey:@"userName"];
//    if (name == nil) {
//        //  订单
//        
        [self setUpChildViewController:[[TLOrderRootViewController alloc]init]title:@"订单" imageNamed:@"-1" selectImageNamed:@"02_03"];
    //  个人
    [self setUpChildViewController:[[TLPersonalViewController alloc]init]title:@"个人" imageNamed:@"personal" selectImageNamed:@"personalselected"];
}

-(void)setUpChildViewController:(UIViewController *)vc title:(NSString *)title imageNamed:(NSString *)imageName selectImageNamed:(NSString *)selectImageName{
    UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:vc];
    vc.tabBarItem.title = title;
    vc.tabBarItem.image = [UIImage imageNamed:imageName];
    vc.tabBarItem.selectedImage = [UIImage imageNamed:selectImageName];
    [self addChildViewController:nav];
}
@end
