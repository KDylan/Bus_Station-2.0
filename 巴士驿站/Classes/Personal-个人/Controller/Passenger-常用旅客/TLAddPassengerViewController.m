//
//  TLAddPassengerViewController.m
//  巴士驿站
//
//  Created by Maominghui on 16/7/15.
//  Copyright © 2016年 Edge. All rights reserved.
//

#import "TLAddPassengerViewController.h"

#import "TLUsers.h"
#import "Masonry.h"
#import "PassengerServiceImplSvc.h"
#import "PassengerServiceImplSvc.h"

@interface TLAddPassengerViewController ()<UITextFieldDelegate>
{
    NSString *rememberText;  //存放证件号码
}
@property (nonatomic,strong) UITextField *nameText ;    //姓名
@property (nonatomic,strong) UITextField *paperText ;   //证件号码
@property (nonatomic,strong) UITextField *phoneText ;  //电话号码
@property (nonatomic,strong) UIButton *addButton ;     //添加旅客按钮
@property (nonatomic,strong) UITableViewCell *cell ; //证件类型（覆盖）
@property (nonatomic,strong) UIButton *paperButton ;    //证件类型
@property(nonatomic,strong)NSDictionary *dict;//  json字符转字典
@property(nonatomic,strong)TLUsers *passengersUserID;//  json字符转字典
@end

@implementation TLAddPassengerViewController

//证件类型的点击选择事件
-(void)tapPaperButton:(UIButton *)sender
{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"选择证件类型" message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    
    UIAlertAction *action1 = [UIAlertAction actionWithTitle:@"身份证" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [self  cardID];
    }];
    
    UIAlertAction *action2 = [UIAlertAction actionWithTitle:@"港澳通行证" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [self hKMLaissez];
    }];
    
    UIAlertAction *action3 = [UIAlertAction actionWithTitle:@"台湾通行证" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [self taiWan];
    }];
    
    UIAlertAction *action4 = [UIAlertAction actionWithTitle:@"护照" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [self passport];
    }];
    
    UIAlertAction *destory = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
    }];
    
    [alert addAction:action1];
    [alert addAction:action2];
    [alert addAction:action3];
    [alert addAction:action4];
    
    [alert addAction:destory];
    
    [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:alert animated:YES completion:nil];
}
//获取证件类型并赋值给cell
- (void)cardID {
    _cell.detailTextLabel.text = @"身份证";
}

- (void)hKMLaissez {
    _cell.detailTextLabel.text = @"港澳通行证";
}

- (void)taiWan {
    _cell.detailTextLabel.text = @"台湾通行证";
}

