//
//  ViewController.m
//  登陆界面测试
//
//  Created by mac on 16/7/12.
//  Copyright © 2016年 mac. All rights reserved.
//
#import "TLSaveData.h"
#import "LoginViewController.h"
#import "ForgetPasswordViewController.h"
#import "SVProgressHUD.h"
//#import "Masonry.h"
#import "TLPersonalViewController.h"
#import "TLOrderTableViewController.h"
#import "TLWriteOrderTableViewController.h"
#import "TLSearchTableViewController.h"
#import "TLHomePageViewController.h"
#import "TLRootTabBarController.h"
#import "TLOrderTableViewController.h"
#import "TLLoginViewController.h"
#import "TLLoginViewController.h"
//#import "IQKeyboardReturnKeyHandler.h"
#import "AppDelegate.h"
#import "RegisterViewController.h"
@interface LoginViewController ()<UITextFieldDelegate,UITabBarControllerDelegate,UITabBarDelegate>
@property(strong,nonatomic)UITextField *userName;
@property(strong,nonatomic)UITextField *passWord;
@property(strong,nonatomic)NSString *confirmUn;
@property(strong,nonatomic)NSString *confirmPw;
@property(nonatomic,strong)NSDictionary *dict;//  json字符转字典

@property(nonatomic,strong)UIButton *login;

@property(nonatomic,strong)UIButton *rigether;
@end

@implementation LoginViewController
#pragma mark: 1.登录首界面设置
- (void)viewDidLoad {
    
//    IQKeyboardReturnKeyHandler *returnKeyHandler= [[IQKeyboardReturnKeyHandler alloc]init];
//    returnKeyHandler.lastTextFieldReturnKeyType=UIReturnKeyNext;
    [super viewDidLoad];
    [self setLayout];
    //Do any additional setup after loading the view, typically from a nib.
}
-(void)setLayout{
#pragma mark:1.1/*背景图片设置*/
    UIImageView *bgPicture = [[UIImageView alloc]initWithFrame:self.view.bounds];
    bgPicture.image = [UIImage imageNamed:@"背景.jpg"];
    [self.view addSubview:bgPicture];
    
#pragma mark:1.2/*标题设置*/
    UILabel *title=[[UILabel alloc]init];
    title.text=@"巴士驿站";
    title.font=[UIFont systemFontOfSize:30];
    title.textColor=[UIColor whiteColor];
    title.textAlignment=NSTextAlignmentCenter;
  //  title.backgroundColor = [UIColor redColor];
    [self.view addSubview:title];
    [title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.top.equalTo(self.view).with.offset(69);
        make.width.equalTo(@200);
        make.height.equalTo(@100);
    }];
#pragma mark:1.3/*用户名和密码设置*/
    self.userName=[[UITextField alloc]init];
    self.userName.borderStyle=UITextBorderStyleRoundedRect;
    self.userName.placeholder=@" 手机号:";
    self.userName.textColor=[UIColor colorWithRed:128/255.0 green:129/255.0 blue:129/255.0 alpha:1];
    [self.userName setBackgroundColor:[UIColor colorWithRed:164/255.0 green:193/255.0 blue:224/255.0 alpha:1]];
    [self.view addSubview:self.userName];
    [self.userName mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(title.mas_bottom).with.offset(5);
        make.left.equalTo(self.view).with.offset(30);
        make.right.equalTo(self.view).with.offset(-30);
        make.height.equalTo(@45);
    }];
    self.passWord=[[UITextField alloc]init];
    self.passWord.borderStyle=UITextBorderStyleRoundedRect;
    self.passWord.placeholder=@" 密    码:";
    self.passWord.secureTextEntry=YES;
    self.passWord.textColor=[UIColor colorWithRed:128/255.0 green:129/255.0 blue:129/255.0 alpha:1];
    [self.passWord setBackgroundColor:[UIColor colorWithRed:164/255.0 green:193/255.0 blue:224/255.0 alpha:1]];
    [self.view addSubview:self.passWord];
    [self.passWord mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.userName.mas_bottom).offset(1);
        make.left.equalTo(self.view).with.offset(30);
        make.right.equalTo(self.view).with.offset(-30);
        make.height.equalTo(@45);
    }];
