//
//  ForgetPasswordViewController.m
//  登陆界面测试
//
//  Created by mac on 16/7/19.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "ForgetPasswordViewController.h"
#import "ForgetPasswordTwoViewController.h"
#import <SMS_SDK/SMSSDK.h>
//#import "Masonry.h"
@interface ForgetPasswordViewController ()<UITextFieldDelegate>
{
    UIView *bgView;
   
    // 验证码输入框
    UITextField *code;
    UINavigationBar *customNavigationBar;
    UIButton *yzButton;
}
@property(nonatomic, copy) NSNumber *oUserPhoneNum;
@property(assign, nonatomic) NSInteger timeCount;
@property(strong, nonatomic) NSTimer *timer;
//验证码
@property(copy, nonatomic) NSString *smsId;
@property (nonatomic, weak) UITextField *phone;//  电话号码输入框
@property(nonatomic,weak)UIButton *nextTep;//  下一步
@end

@implementation ForgetPasswordViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStyleDone target:nil action:nil];
    self.navigationItem.title=@"找回密码1/2";
    self.view.backgroundColor=[UIColor colorWithRed:231/255.0 green:232/255.0 blue:238/255.0 alpha:1];
    bgView=[[UIView alloc]init];
    bgView.backgroundColor=[UIColor whiteColor];
    [self.view addSubview:bgView];
    [bgView mas_makeConstraints:^(MASConstraintMaker *make) {
       // make.centerX.equalTo(self.view);
        make.top.equalTo(self.view).offset(84);
        make.left.equalTo(self.view.mas_left).offset(10);
        make.right.equalTo(self.view.mas_right).offset(-10);
        make.height.equalTo(@100);
    }];
    UILabel *phonelabel=[[UILabel alloc]init];
    phonelabel.text=@"手机号:";
    
    phonelabel.textColor=[UIColor blackColor];
    phonelabel.font=[UIFont systemFontOfSize:19];
    [bgView addSubview:phonelabel];
    [phonelabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(bgView.mas_left).offset(5);
        make.top.equalTo(bgView.mas_top).offset(15);
        make.width.equalTo(@65);
        make.height.equalTo(@23);

    }];
    UITextField *phone=[[UITextField alloc]init];
    self.phone=phone;
    
    phone.placeholder=@"请填写11位手机号";
    phone.font=[UIFont systemFontOfSize:16];
    phone.clearButtonMode = UITextFieldViewModeWhileEditing;
    [phone setKeyboardType:UIKeyboardTypeNumberPad];
    
   // phone.keyboardType=UIKeyboardTypeNumberPad;
    [self.view addSubview:phone];
    [phone mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(phonelabel.mas_bottom);
        make.left.equalTo(phonelabel.mas_right).offset(5);
        make.width.equalTo(bgView.mas_width).offset(-10);
        make.height.equalTo(@20);
    }];
    
    UILabel *codelabel=[[UILabel alloc]init];
    codelabel.text=@"验证码:";
    codelabel.textColor=[UIColor blackColor];
    codelabel.font=[UIFont systemFontOfSize:19];
    [self.view addSubview:codelabel];
    [codelabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(bgView.mas_left).offset(5);
        make.bottom.equalTo(bgView.mas_bottom).offset(-15);
        make.width.equalTo(@65);
        make.height.equalTo(@23);

    }];
    yzButton=[[UIButton alloc]init];
    yzButton.layer.cornerRadius=3.0f;
  //  [yzButton setBackgroundColor:[UIColor grayColor]];
   
    [yzButton setTitle:@"获取验证码" forState:UIControlStateNormal];
    [yzButton setTitleColor:[ UIColor colorWithRed:32/255.0 green:170/255.0 blue:238/255.0 alpha:1] forState:UIControlStateNormal];
    yzButton.titleLabel.font=[UIFont systemFontOfSize:18];
    [yzButton addTarget:self action:@selector(getValidCode:) forControlEvents:UIControlEventTouchUpInside];
    [bgView addSubview:yzButton];
  
    [yzButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(bgView.mas_bottom).offset(-10);
        make.right.equalTo(bgView.mas_right).offset(-1);
        make.width.equalTo(@135);
        make.height.equalTo(@30);
    }];
    code=[[UITextField alloc]init];
    code.placeholder=@"4位验证码";
    code.keyboardType = UIKeyboardTypeNumberPad;
    
   // code.backgroundColor = [UIColor grayColor];
    
    code.font=[UIFont systemFontOfSize:16];
    code.clearButtonMode = UITextFieldViewModeWhileEditing;
    //code.text=@"mojun1992225";
    //密文样式
    code.secureTextEntry=YES;
    code.keyboardType=UIKeyboardTypeNumberPad;
    [self.view addSubview:code];
    [code mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(codelabel.mas_bottom);
        make.left.equalTo(codelabel.mas_right).offset(5);
        make.right.equalTo(yzButton.mas_left).offset(-5);
      //  make.width.equalTo(@80);
        make.height.equalTo(@20);

    }];
    UIImageView *line=[[UIImageView alloc]init];
    line.backgroundColor=[UIColor colorWithRed:180/255.0f green:180/255.0f blue:180/255.0f alpha:1];
    [self.view addSubview:line];
    [line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(bgView);
        make.centerY.equalTo(bgView);
        make.left.equalTo(bgView.mas_left);
        make.right.equalTo(bgView.mas_right);
        make.height.equalTo(@1);
    }];
    UIButton *nextStep=[[UIButton alloc]init];
    [nextStep.layer setMasksToBounds:YES];
    [nextStep.layer setCornerRadius:5.0];
    [nextStep setTitle:@"下一步" forState:UIControlStateNormal];
    [nextStep setTitleColor:[UIColor colorWithRed:116/255.0 green:125/255.0 blue:135/255.0 alpha:1] forState:UIControlStateNormal];
    [nextStep setBackgroundColor:[UIColor colorWithRed:32/255.0 green:170/255.0 blue:238/255.0 alpha:0.75]];
    [nextStep addTarget:self action:@selector(textChange) forControlEvents:UIControlEventTouchUpInside];//点击登录所传的事件
    nextStep.enabled = NO;
    self.nextTep=nextStep;
    [self.view addSubview:nextStep];
    
    [nextStep mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(bgView.mas_bottom).offset(50);
        make.left.equalTo(self.view.mas_left).offset(10);
        make.right.equalTo(self.view.mas_right).offset(-10);
         make.height.equalTo(@40);
    }];
    //文本框的输入状态获取
    [code addTarget:self action:@selector(textChange) forControlEvents:UIControlEventEditingChanged];
    [self.phone addTarget:self action:@selector(textChange) forControlEvents:(UIControlEventEditingChanged)];
}
-(void)textChange
{
    //  当输入框都不为空才能点击按钮；进行提交
    if(code.text.length!=0&& _phone.text.length!=0)
    {
        
        [self.nextTep setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        
        [self.nextTep setBackgroundColor:[UIColor colorWithRed:39/255.0 green:124/255.0 blue:255/255.0 alpha:0.75]];
        self.nextTep.enabled = YES;
        //确认添加按钮的点击事件
        [self.nextTep addTarget:self action:@selector(nextTep:) forControlEvents:UIControlEventTouchUpInside];
    }
}
//  获取验证码
- (void)getValidCode:(UIButton *)sender
{
    if ([_phone.text isEqualToString:@""])
    {
        [SVProgressHUD showInfoWithStatus:@"亲,请输入手机号码"];
        [self dismiss];
       // return;
    }
    else if (_phone.text.length !=11)
    {
        [SVProgressHUD showInfoWithStatus:@"您输入的手机号码格式不正确"];
        [self dismiss];
       // return;
    }else{
      [self getMeaasge];
    }
   // _oUserPhoneNum =_phone.text;
    sender.userInteractionEnabled = NO;
    self.timeCount = 60;
    
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(reduceTime:) userInfo:sender repeats:YES];
  
    NSLog(@"获取短信验证码");
    
}