- (void)passport {
    _cell.detailTextLabel.text = @"护照";
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"添加常用旅客";
    
    UIView *view1=[[UIView alloc]initWithFrame:self.view.bounds];
    [self.view addSubview:view1];
    view1.backgroundColor=[UIColor colorWithRed:199/255.0 green:200/255.0 blue:202/255.0 alpha:1];
    
    //label界面设计
    UILabel *Lable = [[UILabel alloc]init];
    Lable.backgroundColor=[UIColor whiteColor];
    [view1 addSubview:Lable];
    Lable.layer.cornerRadius=8;
    Lable.clipsToBounds=YES;
    [Lable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(view1.mas_centerY).with.offset(-25);
        make.left.equalTo(view1.mas_left).with.offset(15);
        make.right.equalTo(view1.mas_right).with.offset(-15);
        make.top.equalTo(view1.mas_top).with.offset(90);
    }];
    
    UILabel *nameLable = [[UILabel alloc]init];
    [view1 addSubview:nameLable];
    nameLable.text=@"姓名：";
    nameLable.font=[UIFont systemFontOfSize:20];
    
    UILabel *paperLable = [[UILabel alloc]init];
    [view1 addSubview:paperLable];
    paperLable.text=@"证件号码：";
    paperLable.font=[UIFont systemFontOfSize:20];
    
    UILabel *phoneLable = [[UILabel alloc]init];
    [view1 addSubview:phoneLable];
    phoneLable.text=@"手机号码：";
    phoneLable.font=[UIFont systemFontOfSize:20];
    
    //证件类型 按钮覆盖一个单元格
    _cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"Cell"];
    [Lable addSubview:_cell];
    _cell.textLabel.text = @"证件类型：";
    _cell.textLabel.font=[UIFont systemFontOfSize:20];
    _cell.detailTextLabel.text = @"身份证";
    _cell.detailTextLabel.font=[UIFont systemFontOfSize:18];
    //设置cell右边的小箭头
    _cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
    //证件类型选择按钮
    _paperButton=[UIButton buttonWithType:UIButtonTypeRoundedRect];;
    [view1 addSubview:_paperButton];
    [nameLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(Lable.mas_left).with.offset(15);
        make.right.equalTo(Lable.mas_centerX).with.offset(-20);
        make.top.equalTo(Lable.mas_top);
        make.height.equalTo(Lable).multipliedBy(0.25f);
    }];
    
    [_cell mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(Lable.mas_left).with.offset(2);
        make.right.equalTo(Lable.mas_right).with.offset(-25);
        make.top.equalTo(nameLable.mas_bottom);
        make.height.equalTo(Lable).multipliedBy(0.25f);
    }];
    [paperLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(nameLable.mas_left);
        make.right.equalTo(Lable.mas_right);
        make.top.equalTo(_cell.mas_bottom);
        make.height.equalTo(Lable).multipliedBy(0.25f);
    }];
    
    [phoneLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(nameLable.mas_left);
        make.right.equalTo(Lable.mas_right);
        make.bottom.equalTo(Lable.mas_bottom);
        make.height.equalTo(Lable).multipliedBy(0.25f);
    }];
    [_paperButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(nameLable.mas_left);
        make.right.equalTo(Lable.mas_right);
        make.top.equalTo(nameLable.mas_bottom);
        make.height.equalTo(Lable).multipliedBy(0.25f);
    }];
    
    //证件类型按钮的监听事件
    [_paperButton addTarget:self action:@selector(tapPaperButton:) forControlEvents:UIControlEventTouchUpInside];
    
    //姓名文本框
    _nameText = [[UITextField alloc] init];
    _nameText.textColor = [UIColor colorWithRed:112/255.0 green:108/255.0 blue:108/255.0 alpha:1.0];  //字体颜色
    _nameText.backgroundColor = [UIColor colorWithRed:234/255.0 green:234/255.0 blue:234/255.0 alpha:1];
    _nameText.borderStyle = UITextBorderStyleRoundedRect;         //设置边框类型
    _nameText.font = [UIFont systemFontOfSize:18];//30px转成磅为单位＝22磅＝二号
    [view1 addSubview:_nameText];
    [_nameText mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(Lable.mas_centerX).with.offset(-20);
        make.right.equalTo(Lable.mas_right).with.offset(-20);
        make.centerY.equalTo(nameLable.mas_centerY);
    }];
    
    //证件号码文本框
    _paperText = [[UITextField alloc] init];
    _paperText.textColor = [UIColor colorWithRed:112/255.0 green:108/255.0 blue:108/255.0 alpha:1.0];
    _paperText.backgroundColor = [UIColor colorWithRed:234/255.0 green:234/255.0 blue:234/255.0 alpha:1];
    _paperText.borderStyle = UITextBorderStyleRoundedRect;         //设置边框类型
    _paperText.font = [UIFont systemFontOfSize:18];//30px转成磅为单位＝22磅＝二号
    [view1 addSubview:_paperText];
    [_paperText mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(Lable.mas_centerX).with.offset(-20);
        make.right.equalTo(Lable.mas_right).with.offset(-20);
        make.centerY.equalTo(paperLable.mas_centerY);
    }];
    
    //手机号文本框
    _phoneText = [[UITextField alloc] init];
    _phoneText.textColor = [UIColor colorWithRed:112/255.0 green:108/255.0 blue:108/255.0 alpha:1.0];
    _phoneText.backgroundColor = [UIColor colorWithRed:234/255.0 green:234/255.0 blue:234/255.0 alpha:1];
    _phoneText.borderStyle = UITextBorderStyleRoundedRect;         //设置边框类型
    _phoneText.font = [UIFont systemFontOfSize:18];//30px转成磅为单位＝22磅＝二号
    [view1 addSubview:_phoneText];
    [_phoneText mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(Lable.mas_centerX).with.offset(-20);
        make.right.equalTo(Lable.mas_right).with.offset(-20);
        make.centerY.equalTo(phoneLable.mas_centerY);
    }];
    
    //证件号码文本框
    [_paperText setDelegate:self];
    //文本输入事件：将中间字符变成“ ＊ ”
   // [_paperText addTarget:self action:@selector(paperTextHaveChange:) forControlEvents:UIControlEventAllEditingEvents];
    //初始化 存放证件号码
   // rememberText = @"";
    
    //确认添加按钮
    _addButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [_addButton setBackgroundColor:[UIColor colorWithRed:0.9581 green:0.9581 blue:0.9581 alpha:1.0]];
    [_addButton setTitle:@"确定添加" forState:UIControlStateNormal];
    [_addButton setTitleColor:[UIColor colorWithRed:0.276 green:0.557 blue:0.9989 alpha:1.0] forState:UIControlStateNormal];
    _addButton.titleLabel.font = [UIFont systemFontOfSize:21];
     [_addButton.layer setCornerRadius:5.0]; //设置按钮矩圆角半径
    [view1 addSubview:_addButton];
    
    [_addButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(Lable.mas_centerX);
        make.top.equalTo(view1.mas_centerY).with.offset(10);
        make.height.mas_equalTo(40);
       // make.width.mas_equalTo(200);
        make.left.equalTo(Lable.mas_left);
         make.right.equalTo(Lable.mas_right);
        
    }];
    
    //文本框的输入状态获取
    [_nameText addTarget:self action:@selector(textChange) forControlEvents:UIControlEventEditingChanged];
    [_paperText addTarget:self action:@selector(textChange) forControlEvents:(UIControlEventEditingChanged)];
    [_phoneText addTarget:self action:@selector(textChange) forControlEvents:(UIControlEventEditingChanged)];
    
    //按钮设置为不能按的状态
    _addButton.enabled = NO;
}