#pragma mark:1.4/*忘记密码设置*/
    UIButton *forgetPw=[[UIButton alloc]init];
    [forgetPw setTitle:@"忘记密码" forState:UIControlStateNormal];
    [forgetPw setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    forgetPw.titleLabel.font=[UIFont systemFontOfSize:17.0];
    [forgetPw addTarget:self action:@selector(forgetpassword:) forControlEvents:UIControlEventTouchUpInside];
   // forgetPw.backgroundColor = [UIColor redColor];
    [self.view addSubview:forgetPw];
    [forgetPw mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.passWord.mas_bottom).with.offset(5);
        make.left.equalTo(self.passWord);
         make.height.equalTo(@25);
        make.width.equalTo(@70);
    }];
#pragma mark:1.5/*注册设置*/
    UIButton *Register=[[UIButton alloc]init];
    [Register setTitle:@"注册" forState:UIControlStateNormal];
    [Register setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    Register.titleLabel.font=[UIFont systemFontOfSize:17.0];
   // Register.backgroundColor = [UIColor redColor];
    [self.view addSubview:Register];
       [Register addTarget:self action:@selector(forRegister:) forControlEvents:UIControlEventTouchUpInside];
    [Register mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.passWord.mas_bottom).with.offset(5);
        make.right.equalTo(self.passWord);
        make.height.equalTo(@25);
        make.width.equalTo(@40);
    }];
#pragma mark:1.6/*登录设置*/
    UIButton *login=[[UIButton alloc]init];
    [login.layer setMasksToBounds:YES];
    [login.layer setCornerRadius:5.0];
   login.titleLabel.font = [UIFont systemFontOfSize:20.0];
    [login setBackgroundColor:[UIColor colorWithRed:172/255.0 green:205/255.0 blue:242/255.0 alpha:0.60]];
    [login setTitle:@"登     录" forState:UIControlStateNormal];
    [forgetPw setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
 //   [login addTarget:self action:@selector(backPw:) forControlEvents:UIControlEventTouchUpInside];//点击登录所传的事件
    [self.view addSubview:login];
     self.login.enabled = NO;
    self.login = login;
    
    [login mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(bgPicture.mas_centerX);
        make.top.equalTo(_passWord.mas_bottom).with.offset(50);
        make.width.equalTo(@130);
        make.height.equalTo(@40);
    }];
#pragma mark:1.7导航设置
    self.navigationItem.title=@"登录界面";
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"取消" style:UIBarButtonItemStyleDone target:self action:@selector(cancelLoginView)];
    
    //文本框的输入状态获取
    [_userName addTarget:self action:@selector(LogintextChange) forControlEvents:UIControlEventEditingChanged];
    //    [_identifyField addTarget:self action:@selector(textChange) forControlEvents:(UIControlEventEditingChanged)];
    [_passWord addTarget:self action:@selector(LogintextChange) forControlEvents:(UIControlEventEditingChanged)];
   
}

