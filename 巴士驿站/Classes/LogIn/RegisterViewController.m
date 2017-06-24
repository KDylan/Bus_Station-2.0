//
//  RegisterViewController.m
//  LUIViewController
//
//  Created by Maominghui on 16/9/20.
//  Copyright © 2016年 Oran Wu. All rights reserved.
//

#import "RegisterViewController.h"
#import "ForgetPasswordTwoViewController.h"
//#import "Masonry.h"
//#import "FMDB.h"
//#import "IQKeyboardReturnKeyHandler.h"
//#define BSURL @"http://bashiyizhan.51vip.biz/CoachBookingSystem/userService"
@interface RegisterViewController ()<UITextFieldDelegate/*这里引入UITextField 需要的委托*/,UITextViewDelegate/*这里引入UITextView 需要的委托*/>
//
@property (nonatomic,strong) UITextField *numField;       //用户名
//@property (nonatomic,strong) UITextField *identifyField;  //验证码
@property (nonatomic,strong) UITextField *passwordField;  //密码
@property (nonatomic,strong) UITextField *confirmField;   //确认密码
//@property (nonatomic,strong) UIButton *gainButton;      //获取验证码
@property (nonatomic,strong) UIButton *registerButton;   //注册
@property(nonatomic,strong)NSDictionary *dict;//  json字符转字典


@end

@implementation RegisterViewController

/*
 -(void)tapGainButton:(UIButton *)sender
 {
 //获取验证码倒计时
 __block int timeout=30; //倒计时时间
 dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
 dispatch_source_t _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0,queue);
 dispatch_source_set_timer(_timer,dispatch_walltime(NULL, 0),1.0*NSEC_PER_SEC, 0); //每秒执行
 dispatch_source_set_event_handler(_timer, ^{
 if(timeout<=0){ //倒计时结束，关闭
 dispatch_source_cancel(_timer);
 dispatch_async(dispatch_get_main_queue(), ^{
 //设置界面的按钮显示 根据自己需求设置
 _gainButton.titleLabel.font = [UIFont systemFontOfSize:22];
 [_gainButton setTitle:@"获取验证码" forState:UIControlStateNormal];
 _gainButton.userInteractionEnabled = YES;
 });
 }else{
 int seconds = timeout % 60;
 NSString *strTime = [NSString stringWithFormat:@"%.2d", seconds];
 dispatch_async(dispatch_get_main_queue(), ^{
 //设置界面的按钮显示 根据自己需求设置
 [UIView beginAnimations:nil context:nil];
 [UIView setAnimationDuration:1];
 _gainButton.titleLabel.font = [UIFont systemFontOfSize:18];
 [_gainButton setTitle:[NSString stringWithFormat:@"%@秒后重新发送",strTime] forState:UIControlStateNormal];
 [UIView commitAnimations];
 //按钮不可按
 _gainButton.userInteractionEnabled = NO;
 });
 timeout--;
 }
 });
 dispatch_resume(_timer);
 }*/

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationItem.title = @"注册";
    // Do any additional setup after loading the view.
    
    //防止键盘挡住输入框
//    IQKeyboardReturnKeyHandler *returnKeyHandler= [[IQKeyboardReturnKeyHandler alloc]init];
    