-(void)textChange
{
    //  当三个输入框都不为空才能点击按钮；进行提交
    if(_nameText.text.length!=0&& _phoneText.text.length!=0&&_paperText.text.length!=0)
    {
        _addButton.enabled = YES ;  //  按钮可点击
    
        [_addButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];

        [_addButton setBackgroundColor:[UIColor colorWithRed:39/255.0 green:124/255.0 blue:255/255.0 alpha:0.75]];
        
        //确认添加按钮的点击事件
        [_addButton addTarget:self action:@selector(tapAddButton:) forControlEvents:UIControlEventTouchUpInside];
    }
}

//确认添加按钮的点击事件,遵循代理
-(void)tapAddButton:(UIButton *)sender
{
    
 
//
//    [self.navigationController popViewControllerAnimated:YES];
//    [[self class] cancelPreviousPerformRequestsWithTarget:self selector:@selector(addPassengerRequestService) object:sender];
//    [self performSelector:@selector(addPassengerRequestService) withObject:sender afterDelay:10.0f];
    [self addPassengerRequestService];
//    UIAlertController *alter = [UIAlertController alertControllerWithTitle:@"提示" message:@"添加成功" preferredStyle:UIAlertControllerStyleAlert];
//    [alter addAction: [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
//        [self.navigationController popViewControllerAnimated:YES];
//    }] ];
//    [self presentViewController:alter animated:YES completion:nil];
    
}