-(void)LogintextChange
{
    //  当输入框都不为空才能点击按钮；进行提交
    if(_userName.text.length!=0&& _passWord.text.length!=0)
    {
        
        [self.login setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        
        [self.login setBackgroundColor:[UIColor colorWithRed:39/255.0 green:124/255.0 blue:255/255.0 alpha:0.75]];
        self.login.enabled = YES;
        //确认添加按钮的点击事件
        [self.login addTarget:self action:@selector(backPw:) forControlEvents:UIControlEventTouchUpInside];
    }
}

-(void)cancelLoginView{
     [SVProgressHUD dismiss];
     [self dismissViewControllerAnimated:YES completion:nil];
   
}
-(void)dismissKeyboard {
    [self.view endEditing:YES];
    [self.passWord resignFirstResponder];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation {
    return YES;
}

#pragma mark:2.点击登录响应的事件
-(void)backPw:(UIButton*)sender
{
    
    
    if(sender.selected) return;
    sender.selected=YES;

      [SVProgressHUD showWithStatus:@"玩命加载中..."];
    
    LoginServiceImplSoapBinding * binding = [ [LoginServiceImpl LoginServiceImplSoapBinding]initWithAddress:BSURL];
    
    binding.logXMLInOut = YES;
    
    tns1_login * request = [[tns1_login alloc] init];
    
    request.userName=self.userName.text;
    request.password=self.passWord.text;
    
    NSLog(@"request.userName=%@",request.userName);
    NSLog(@"request.password=%@",request.password);
//    request.userName = self.userName.text;
//    request.password = self.passWord.text;
//    
    LoginServiceImplSoapBindingResponse * response = [binding loginUsingParameters:request];
    NSString * resultStr = [[NSString alloc] init];
    for (id mine in response.bodyParts) {
        if ([mine isKindOfClass:[tns1_loginResponse class]]) {
            NSLog(@"输出结果：%@", [mine return_]);
            resultStr = [mine return_];
        }
    }
    
    [self dictionaryWithJsonString:resultStr];//  string->dict
    
    NSString *str = [_dict objectForKey:@"status"];
    NSString *strerror = [_dict objectForKey:@"errmsg"];
    NSLog(@"str = %@",str);

    if (self.userName.text.length>0&&self.passWord.text.length>0) {
    
    //  登录成功
    if ([str isEqualToString:@"0"]) {
        
         [self dismissSVP];
        //  [self.view setHidden:YES];
        [self savaDate];
        [self getDate];
        NSLog(@"登录成功");
    } else {
        if (str==NULL) {
             [SVProgressHUD dismiss];
            UIAlertView *alter = [[UIAlertView alloc]initWithTitle:nil message:@"当前网络不可用,请检查后重试" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
            [alter show];
        }else{
             [SVProgressHUD dismiss];
        UIAlertView *alter = [[UIAlertView alloc]initWithTitle:nil message:strerror delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
        [alter show];
        }
        
      //  [self clickButton];
      //  NSLog(@"用户名或者密码错误");
    }
}//else{
    
//[self clickEmptyButton];
  //
  //   NSLog(@"用户名或者密码为空");
 //   }
    
    [self performSelector:@selector(clickLogintimeEnough) withObject:nil afterDelay:2.0]; //2秒后又可以处理点击事件了
    
}

-(void)clickLogintimeEnough{
    
    self.login.selected = NO;
}

#pragma  mark 字符解析
// 将json字符串转换成字典
-(NSDictionary *)dictionaryWithJsonString:(NSString *)jsonString {
    if (jsonString == nil) {
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

#pragma mark 点击注册按钮
-(void)forRegister:(UIButton*)button
{
     [SVProgressHUD dismiss];
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithTitle:@"登录" style:UIBarButtonItemStylePlain target:nil action:nil];
    RegisterViewController *pushview=[[RegisterViewController alloc]init];
    self.navigationItem.backBarButtonItem = item;
    [self.navigationController pushViewController:pushview animated:YES ];
}

-(void)forgetpassword:(UIButton*)button
{
     [SVProgressHUD dismiss];
    ForgetPasswordViewController *pushview=[[ForgetPasswordViewController alloc]init];
    [self.navigationController pushViewController:pushview animated:YES];
}
//  弹出提示框
-(void)clickButton{
     [SVProgressHUD dismiss];
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"用户名或密码错误" message:nil preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *determine = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        //  添加方法
    }];
    
    [alert addAction:determine];
    //  [alert addAction:destory];
    [self presentViewController:alert animated:YES completion:nil];
}
//  弹出提示框
-(void)clickEmptyButton{
    
     [SVProgressHUD dismiss];
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"用户名或密码不能为空" message:nil preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *determine = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        //  添加方法
    }];
    
     [alert addAction:determine];
    //  [alert addAction:destory];
    [self presentViewController:alert animated:YES completion:nil];
}

#pragma mark 登录成功
//  用户名和密码归档
-(void)savaDate{
    TLSaveData *date = [[TLSaveData alloc]init];
    date.userName = self.userName.text;
    date.passWord = self.passWord.text;
//    //    拿到temp路径
//    NSString *tempath = NSTemporaryDirectory();
//    //    归档文件格式
//    NSString *filepath = [tempath stringByAppendingString:@"Bus_Station.date"];
//    //    进行归档
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    //登陆成功后把用户名和密码存储到UserDefault
    [userDefaults setObject:date.userName forKey:@"userName"];
    [userDefaults setObject:date.passWord forKey:@"passWord"];
    [userDefaults synchronize];
}
//  查看保存的密码
-(void)getDate{
    
//    NSString *tempath = NSTemporaryDirectory();
//    
//    NSString *filrpath = [tempath stringByAppendingString:@"Bus_Station.date"];
//    
//    TLSaveData *t = [NSKeyedUnarchiver unarchiveObjectWithFile:filrpath];
//      NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
//    NSLog(@"UserName = %@,PassWord = %@",t.userName,t.passWord);
    NSString *docPath =NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).firstObject;
    NSLog(@"%@",docPath);

}