//    returnKeyHandler.lastTextFieldReturnKeyType=UIReturnKeyNext;
    
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:self.view.bounds];
    imageView.image = [UIImage imageNamed:@"背景.jpg"];
    imageView.backgroundColor=[UIColor colorWithRed:145/255.0 green:143/255.0 blue:143/255.0 alpha:0.85];
    [self.view addSubview:imageView];
    
        _numField = [[UITextField alloc] init];
        _numField.textColor = [UIColor colorWithRed:112/255.0 green:108/255.0 blue:108/255.0 alpha:1.0];
        _numField.backgroundColor = [UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:0.75];
        _numField.borderStyle = UITextBorderStyleNone;         //设置边框类型
        _numField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;//文字内容 垂直居中
        _numField.placeholder = @"  手机号";//设置默认提示文字
        _numField.font = [UIFont systemFontOfSize:17];//30px转成磅为单位＝22磅＝二号
        [self.view addSubview:_numField];
    //  切圆角
    _numField.layer.masksToBounds = YES;
    _numField.layer.cornerRadius = 8;
    
    
      [_numField mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.view).offset(30);
            make.right.equalTo(self.view).offset(-30);
            make.top.equalTo(self.view).offset(104);
            make.height.equalTo(@45);
    
        }];
    //
    //    _identifyField = [[UITextField alloc] init];
    //    _identifyField.textColor = [UIColor colorWithRed:112/255.0 green:108/255.0 blue:108/255.0 alpha:1.0];
    //    _identifyField.backgroundColor = [UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:0.75];
    //    _identifyField.borderStyle = UITextBorderStyleNone;         //设置边框类型
    //    _identifyField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;//文字内容 垂直居中，此为UIControl的属性
    //    _identifyField.placeholder = @"验证码";//设置默认提示文字
    //    _identifyField.font = [UIFont systemFontOfSize:22];//30px转成磅为单位＝22磅＝二号
    //    [self.view addSubview:_identifyField];
    //    [_identifyField mas_makeConstraints:^(MASConstraintMaker *make) {
    //        make.left.equalTo(_numField.mas_left);
    //        make.right.equalTo(self.view).with.offset(-164);
    //        make.top.equalTo(_numField.mas_bottom).with.offset(8);
    //        make.height.mas_equalTo(30);
    //
    //    }];
    
    _passwordField = [[UITextField alloc] init];
    _passwordField.textColor = [UIColor colorWithRed:112/255.0 green:108/255.0 blue:108/255.0 alpha:1.0];
    _passwordField.backgroundColor = [UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:0.75];
    _passwordField.borderStyle = UITextBorderStyleNone;         //设置边框类型
    _passwordField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;//文字内容 垂直居中，此为UIControl的属性
    _passwordField.placeholder = @"  密   码";//设置默认提示文字
    _passwordField.font = [UIFont systemFontOfSize:17];//30px转成磅为单位＝22磅＝二号
    _passwordField.secureTextEntry = YES; //密码
    [self.view addSubview:_passwordField];
    //  切圆角
    _passwordField.layer.masksToBounds = YES;
    _passwordField.layer.cornerRadius = 8;
    

    [_passwordField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_numField.mas_left);
        make.right.equalTo(_numField.mas_right);
        make.top.equalTo(_numField.mas_bottom).offset(15);
        // make.top.equalTo(_identifyField.mas_bottom).with.offset(8);
        make.height.equalTo(@45);
        
    }];
    
    _confirmField = [[UITextField alloc] init];
    _confirmField.textColor = [UIColor colorWithRed:112/255.0 green:108/255.0 blue:108/255.0 alpha:1.0];
    _confirmField.backgroundColor = [UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:0.75];
    _confirmField.borderStyle = UITextBorderStyleNone;         //设置边框类型
    _confirmField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;//文字内容 垂直居中，此为UIControl的属性
    _confirmField.placeholder = @"  确认密码";//设置默认提示文字
    _confirmField.font = [UIFont systemFontOfSize:17];//30px转成磅为单位＝22磅＝二号
    _confirmField.secureTextEntry = YES; //密码
    
    //  切圆角
    _confirmField.layer.masksToBounds = YES;
    _confirmField.layer.cornerRadius = 8;
    
    [self.view addSubview:_confirmField];
    [_confirmField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_passwordField.mas_left);
        make.right.equalTo(_passwordField.mas_right);
        make.top.equalTo(_passwordField.mas_bottom).offset(15);
        // make.top.equalTo(_identifyField.mas_bottom).with.offset(8);
        make.height.equalTo(@45);
        
    }];
    
    //    _gainButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    //    [_gainButton setBackgroundColor:[UIColor colorWithRed:235/255.0 green:166/255.0 blue:33/255.0 alpha:1.0]];
    //    [_gainButton setTitle:@"获取验证码" forState:UIControlStateNormal];
    //    [_gainButton setTitleColor:[UIColor colorWithRed:112/255.0 green:108/255.0 blue:108/255.0 alpha:1.0] forState:UIControlStateNormal];
    //    _gainButton.titleLabel.font = [UIFont systemFontOfSize:22];
    //    [self.view addSubview:_gainButton];
    //    [_gainButton mas_makeConstraints:^(MASConstraintMaker *make) {
    //        make.left.equalTo(_identifyField.mas_right).with.offset(5);
    //        make.right.equalTo(self.view).with.offset(-20);
    //        make.top.equalTo(_numField.mas_bottom).with.offset(8);
    //        make.height.mas_equalTo(30);
    //    }];
    //
    //    //设置按钮的监听，即点击按钮时去执行的方法 监听方法只能接UIbutton这一个参数
    //    [_gainButton addTarget:self action:@selector(tapGainButton:) forControlEvents:UIControlEventTouchUpInside];
    
    _registerButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [_registerButton setBackgroundColor:[UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:0.75]];
    [_registerButton setTitle:@"注     册" forState:UIControlStateNormal];
    [_registerButton setTitleColor:[UIColor colorWithRed:0 green:0 blue:0 alpha:0.5] forState:UIControlStateNormal];
    _registerButton.titleLabel.font = [UIFont systemFontOfSize:20];
   
  //  _registerButton.enabled = NO;
   
    //  切圆角
    _registerButton.layer.masksToBounds = YES;
    _registerButton.layer.cornerRadius = 10;
    
    [self.view addSubview:_registerButton];
    
    [_registerButton mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.equalTo(self.view).with.offset(90);
//        make.right.equalTo(self.view).with.offset(-90);
//        make.top.equalTo(_confirmField.mas_bottom).offset(40);
//        make.height.equalTo(@40);
        make.centerX.equalTo(self.view);
        make.top.equalTo(_confirmField.mas_bottom).with.offset(40);
        make.width.equalTo(@130);
        make.height.equalTo(@40);
    }];
    //文本框的输入状态获取
        [_numField addTarget:self action:@selector(textChange) forControlEvents:UIControlEventEditingChanged];
    //    [_identifyField addTarget:self action:@selector(textChange) forControlEvents:(UIControlEventEditingChanged)];
    [_passwordField addTarget:self action:@selector(textChange) forControlEvents:(UIControlEventEditingChanged)];
    [_confirmField addTarget:self action:@selector(textChange) forControlEvents:(UIControlEventEditingChanged)];