-(void)addPassengerRequestService
{
    
    PassengerServiceImplSoapBinding *addPassengerBinding=[[ PassengerServiceImplSoapBinding alloc]initWithAddress:PassengerServiceBSURL];
    addPassengerBinding.logXMLInOut=YES;
    NSLog(@"--------------------------");
    PassengerTns1_submit *submitPassenger=[[PassengerTns1_submit alloc]init];
    submitPassenger.PassengersUserID=[[NSUserDefaults standardUserDefaults]stringForKey:@"userName"];
    submitPassenger.PassengersName=_nameText.text;
    submitPassenger.PassengersIDType=@"身份证";
    submitPassenger.PassengersIDCardNo=_paperText.text;
    submitPassenger.PassengersPhoneNumber=_phoneText.text;
//    PassengerTns1_submit *submitPassenger=[[PassengerTns1_submit alloc]init];
//    submitPassenger.PassengersUserID=[[NSUserDefaults standardUserDefaults]stringForKey:@"userName"];;
//    submitPassenger.PassengersName=_nameText.text;
//    submitPassenger.PassengersIDType=@"身份证";
//    submitPassenger.PassengersIDCardNo=_paperText.text;
//    submitPassenger.PassengersPhoneNumber=_phoneText.text;
//    NSLog(@"%@",submitPassenger.PassengersUserID);
    PassengerServiceImplSoapBindingResponse *addPassengerResponse=[addPassengerBinding submitUsingParameters:submitPassenger];
    NSString * resultStr = [[NSString alloc] init];
    for (id addPassengerResult in addPassengerResponse.bodyParts) {
        if ([addPassengerResult isKindOfClass:[PassengerTns1_submitResponse class]]) {
            
            NSLog(@"输出添加结果：%@", [addPassengerResult return_]);
            resultStr = [addPassengerResult return_];
        }
    }
    [self dictionaryWithJsonString:resultStr];
    NSString *str = [_dict objectForKey:@"status"];
    NSString *strerror = [_dict objectForKey:@"errmsg"];
    NSLog(@"str = %@",str);
    
    if (str==NULL) {
    
        UIAlertView *alter = [[UIAlertView alloc]initWithTitle:nil message:@"当前网络不可用,请检查后重试" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
       [alter show];
    }else if([str isEqualToString:@"0"])
        
    {
        [self addPassengerSuccess];
        if ([self.delegate respondsToSelector:@selector(addViewController:addUser:)]) {
            TLUsers *Users = [[TLUsers alloc]init];
            Users.PassengersName = self.nameText.text;  //  名字
            Users.PassengersIDCardNo = self.paperText.text;  //  身份证号码
            Users.PassengersPhoneNumber = self.phoneText.text;  //  电话号码
            Users.PassengersIDType = self.cell.detailTextLabel.text; //  证件类型
            NSLog(@"%@",Users.PassengersName);
            NSLog(@"%@",_dict);
            NSLog(@"%@",Users);
           [self.delegate addViewController:self addUser:Users];
            //   NSLog(@"!!_%@",Users.nickName);
        }
        
        NSLog(@"添加成功");
    }else
    {
        UIAlertView *alter = [[UIAlertView alloc]initWithTitle:nil message:strerror delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
        [alter show];
    }
 
}
-(void)addPassengerSuccess
{
    UIAlertController *alter = [UIAlertController alertControllerWithTitle:@"提示" message:@"添加成功" preferredStyle:UIAlertControllerStyleAlert];
        [alter addAction: [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            [self.navigationController popViewControllerAnimated:YES];
        }] ];
        [self presentViewController:alter animated:YES completion:nil];
}
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
    NSLog(@"%@",self.dict);
    if(err) {
        NSLog(@"json解析失败：%@",err);
    }
    return dict;
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    //当用户的光标在姓名的时候，用户按下回车，光标切换到证件号码
    if (textField == _nameText) {
        [_paperText becomeFirstResponder];
    }    //当用户的光标在证件号码的时候，用户按下回车，光标切换到手机号码
    if (textField == _paperText) {
        [_phoneText becomeFirstResponder];
    }
    if (textField == _phoneText) {
        //如果按钮可点击也就是文本框都不为空，调用按钮点击事件，否则继续输入
        if (_addButton.enabled) {
            [self tapAddButton:nil];
        }else{
            [_nameText becomeFirstResponder];
        }
    }
    return YES;
}

//将证件类型文本框内输入的值赋给rememberText
-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    rememberText = [rememberText stringByReplacingCharactersInRange:range withString:string];
    return YES;
}

////当字符串长度大于4 中间的字符都变成＊
//-(void)paperTextHaveChange:(UITextField*)textField
//{
//    if (rememberText.length > 4)
//    {
//        NSMutableString *returnText = [NSMutableString string];
//        [returnText appendString:[rememberText substringToIndex:2]];
//        for (NSInteger i=0; i<(rememberText.length-4); i++)
//        {
//            [returnText appendString:@"*"];
//        }
//        [returnText appendString:[rememberText substringFromIndex:rememberText.length-2]];
//        [_paperText setText:returnText];
//    }
//    else
//    {
//        [_paperText setText:rememberText];
//    }
//}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
