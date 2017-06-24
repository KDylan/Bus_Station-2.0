//
//  ForgetPasswordTwoViewController.m
//  登陆界面测试
//
//  Created by mac on 16/7/19.
//  Copyright © 2016年 mac. All rights reserved.
//
#import "ForgetPasswordViewController.h"
#import "LoginViewController.h"
#import "ForgetPasswordTwoViewController.h"
//#import "Masonry.h"
@interface ForgetPasswordTwoViewController ()<UITextFieldDelegate>
{
    UIView *bgView;
    UITextField *password;
}
@property(nonatomic,weak)UIButton *competeButton;//  完成按钮
@end

@implementation ForgetPasswordTwoViewController

- (void)viewDidLoad {
     [super viewDidLoad];
    self.navigationItem.title=@"找回密码2/2";
    self.view.backgroundColor=[UIColor colorWithRed:231/255.0 green:232/255.0 blue:238/255.0 alpha:1];
    bgView=[[UIView alloc]init];
    bgView.backgroundColor=[UIColor whiteColor];
    [self.view addSubview:bgView];
    [bgView mas_makeConstraints:^(MASConstraintMaker *make) {
       // make.centerX.equalTo(self.view);
        make.top.equalTo(self.view).offset(100);
        make.left.equalTo(self.view).offset(10);
        make.right.equalTo(self.view).offset(-10);
        make.height.equalTo(@50);
    }];
    UILabel *label=[[UILabel alloc]init];
    label.text=@"请设置新的密码:";
    label.textColor=[UIColor grayColor];
    label.font=[UIFont systemFontOfSize:16];
    [self.view addSubview:label];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(bgView.mas_top).offset(-10);
        make.left.equalTo(self.view).offset(20);
        make.width.equalTo(@150);
        make.height.equalTo(@10);
    }];
    UILabel *passwordlabel=[[UILabel alloc]init];
    passwordlabel.text=@"密码:";
    passwordlabel.textColor=[UIColor blackColor];
    passwordlabel.font=[UIFont systemFontOfSize:19];
    [bgView addSubview:passwordlabel];
    [passwordlabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(bgView.mas_left).offset(20);
        make.top.equalTo(bgView.mas_top).offset(15);
        make.width.equalTo(@45);
        make.height.equalTo(@20);
    }];
    password=[[UITextField alloc]init];
    password.font=[UIFont systemFontOfSize:16];
    password.placeholder=@"6-20位字母或数字";
    password.clearButtonMode = UITextFieldViewModeWhileEditing;
    password.secureTextEntry=YES;
    [bgView addSubview:password];
    [password mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(passwordlabel.mas_bottom);
        make.left.equalTo(passwordlabel.mas_right).offset(10);
        make.right.equalTo(bgView.mas_right).offset(-20);
        make.height.equalTo(@17);
    }];
    UIButton *complete=[[UIButton alloc]init];
    [complete.layer setMasksToBounds:YES];
    [complete.layer setCornerRadius:5.0];
    [complete setTitle:@"完成" forState:UIControlStateNormal];
    [complete setTitleColor:[UIColor colorWithRed:116/255.0 green:125/255.0 blue:135/255.0 alpha:1] forState:UIControlStateNormal];
    [complete setBackgroundColor:[UIColor colorWithRed:32/255.0 green:170/255.0 blue:238/255.0 alpha:0.75]];
    [complete addTarget:self action:@selector(textChangeTwo) forControlEvents:UIControlEventTouchUpInside];//点击登录所传的事件
    complete.enabled=NO;
    self.competeButton = complete;
    [self.view addSubview:complete];
    [complete mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(bgView.mas_bottom).offset(50);
        make.left.equalTo(self.view.mas_left).offset(10);
        make.right.equalTo(self.view.mas_right).offset(-10);
        make.height.equalTo(@40);
    }];
  [password addTarget:self action:@selector(textChangeTwo) forControlEvents:UIControlEventEditingChanged];
}
-(void)textChangeTwo
{
    //  当输入框都不为空才能点击按钮；进行提交
    if(password.text.length>=6)
    {
        
        [self.competeButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        
        [self.competeButton setBackgroundColor:[UIColor colorWithRed:39/255.0 green:124/255.0 blue:255/255.0 alpha:0.75]];
        self.competeButton.enabled = YES;
        //确认添加按钮的点击事件
        [self.competeButton addTarget:self action:@selector(requestServices:) forControlEvents:UIControlEventTouchUpInside];
        
    }
}

-(void)requestServices:(UIButton *)btn{
    
    if(btn.selected) return;
    btn.selected=YES;
    
    NSLog(@"点击提交修改密码按钮");
    [SVProgressHUD showWithStatus:@"正在提交中..."];

    LoginServiceImplSoapBinding * binding = [ [LoginServiceImpl LoginServiceImplSoapBinding]initWithAddress:BSURL];
    
    binding.logXMLInOut = YES;
    
    NSNumberFormatter *number = [[NSNumberFormatter alloc]init];
    
    id userPhone = [number numberFromString:self.userPhone];
    
    tns1_modify * modify = [[tns1_modify alloc] init];
    
    modify.userRole = @"user";
    modify.userName = self.userPhone;
    modify.userPwd = password.text;
    modify.userEmail = @"null";
    modify.userID =self.userPhone;
    modify.userIDCardType = @"身份证";
    modify.userIDCardNo =@0;
    modify.userAvatorURL = @"null";
    modify.userPhoneNumber = userPhone;
    modify.userCurrentLocation = @"null";
   
 //   NSLog(@"uuID=%@",self.uuID);

    NSLog(@"modify.userPhoneNumber=%@",modify.userPhoneNumber);
    NSLog(@"modify.userPwd=%@",modify.userPwd);
    NSLog(@"self.userphone=%@",self.userPhone);
    LoginServiceImplSoapBindingResponse * response = [binding modifyUsingParameters:modify];
    NSString * resultStr = [[NSString alloc] init];
    for (id mine in response.bodyParts) {
        if ([mine isKindOfClass:[tns1_modifyResponse class]]) {
            NSLog(@"输出结果：%@", [mine return_]);
            resultStr = [mine return_];
        }
    }
    [self dictionaryWithJsonString:resultStr];//  string->dict
    
    NSString *str = [_dict objectForKey:@"status"];
    NSString *strerror = [_dict objectForKey:@"errmsg"];
  
    NSLog(@"str = %@",str);
    
    if (str==NULL) {
        [SVProgressHUD dismiss];
            UIAlertView *alter = [[UIAlertView alloc]initWithTitle:nil message:@"当前网络不可用,请检查后重试" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
            [alter show];
        }
        else{//  修改密码成功
        if ([str isEqualToString:@"0"]) {
            [self clickCompeteButton];
            NSLog(@"登录成功");
        } else{
            [SVProgressHUD dismiss];

            UIAlertView *alter = [[UIAlertView alloc]initWithTitle:nil message:strerror delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
                [alter show];
            }
            
        }
    [self performSelector:@selector(competetimeEnough) withObject:nil afterDelay:2.0]; //2秒后又可以处理点击事件了

}
-(void)competetimeEnough{
    self.competeButton.selected=NO;
}

    // 将json字符串转换成字典
-(NSDictionary *)dictionaryWithJsonString:(NSString *)jsonString {
    
    if (jsonString == nil) {
        NSLog(@"json为空");
            return nil;
        }
        NSData *jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
        NSError *err;
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:jsonData
                                                             options:NSJSONReadingMutableContainers
                                                               error:&err];
        self.dict =dict;
        if(err) {
            NSLog(@"json解析失败：%@",err);
            
        }
        return dict;
    }
// 完成
-(void)clickCompeteButton
{
    [SVProgressHUD dismiss];

    NSLog(@"修改密码成功");
    
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"修改成功" message:nil preferredStyle:UIAlertControllerStyleAlert];
   
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"确认" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        
        [self.navigationController popToRootViewControllerAnimated:YES];
        
    }];
    
    [alertController addAction:okAction];
    [self presentViewController:alertController animated:YES completion:nil];

    
    
   
}

@end
