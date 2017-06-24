//
//  TLOrderRootViewController.m
//  巴士驿站
//
//  Created by Edge on 16/11/14.
//  Copyright © 2016年 Edge. All rights reserved.
//

#import "TLOrderRootViewController.h"
#import "TLLoginViewController.h"
#import "TLOrderTableViewController.h"
#import "LZPageViewController.h"
#import "TLNotPayOrderTableViewController.h"
#import "Masonry.h"
@interface TLOrderRootViewController ()
@property(nonatomic,strong)NSString *name;
@end

@implementation TLOrderRootViewController

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    [self viewDidLoad];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"订单";
    self.view.backgroundColor=[UIColor whiteColor];
    NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
    NSString *name = [userDefault objectForKey:@"userName"];
    self.name=name;
    NSLog(@"----%@",self.name);
    
    if (self.name == nil) {
        NSLog(@"%@",self.name);
        [self addLoginView];
        
    }else{
    
        [self setupChildView];
    
    }
    

}

-(void)setupChildView{
    
    LZPageViewController *pageView=[[LZPageViewController alloc]initWithTitles:@[@"未支付",@"已支付"] controllersClass:@[[TLNotPayOrderTableViewController class],[TLOrderTableViewController class]]];
    if ([pageView respondsToSelector:@selector(setEdgesForExtendedLayout:)]) {
        self.edgesForExtendedLayout = UIRectEdgeNone;
    }
//    [pageView.view setFrame:self.view.frame];
    [self addChildViewController:pageView];
    [self.view addSubview:pageView.view];
//    [pageView.view mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(self.view.mas_top).with.offset(65);
//        make.bottom.equalTo(self.view.mas_bottom);
//        make.width.equalTo(self.view.mas_width);
//    }];
    //    TLOrderTableViewController *OrderTableViewController = [[TLOrderTableViewController alloc]init];
//    [OrderTableViewController.view setFrame:self.view.frame];
//    [self addChildViewController:OrderTableViewController];
//    [self.view addSubview:OrderTableViewController.view];
    
}

-(void)addLoginView{
    
        TLLoginViewController *LogViewController = [[TLLoginViewController alloc]init];
    
        [LogViewController.view setFrame:self.view.frame];
        [self addChildViewController:LogViewController];
    //    self.view.backgroundColor = [UIColor whiteColor];
    
         [self.view addSubview:LogViewController.view];
    
   
    
}
@end