- (void)reduceTime:(NSTimer *)codeTimer {
    self.timeCount--;
    if (self.timeCount == 0) {
        [yzButton setTitle:@"重新获取验证码" forState:UIControlStateNormal];
        [yzButton setTitleColor:[UIColor colorWithRed:248/255.0f green:144/255.0f blue:34/255.0f alpha:1] forState:UIControlStateNormal];
        UIButton *info = codeTimer.userInfo;
        info.enabled = YES;
        yzButton.userInteractionEnabled = YES;
        [self.timer invalidate];
    } else {
        NSString *str = [NSString stringWithFormat:@"%lu秒后重新获取", self.timeCount];
        [yzButton setTitle:str forState:UIControlStateNormal];
        yzButton.userInteractionEnabled = NO;
        
    }
}

-(void)nextTep:(UIButton*)button
{
//        if ([_phone.text isEqualToString:@""])
//        {
//            [SVProgressHUD showInfoWithStatus:@"亲,请输入注册手机号码"];
//            [self dismiss];
//            return;
//        }
//        else if (_phone.text.length!=11)
//        {
//            [SVProgressHUD showInfoWithStatus:@"您输入的手机号码格式不正确"];
//            [self dismiss];
//            return;
//        }
//        else
    if ([code.text isEqualToString:@""])
        {
            [SVProgressHUD showInfoWithStatus:@"亲,请输入验证码"];
            [self dismiss];
          //  return;
        }else{
            [self pushMessage];
        }
}
//  提交短信验证码
-(void)pushMessage{
 
    [SMSSDK commitVerificationCode:code.text phoneNumber:self.phone.text zone:@"86" result:^(SMSSDKUserInfo *userInfo, NSError *error) {
        {
            if (!error)
            {
                ForgetPasswordTwoViewController *pushView2=[[ForgetPasswordTwoViewController alloc]init];
               
                //将手机号码传过去
                pushView2.userPhone = self.phone.text;
               
                [self.navigationController pushViewController:pushView2 animated:YES];
               
                NSLog(@"pushView2.userphone%@",pushView2.userPhone);
                
              //  self.nextTep.enabled = NO;
                
                NSLog(@"验证成功");
           
            }
            else
            {
                [SVProgressHUD showInfoWithStatus:@"验证码错误"];
                [self dismiss];
                NSLog(@"错误信息:%@",error);
            }
        }
    }];
}

// 获取短信验证码
-(void)getMeaasge{
    [SMSSDK getVerificationCodeByMethod:SMSGetCodeMethodSMS phoneNumber:self.phone.text
                                   zone:@"86"
                       customIdentifier:nil
                                 result:^(NSError *error){
                                     if (!error) {
                                         NSLog(@"获取验证码成功");
                                     } else {
//                                         [SVProgressHUD showInfoWithStatus:@"网络不佳，正在排队中..."];
//                                         [self dismiss];
//
                                         NSLog(@"错误信息：%@",error);}
                                     }];
}

-(void)dismiss{
    //  1s后消失
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [SVProgressHUD dismiss];
    });
    
}


@end
