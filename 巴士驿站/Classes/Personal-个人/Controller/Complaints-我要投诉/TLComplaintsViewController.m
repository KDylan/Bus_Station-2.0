//
//  TLComplaintsViewController.m
//  巴士驿站
//
//  Created by Maominghui on 16/7/14.
//  Copyright © 2016年 Edge. All rights reserved.
//

#import "TLComplaintsViewController.h"
#import "Masonry.h"
#import "ZYRadioButton.h"

@interface TLComplaintsViewController ()<UITextFieldDelegate/*这里引入UITextField 需要的委托*/,UITextViewDelegate/*这里引入UITextView 需要的委托*/>

@property (nonatomic,strong) UITextField *phoneField;       //手机号
@property (nonatomic,strong) UITextView *explainField;  //投诉说明
@property (nonatomic,strong) UIButton *submitButton;     // 提交按钮
@property (nonatomic,strong) NSString *reason;     //用来接收单选按钮的值

@end

@implementation TLComplaintsViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"我要投诉";
    //    self.view.backgroundColor=[UIColor whiteColor];
    UIView *view1=[[UIView alloc]initWithFrame:self.view.bounds];
    [self.view addSubview:view1];
    view1.backgroundColor=[UIColor whiteColor];
    
    //用于界面效果
    UILabel *Lable = [[UILabel alloc]init];
    Lable.layer.borderColor=[[UIColor colorWithRed:215/255.0 green:209/255.0 blue:212/255.0 alpha:1.0]CGColor];
    Lable.layer.borderWidth=1;
    [view1 addSubview:Lable];
    [Lable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(view1).with.offset(80);
        make.left.equalTo(view1).with.offset(20);
        make.right.equalTo(view1).with.offset(-20);
        make.bottom.equalTo(view1).with.offset(-80);
    }];
    
    UILabel *Lable1 = [[UILabel alloc]init];
    Lable1.layer.borderColor=[[UIColor colorWithRed:215/255.0 green:209/255.0 blue:212/255.0 alpha:1.0]CGColor];
    Lable1.layer.borderWidth=1;
    [view1 addSubview:Lable1];
    [Lable1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(Lable.mas_top);
        make.left.equalTo(Lable.mas_left);
        make.right.equalTo(Lable.mas_right);
        make.height.mas_equalTo(60);
    }];
    
    UILabel *applyLable = [[UILabel alloc]init];
    [view1 addSubview:applyLable];
    applyLable.text=@"申请投诉";
    applyLable.font=[UIFont systemFontOfSize:20];
    [applyLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(Lable1.mas_top);
        make.left.equalTo(Lable1.mas_left).with.offset(10);
        make.width.mas_equalTo(80);
        make.bottom.equalTo(Lable1.mas_bottom);
    }];
    
    UILabel *promptLable = [[UILabel alloc]init];
    [view1 addSubview:promptLable];
    promptLable.text=@"＊为必填项";
    promptLable.font=[UIFont systemFontOfSize:14];
    [promptLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(Lable1.mas_top);
        make.right.equalTo(Lable1.mas_right).with.offset(-10);
        make.width.mas_equalTo(70);
        make.bottom.equalTo(Lable1.mas_bottom);
    }];
    
    UILabel *reasonLable = [[UILabel alloc]init];
    [view1 addSubview:reasonLable];
    reasonLable.text=@"投诉原因：＊";
    reasonLable.font=[UIFont systemFontOfSize:15];
    [reasonLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(Lable1.mas_bottom).with.offset(15);
        make.left.equalTo(Lable1.mas_left).with.offset(10);
        make.width.mas_equalTo(100);
        make.height.mas_equalTo(40);
    }];
    
    UILabel *phoneLable = [[UILabel alloc]init];
    [view1 addSubview:phoneLable];
    phoneLable.text=@"手机号码：＊";
    phoneLable.font=[UIFont systemFontOfSize:15];
    [phoneLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(reasonLable.mas_bottom).with.offset(15);
        make.left.equalTo(Lable1.mas_left).with.offset(10);
        make.width.mas_equalTo(100);
        make.height.mas_equalTo(40);
    }];
    
    
    UILabel *explainLable = [[UILabel alloc]init];
    [view1 addSubview:explainLable];
    explainLable.text=@"投诉说明：＊";
    explainLable.font=[UIFont systemFontOfSize:15];
    [explainLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(phoneLable.mas_bottom).with.offset(35);
        make.left.equalTo(Lable1.mas_left).with.offset(10);
        make.width.mas_equalTo(100);
        make.height.mas_equalTo(40);
    }];
    
    UILabel *eHintLable = [[UILabel alloc]init];
    [view1 addSubview:eHintLable];
    eHintLable.text=@"(0/200字)";
    eHintLable.font=[UIFont systemFontOfSize:11];
    eHintLable.textColor=[UIColor grayColor];
    [eHintLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(explainLable.mas_bottom).with.offset(-15);
        make.left.equalTo(Lable1.mas_left).with.offset(10);
        make.width.mas_equalTo(100);
        make.height.mas_equalTo(25);
    }];
    
    //设计单选按钮，根据按钮的属性封装ZYRadioButton类
    ZYRadioButton *rb1 = [[ZYRadioButton alloc] initWithGroupId:@"软件卡顿" index:0];
    [view1 addSubview:rb1];
    [rb1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(reasonLable.mas_centerY).with.offset(-5);
        make.left.equalTo(reasonLable.mas_right).with.offset(10);
        make.width.mas_equalTo(22);
        make.height.mas_equalTo(22);
    }];
    [ZYRadioButton addObserverForGroupId:@"软件卡顿" observer:self];
    
    UILabel *rb1Lable = [[UILabel alloc]init];
    [view1 addSubview:rb1Lable];
    rb1Lable.text=@"软件卡顿";
    rb1Lable.font=[UIFont systemFontOfSize:15];
    [rb1Lable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(rb1.mas_centerY);
        make.left.equalTo(rb1.mas_right).with.offset(5);
        make.right.equalTo(Lable.mas_right).with.offset(-25);
        make.height.mas_equalTo(30);
    }];
    
    ZYRadioButton *rb2 = [[ZYRadioButton alloc] initWithGroupId:@"信息不完整" index:1];
    [view1 addSubview:rb2];
    [rb2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(rb1.mas_centerX);
        make.top.equalTo(rb1Lable.mas_bottom);
        make.width.mas_equalTo(22);
        make.height.mas_equalTo(22);
    }];
    [ZYRadioButton addObserverForGroupId:@"信息不完整" observer:self];
    
    UILabel *rb2Lable = [[UILabel alloc]init];
    [view1 addSubview:rb2Lable];
    rb2Lable.text=@"信息不完整";
    rb2Lable.font=[UIFont systemFontOfSize:15];
    [rb2Lable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(rb2.mas_centerY);
        make.left.equalTo(rb2.mas_right).with.offset(5);
        make.right.equalTo(Lable.mas_right).with.offset(-25);
        make.height.mas_equalTo(30);
    }];
    
    //手机号文本框的属性
    _phoneField = [[UITextField alloc] init];
    _phoneField.textColor = [UIColor colorWithRed:112/255.0 green:108/255.0 blue:108/255.0 alpha:1.0];
    _phoneField.backgroundColor = [UIColor colorWithRed:234/255.0 green:234/255.0 blue:234/255.0 alpha:1];
    _phoneField.borderStyle = UITextBorderStyleRoundedRect;   //设置边框类型
    _phoneField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;//文字内容 垂直居中
    _phoneField.placeholder = @"手机号";//设置默认提示文字
    _phoneField.font = [UIFont systemFontOfSize:14];  //字体大小
    [self.view addSubview:_phoneField];
    [_phoneField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(phoneLable.mas_centerY);
        make.left.equalTo(phoneLable.mas_right).with.offset(5);
        make.right.equalTo(Lable.mas_right).with.offset(-25);
        make.height.mas_equalTo(30);}];
    
    UILabel *pHintLable = [[UILabel alloc]init];
    [view1 addSubview:pHintLable];
    pHintLable.text=@"以此电话接受投诉过程中的信息，请确保电话通畅。";
    pHintLable.font=[UIFont systemFontOfSize:11];
    pHintLable.textColor=[UIColor grayColor];
    [pHintLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_phoneField.mas_bottom);
        make.left.equalTo(phoneLable.mas_left);
        make.right.equalTo(Lable.mas_right).with.offset(-5);
        make.height.mas_equalTo(25);
    }];
    
    //填写投诉说明的文本视图
    _explainField=[[UITextView alloc]init];
    _explainField.textColor = [UIColor colorWithRed:112/255.0 green:108/255.0 blue:108/255.0 alpha:1.0];
    _explainField.backgroundColor = [UIColor colorWithRed:234/255.0 green:234/255.0 blue:234/255.0 alpha:1];
    //设置边框类型
    _explainField.layer.cornerRadius = 6;   //圆角边框
    _explainField.layer.borderWidth=0;      //边框宽为零
    _explainField.layer.masksToBounds = YES;
    _explainField.font=[UIFont systemFontOfSize:14];
    
    // _explainField.layer.borderColor=[[UIColor grayColor]CGColor]; 设置边框颜色
    [self.view addSubview:_explainField];
    [_explainField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(explainLable.mas_top).with.offset(10);
        make.left.equalTo(explainLable.mas_right).with.offset(5);
        make.right.equalTo(Lable.mas_right).with.offset(-25);
        make.bottom.equalTo(Lable.mas_bottom).with.offset(-80);}];
    //提交按钮
    _submitButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [_submitButton setBackgroundColor:[UIColor colorWithRed:0.9581 green:0.9581 blue:0.9581 alpha:1.0]]; //背景颜色
    [_submitButton setTitle:@"提交投诉申请" forState:UIControlStateNormal];
  //  字体颜色
   [_submitButton setTitleColor:[UIColor colorWithRed:0.276 green:0.557 blue:0.9989 alpha:1.0] forState:UIControlStateNormal];
    _submitButton.titleLabel.font = [UIFont systemFontOfSize:20];
    
    //  切圆角
    _submitButton.layer.masksToBounds = YES;
    _submitButton.layer.cornerRadius = 8;

    [self.view addSubview:_submitButton];
    [_submitButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(Lable.mas_centerX);
        make.top.equalTo(_explainField.mas_bottom).with.offset(30);
        make.height.mas_equalTo(40);
        make.left.mas_equalTo(self.view).offset(30);
         make.right.mas_equalTo(self.view).offset(-30);
        
    }];
    
    //文本框的输入状态获取
    [_phoneField addTarget:self action:@selector(textChange) forControlEvents:UIControlEventEditingChanged];
    
    
    
    //按钮设置为不能按的状态
    _submitButton.enabled = NO;
    
    //提交监听事件
    [_submitButton addTarget:self action:@selector(tapRegisterButton:) forControlEvents:UIControlEventTouchUpInside];
}

