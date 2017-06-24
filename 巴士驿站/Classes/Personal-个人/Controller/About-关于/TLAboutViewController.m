//
//  TLAboutViewController.m
//  巴士驿站
//
//  Created by mac on 16/7/15.
//  Copyright © 2016年 Edge. All rights reserved.
//

#import "TLAboutViewController.h"
#import "Masonry.h"
#import "TLFeedbackViewController.h"
@interface TLAboutViewController ()<UITextViewDelegate,UITableViewDelegate,UITableViewDelegate>

@end

@implementation TLAboutViewController
#pragma mark:1.界面设置
- (void)viewDidLoad {
    self.navigationItem.title=@"关于";
    self.view.backgroundColor= [UIColor colorWithRed:0.888 green:0.865 blue:0.872 alpha:1.000];
    UIImageView *imageView_Center = [[UIImageView alloc]init];
    imageView_Center.layer.masksToBounds = YES;
    imageView_Center.layer.cornerRadius =10.0f;
    imageView_Center.layer.borderWidth=3.0f;
    imageView_Center.layer.borderColor=[UIColor whiteColor].CGColor;
    imageView_Center.clipsToBounds=YES;
    [self.view addSubview:imageView_Center];
    [imageView_Center mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.view.mas_centerY).offset(-140);
        make.centerX.equalTo(self.view.mas_centerX);
        make.width.equalTo(@90);
        make.height.equalTo(@90);
    }];
    imageView_Center.image = [UIImage imageNamed:@"88.jpg"];
    UILabel *label=[[UILabel alloc]init];
    label.text=@"巴士驿站";
    label.font=[UIFont systemFontOfSize:16];
    label.textColor=[UIColor colorWithRed:133/255.0 green:133/255.0 blue:133/255.0 alpha:1];
    label.textAlignment=NSTextAlignmentCenter;
    [self.view addSubview:label];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(imageView_Center.mas_bottom).with.offset(10);
        make.left.equalTo(self.view).with.offset(10);
        make.right.equalTo(self.view).with.offset(-10);
    }];
    UITextView *abstract =[[UITextView alloc]init];
    abstract.delegate=self;
    abstract.editable=NO;
    abstract.text=@"巴士驿站是一款集买票、定位等功能于一身的软件，致力于给乘车人员以最好的服务......";
    abstract.backgroundColor=[UIColor colorWithRed:0.9503 green:0.9503 blue:0.9503 alpha:1.0];
    abstract.textColor=[UIColor colorWithRed:0.162 green:0.162 blue:0.162 alpha:1.0];
    abstract.font=[UIFont systemFontOfSize:14];
    //  切圆角
    abstract.layer.masksToBounds = YES;
    abstract.layer.cornerRadius = 5;
    [self.view addSubview:abstract];
    [abstract mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@90);
        make.top.equalTo(label.mas_bottom).with.offset(20);
        make.left.equalTo(self.view).offset(10);
        make.right.equalTo(self.view).offset(-10);
    }];
    //单个cell设置
    UITableViewCell *cell=[[UITableViewCell alloc]init];
    cell.backgroundColor=[UIColor whiteColor];
    cell.textLabel.text=@"关注我们";
     cell.textLabel.textAlignment = NSTextAlignmentCenter;//居中
    //  切圆角
    cell.layer.masksToBounds = YES;
    cell.layer.cornerRadius = 5;
    cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
    [self.view addSubview:cell];
    [cell mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(abstract.mas_bottom).with.offset(20);
        make.left.equalTo(self.view).offset(10);
        make.right.equalTo(self.view).offset(-10);
        make.height.mas_equalTo(40);
    }];
    //cell上面覆盖的button的设置
    UIButton *button=[[UIButton alloc]init];
    [button addTarget:self action:@selector(button:) forControlEvents:UIControlEventTouchUpInside];
    [button setBackgroundColor:[UIColor clearColor]];
    [self.view addSubview:button];
    
    [button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(abstract.mas_bottom).with.offset(20);
        make.left.equalTo(self.view).offset(10);
        make.right.equalTo(self.view).offset(-10);
        make.height.mas_equalTo(40);
    }];
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
#pragma mark:2.（关注我们）按钮响应事件设置


-(void)button:(UIButton *)sender{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"关注我们" message:@"我们的微信公众号是" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *action1 = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        //
    }];
    UIAlertAction *action2 = [UIAlertAction actionWithTitle:@"去微信" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        //
    }];
    [alert addAction:action1];
    [alert addAction:action2];
    [self presentViewController:alert animated:self completion:nil];
}
@end
