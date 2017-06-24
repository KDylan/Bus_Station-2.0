//
//  TLNicknameViewController.m
//  巴士驿站
//
//  Created by Edge on 16/7/14.
//  Copyright © 2016年 Edge. All rights reserved.
//
#define MAS_SHORTHAND  
#define MAS_SHORTHAND_GLOBALS
#import "Masonry.h"
#import "TLNicknameViewController.h"
#import "TLUsers.h"
@interface TLNicknameViewController ()<UITextFieldDelegate>
@property(nonatomic,weak)UITextField *textFiled;
@end

@implementation TLNicknameViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"修改昵称";
    self.view.backgroundColor = [UIColor colorWithRed:0.888 green:0.865 blue:0.872 alpha:1.000];
    [self addDetermineButton];
    [self addTextFiled];
}
-(void)addDetermineButton{
    //创建一个右边按钮
    UIButton *but = [[UIButton alloc]init];
    but.frame = CGRectMake(0, 0, 50,20);
    [but addTarget:self action:@selector(Determine:) forControlEvents:UIControlEventTouchUpInside];
    [but setTitle:@"确定" forState:UIControlStateNormal];
    [but setTitleColor:[UIColor blackColor]forState:UIControlStateNormal];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:but];
}
    //  添加编辑框
-(UITextField *)addTextFiled{
    UITextField *textFiled = [[UITextField alloc]init];
     self.textFiled = textFiled;
    textFiled.backgroundColor=[UIColor whiteColor];
    textFiled.font = [UIFont systemFontOfSize:14.0];
    textFiled.placeholder  = @"  昵称";
    //textFiled.text = @"123";
    textFiled.returnKeyType = UIReturnKeyDone;
    //  切圆角
    textFiled.layer.masksToBounds = YES;
    textFiled.layer.cornerRadius = 5;
    [self.view addSubview:textFiled];
    [textFiled mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(80);
        make.left.equalTo(self.view).offset(10);
        make.right.equalTo(self.view).offset(-10);
        make.height.equalTo(@35);
        
    }];
    return textFiled;
}
//  遵守代理
-(void)Determine:(UIButton *)sender{
    
    if ([self.delegate respondsToSelector:@selector(addViewController:addUser:)]) {
        TLUsers *Users = [[TLUsers alloc]init];
        Users.nickName = self.textFiled.text;
        [self.delegate addViewController:self addUser:Users];
      //   NSLog(@"!!_%@",Users.nickName);
    }
    //  返回前一个界面
    [[self navigationController] popViewControllerAnimated:true];
}
@end