-(void)textChange
{
    //  当三个输入框都不为空才能点击按钮；进行提交
    
    if(_phoneField.text.length!=0)
    {
        _submitButton.enabled = YES ;  //  按钮可点击
        [_submitButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_submitButton setBackgroundColor:[UIColor colorWithRed:39/255.0 green:124/255.0 blue:255/255.0 alpha:0.75]]; //背景颜色
        //确认添加按钮的点击事件
        [_submitButton addTarget:self action:@selector(tapRegisterButton:) forControlEvents:UIControlEventTouchUpInside];
    }
}

//提交按钮的监听事件
-(void)tapRegisterButton:(UIButton *)sender
{
    if (_explainField.text.length==0||_reason.length==0) {
        
        UIAlertController *alter = [UIAlertController alertControllerWithTitle:@"提示" message:@"请将信息填写完整" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *action1 = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            //
        }];
        [alter addAction:action1];
        [self presentViewController:alter animated:YES completion:nil];
        }else if (_explainField.text.length>200) {

    UIAlertController *alter = [UIAlertController alertControllerWithTitle:@"提示" message:@"投诉说明长度超出范围" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *action1 = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            //
        }];
        [alter addAction:action1];
        [self presentViewController:alter animated:YES completion:nil];
        
    }
    else{
        
        UIAlertController *alter = [UIAlertController alertControllerWithTitle:@"提示" message:@"提交成功" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *action1 = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            [self.navigationController popViewControllerAnimated:YES];
        }];
        [alter addAction:action1];
        [self presentViewController:alter animated:YES completion:nil];
        

        
    }
}


//获取单选按钮的值
-(void)radioButtonSelectedAtIndex:(NSUInteger)index inGroup:(NSString *)groupId{
    _reason=groupId;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