//    //注册按钮设置为不能按的状态
//    _registerButton.enabled = NO;
//    
    
}
-(void)textChange
{
    //  当四个输入框都不为空才能点击按钮；进行提交
    if(_numField.text.length!=0&&/* _identifyField.text.length!=0&&*/_passwordField.text.length!=0&&_confirmField.text.length!=0)
    {
        _registerButton.enabled = YES ;  //  按钮可点击
        
       [_registerButton setTitleColor:[UIColor colorWithRed:0 green:0 blue:0 alpha:1.0] forState:UIControlStateNormal];
        
        [_registerButton setTitleColor:[UIColor colorWithRed:39/255.0 green:124/255.0 blue:255/255.0 alpha:0.75] forState:UIControlStateNormal];
        
        //确认添加按钮的点击事件
        //设置按钮的监听，即点击按钮时去执行的方法 监听方法只能接UIbutton这一个参数
        [_registerButton addTarget:self action:@selector(tapRegisterButton:) forControlEvents:UIControlEventTouchUpInside];
    }
}
-(void)tapRegisterButton:(UIButton *)sender
{
    if (self.numField.text.length==0) {
        [SVProgressHUD showInfoWithStatus:@"请输入手机号"];
        [self dismiss];
    }else if (self.numField.text.length!=11){
        [SVProgressHUD showInfoWithStatus:@"请输入正确的手机号"];
        [self dismiss];
    }else{
        // 点击OK返回上一界面
        [self requestService];
    }
  
}
-(void)requestService{
    
    NSString *password = _passwordField.text;
    NSString *confirm = _confirmField.text;
    
    LoginServiceImplSoapBinding * binding = [[LoginServiceImplSoapBinding alloc] initWithAddress:BSURL];
    
    tns1_register * request = [[tns1_register alloc] init];
   //  string- > nsnumber
    NSNumberFormatter *number = [[NSNumberFormatter alloc]init];
    
  id numberField = [number numberFromString:_numField.text];
    
    request.userRole = @"user";
    request.userName = _numField.text;
    request.userPwd = _confirmField.text;
    request.userEmail = @"null";
    request.userID = _numField.text;
    request.userIDCardType = @"身份证";
    request.userIDCardNo =@0;
    request.userAvatorURL = @"null";
    request.userPhoneNumber = numberField;
    request.userCurrentLocation = @"null";
    
    NSLog(@"request.userID=%@",request.userID);
    
    LoginServiceImplSoapBindingResponse * response = [binding registerUsingParameters:request];
    NSString * resultStr = [[NSString alloc] init];
    for (id mine in response.bodyParts) {
        if ([mine isKindOfClass:[tns1_registerResponse class]]) {
            
            NSLog(@"输出注册结果：%@", [mine return_]);
            resultStr = [mine return_];
        }
    }
    [self dictionaryWithJsonString:resultStr];//  string->dict
    
    NSString *str = [_dict objectForKey:@"status"];
    NSString *strerror = [_dict objectForKey:@"errmsg"];
    NSLog(@"str = %@",str);
    
    if (str==NULL) {
        UIAlertView *alter = [[UIAlertView alloc]initWithTitle:nil message:@"当前网络不可用,请检查后重试" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
        [alter show];
    }else if ([password isEqualToString:confirm]) {
        
        if([str isEqualToString:@"0"]){
            
            [self clickButton];
            NSLog(@"注册成功");
        }else{
            
            UIAlertView *alter = [[UIAlertView alloc]initWithTitle:nil message:strerror delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
            [alter show];
        }
    }else {
        UIAlertView *alert2 = [[UIAlertView alloc]initWithTitle:nil message:@"请确认密码一致" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
        [alert2 show];
    }
    NSLog(@"request.userName=%@",request.userName);
    NSLog(@"request.userPwd=%@",request.userPwd);
}
//  弹出注册成功提示框
-(void)clickButton{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"注册成功" message:nil preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *determine = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
       
        [self.navigationController popViewControllerAnimated:YES];
        
    }];
    [alert addAction:determine];
    //  [alert addAction:destory];
    [self presentViewController:alert animated:YES completion:nil];
}


////  获取用户唯一ID
//-(NSString *) gen_uuid
//{
//    CFUUIDRef uuid_ref = CFUUIDCreate(NULL);
//    CFStringRef uuid_string_ref= CFUUIDCreateString(NULL, uuid_ref);
//    CFRelease(uuid_ref);
//    NSString *uuid = [NSString stringWithString:(__bridge NSString*)uuid_string_ref];
//    CFRelease(uuid_string_ref);
//    return uuid;
//}

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
-(void)dismiss{
    //  1s后消失
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [SVProgressHUD dismiss];
    });
    
}

@end
