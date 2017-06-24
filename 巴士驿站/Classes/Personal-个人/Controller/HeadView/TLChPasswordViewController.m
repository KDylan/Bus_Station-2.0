//
//  TLChPasswordViewController.m
//  巴士驿站
//
//  Created by Edge on 16/7/15.
//  Copyright © 2016年 Edge. All rights reserved.
//
#define MAS_SHORTHAND  //  不用mas
//  mas_equalTo(self.view) = equalTo(self.view);
#define MAS_SHORTHAND_GLOBALS
#import "Masonry.h"
#import "TLChPasswordViewController.h"

@interface TLChPasswordViewController ()<UITextFieldDelegate>

@property(nonatomic,weak)UITextField *now_password;
@property(nonatomic,weak)UITextField *New_Password;
@property(nonatomic,weak)UITextField *surenew_password;
@property(nonatomic,weak)UIButton *button;
@end

@implementation TLChPasswordViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"修改密码";
     self.view.backgroundColor = [UIColor colorWithRed:0.888 green:0.865 blue:0.872 alpha:1.000];
  
    [self addNowPasswordTextFiled];
    [self addNewPasswordTextFiled];
    [self addSureNewPasswordTextFiled];
    [self addChangePasswordButton];
    
    [self.now_password addTarget:self action:@selector(textChange) forControlEvents:UIControlEventEditingChanged];
    [self.New_Password addTarget:self action:@selector(textChange) forControlEvents:(UIControlEventEditingChanged)];
    [self.surenew_password addTarget:self action:@selector(textChange) forControlEvents:(UIControlEventEditingChanged)];
    
    self.New_Password.delegate = self;
    self.now_password.delegate = self;
    self.surenew_password.delegate = self;
    self.button.enabled = NO;
   
}
#pragma 添加控件
//  添加现在密码输入框
-(void)addNowPasswordTextFiled{
    UITextField *textFiled = [[UITextField alloc]init];
    self.now_password = textFiled;
  
    textFiled.backgroundColor=[UIColor whiteColor];
    textFiled.font = [UIFont systemFontOfSize:14.0];
    textFiled.placeholder  = @"  当前密码";
    textFiled.secureTextEntry = YES;  //  密码输入变成点
    textFiled.clearsOnBeginEditing = YES;  //  再次编辑就清空
    textFiled.clearButtonMode = UITextFieldViewModeWhileEditing;  //  编辑时候可以一次性清除
    textFiled.returnKeyType = UIReturnKeyDone; //  键盘return键变成什么样子
    //  切圆角
    textFiled.layer.masksToBounds = YES;
    textFiled.layer.cornerRadius = 8;
    [self.view addSubview:textFiled];
    [textFiled mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(80);
        make.left.equalTo(self.view).offset(15);
        make.right.equalTo(self.view).offset(-15);
        make.height.equalTo(@35);
        
    }];
}
//  添加新密码输入框
-(void)addNewPasswordTextFiled{
   
    UITextField *textFiled1 = [[UITextField alloc]init];
    self.New_Password = textFiled1;
   
    textFiled1.backgroundColor=[UIColor whiteColor];
    textFiled1.font = [UIFont systemFontOfSize:14.0];
    textFiled1.placeholder  = @"  新密码";
    textFiled1.secureTextEntry = YES;  //  密码输入变成点
    textFiled1.clearsOnBeginEditing = YES;  //  再次编辑就清空
     textFiled1.clearButtonMode = UITextFieldViewModeWhileEditing;  //  编辑时候可以一次性清除
    //textFiled.text = @"123";
    //  切圆角
    textFiled1.layer.masksToBounds = YES;
    textFiled1.layer.cornerRadius = 8;
    textFiled1.returnKeyType = UIReturnKeyDone;
    [self.view addSubview:self.New_Password ];
    [textFiled1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.now_password.mas_bottom).offset(15);
        make.left.equalTo(self.view).offset(15);
        make.right.equalTo(self.view).offset(-15);
        make.height.equalTo(@35);
        
    }];
}
//  添加确认新密码输入框
-(void)addSureNewPasswordTextFiled{
    UITextField *textFiled2 = [[UITextField alloc]init];
    self.surenew_password = textFiled2;
   
    textFiled2.backgroundColor=[UIColor whiteColor];
    textFiled2.font = [UIFont systemFontOfSize:14.0];
    textFiled2.placeholder  = @"  确认新密码";
    textFiled2.secureTextEntry = YES;  //  密码输入变成点
    textFiled2.clearsOnBeginEditing = YES;  //  再次编辑就清空
     textFiled2.clearButtonMode = UITextFieldViewModeWhileEditing;  //  编辑时候可以一次性清除
    //textFiled.text = @"123";
    //  切圆角
    textFiled2.layer.masksToBounds = YES;
    textFiled2.layer.cornerRadius = 8;
    textFiled2.returnKeyType = UIReturnKeyDone;
    [self.view addSubview:self.surenew_password];
    [textFiled2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.New_Password.mas_bottom).offset(15);
        make.left.equalTo(self.view).offset(15);
        make.right.equalTo(self.view).offset(-15);
        make.height.equalTo(@35);
    }];
}
//  添加确定按钮
-(void)addChangePasswordButton{
   
    UIButton *button = [[UIButton alloc]init];
   
    self.button=button;
    [button setBackgroundColor:[UIColor colorWithWhite:0.727 alpha:1.0]];
    //设置button的title
    [button setTitle:@"确认提交" forState:UIControlStateNormal];
    //title字体大小
    button.titleLabel.font = [UIFont systemFontOfSize:16];
    //设置title的字体居中
    button.titleLabel.textAlignment = NSTextAlignmentCenter;
    //  设置字体颜色
    [button setTitleColor:[UIColor whiteColor]forState:UIControlStateNormal];
    
    //  切圆角
    button.layer.masksToBounds = YES;
    button.layer.cornerRadius = 8;
    [self.view addSubview:button];
    //  给button布局
    [button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.surenew_password.mas_bottom).offset(15);
        make.right.equalTo(self.view).offset(-15);
        make.left.equalTo(self.view).offset(15);
        make.height.equalTo(@35);
    }];
    [self.button addTarget:self action:@selector(cilckButton) forControlEvents:UIControlEventTouchUpInside];
 }

-(void)textChange
{
    //  当三个输入框都不为空才能点击按钮；进行提交
    if((self.now_password.text.length && self.New_Password.text.length)&&(self.surenew_password.text.length&&self.New_Password.text.length)!=0)
     {
         self.button.enabled = YES ;  //  按钮可点击
        [self.button setBackgroundColor:[UIColor colorWithRed:0.2273 green:0.7282 blue:1.0 alpha:0.5]];
     }
}

-(void)cilckButton{
    if ([self.New_Password.text isEqualToString:self.surenew_password.text])
    {
        //  返回前一个界面
        [[self navigationController] popViewControllerAnimated:true];

    }else{
            [SVProgressHUD showInfoWithStatus:@"密码不一致"];
            [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeBlack];
            //  1s后消失
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [SVProgressHUD dismiss];
            });
    }
}

@end