- (void)showWithStatus {
    [SVProgressHUD showWithStatus:@"玩命加载中..."];
    
       [self performSelector:@selector(dismissSVP) withObject:nil afterDelay:1.0];
    
}
- (void)dismissSVP {
    //  显示登录加载消失
     [SVProgressHUD dismiss];
    //  登录窗口消失
    
        [self dismissViewControllerAnimated:YES completion:nil];

}

- (void)dismissSuccess {
    [SVProgressHUD showSuccessWithStatus:@"登录成功!"];
}

- (void)dismissError {
    [SVProgressHUD showErrorWithStatus:@"登录失败"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
//        #pragma mark:2.2登录失败界面设置
//        /*背景图片设置*/
//        UIImageView *bgPicture = [[UIImageView alloc]initWithFrame:self.view.bounds];
//        bgPicture.image = [UIImage imageNamed:@"背景.jpg"];
//        bgPicture.tintColor=[UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:1];
//        [self.view addSubview:bgPicture];
//    UIView *view=[[UIView alloc] initWithFrame:self.view.bounds];
//view.backgroundColor=[UIColor colorWithRed:122/255.0 green:128/255.0 blue:138/255.0 alpha:0.5];
//    [self.view addSubview:view];

//        /*标题设置*/
//        UILabel *title=[[UILabel alloc]init];
//        title.text=@"巴士驿站";
//        title.font=[UIFont systemFontOfSize:30];
//        title.textColor=[UIColor colorWithRed:82/255.0 green:83/255.0 blue:85/255.0 alpha:1];
//        title.textAlignment=NSTextAlignmentCenter;
//        [self.view addSubview:title];
//        [title mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.left.equalTo(self.view).with.offset(10);
//            make.right.equalTo(self.view).with.offset(-10);
//            make.bottom.equalTo(bgPicture.mas_centerX).with.offset(70);
//        }];
//        /*用户名和密码设置*/
//        self.userName=[[UITextField alloc]init];
//        self.userName.borderStyle=UITextBorderStyleRoundedRect;
//        self.userName.placeholder=@"用户名";
//        self.userName.textColor=[UIColor colorWithRed:144/255.0 green:146/255.0 blue:148/255.0 alpha:1];
//        [self.userName setBackgroundColor:[UIColor colorWithRed:167/255.0 green:185/255.0 blue:205/255.0 alpha:1]];
//        [self.view addSubview:self.userName];
//        [self.userName mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.top.equalTo(bgPicture.mas_centerX).with.offset(100);
//            make.left.equalTo(self.view).with.offset(50);
//            make.right.equalTo(self.view).with.offset(-50);
//            make.height.mas_equalTo(40);
//        }];
//        self.passWord=[[UITextField alloc]init];
//        self.passWord.borderStyle=UITextBorderStyleRoundedRect;
//        self.passWord.placeholder=@"密    码";
//        self.passWord.secureTextEntry=YES;
//        self.passWord.textColor=[UIColor colorWithRed:144/255.0 green:146/255.0 blue:148/255.0 alpha:1];
//        [self.passWord setBackgroundColor:[UIColor colorWithRed:167/255.0 green:185/255.0 blue:205/255.0 alpha:1]];
//        [self.view addSubview:self.passWord];
//        [self.passWord mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.top.equalTo(self.userName.mas_bottom);
//            make.left.equalTo(self.view).with.offset(50);
//            make.right.equalTo(self.view).with.offset(-50);
//            make.height.mas_equalTo(40);
//        }];
//        /*忘记密码提示框设置*/
//        UILabel *prompt=[[UILabel alloc]init];
//        prompt.text=@"请填写正确的用户名和密码";
//        prompt.textColor=[UIColor colorWithRed:210/255.0 green:1/255.0 blue:1/255.0 alpha:1];
//        prompt.textAlignment=NSTextAlignmentCenter;
//        prompt.backgroundColor=[UIColor whiteColor];
//        [self.view addSubview:prompt];
//        [prompt mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.bottom.equalTo(self.userName.mas_top).with.offset(5);
//            make.left.equalTo(self.view).with.offset(50);
//            make.right.equalTo(self.view).with.offset(-50);
//            make.height.mas_equalTo(30);
//        }];
//        /*登录设置*/
//        UIButton *login=[[UIButton alloc]init];
//        [login.layer setMasksToBounds:YES];
//        [login.layer setCornerRadius:5.0];
//        [login setTitle:@"登   录" forState:UIControlStateNormal];
//        [login setTitleColor:[UIColor colorWithRed:116/255.0 green:125/255.0 blue:135/255.0 alpha:1] forState:UIControlStateNormal];
//        [login setBackgroundColor:[UIColor colorWithRed:167/255.0 green:185/255.0 blue:205/255.0 alpha:1]];
//        [login addTarget:self action:@selector(backPw:) forControlEvents:UIControlEventTouchUpInside];//点击登录所传的事件
//        [self.view addSubview:login];
//        [login mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.centerX.equalTo(bgPicture.mas_centerX);
//            make.centerY.equalTo(bgPicture.mas_centerY).with.offset(110);
//            make.width.mas_equalTo(80);
//        }];
//        UINavigationBar *navigationBar = [[UINavigationBar alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 44)];
//        navigationBar.backgroundColor=[UIColor clearColor];
//        [self.view addSubview:navigationBar];

//-(void)loginServiceRequest{
//
//    LoginServiceImplSoapBinding * binding = [ [LoginServiceImpl LoginServiceImplSoapBinding]initWithAddress:BSURL];
//
//    binding.logXMLInOut = YES;
//
//    tns1_login * request = [[tns1_login alloc] init];
//
//    request.userName = self.userName.text;
//    request.password = self.passWord.text;
//
//    LoginServiceImplSoapBindingResponse * response = [binding loginUsingParameters:request];
//    NSString * resultStr = [[NSString alloc] init];
//    for (id mine in response.bodyParts) {
//        if ([mine isKindOfClass:[tns1_loginResponse class]]) {
//            NSLog(@"输出结果：%@", [mine return_]);
//            resultStr = [mine return_];
//        }
//    }
//
//}


