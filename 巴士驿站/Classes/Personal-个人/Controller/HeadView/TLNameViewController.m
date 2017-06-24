//
//  TLNameViewController.m
//  巴士驿站
//
//  Created by Edge on 16/7/15.
//  Copyright © 2016年 Edge. All rights reserved.
//
#define MAS_SHORTHAND  //  不用mas
//  mas_equalTo(self.view) = equalTo(self.view);
#define MAS_SHORTHAND_GLOBALS
#import "Masonry.h"
#import "TLNameViewController.h"
#import "TLUsers.h"
//#import "TLNicknameViewController.h"
@interface TLNameViewController ()<UITextFieldDelegate>
@property(nonatomic,weak)UITextField *textFiled;
@end

@implementation TLNameViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithRed:0.888 green:0.865 blue:0.872 alpha:1.000];
    self.navigationItem.title = @"修改姓名";
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
    //  将textFiled 内容全局
     self.textFiled = textFiled;
    textFiled.backgroundColor=[UIColor whiteColor];
    textFiled.font = [UIFont systemFontOfSize:14.0];
    textFiled.placeholder  = @"  姓名";
    //textFiled.text = @"123";
    //  切圆角
    textFiled.layer.masksToBounds = YES;
    textFiled.layer.cornerRadius = 5;
    textFiled.returnKeyType = UIReturnKeyDone;
    [self.view addSubview:textFiled];
    [textFiled mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(80);
        make.left.equalTo(self.view).offset(10);
        make.right.equalTo(self.view).offset(-10);
        make.height.equalTo(@35);
        
    }];
    return textFiled;

}
-(void)Determine:(UIButton *)sender{
    //  返回前一个界面
    if ([self.delegate respondsToSelector:@selector(addViewController:addUserName:)]) {
        TLUsers *users = [[TLUsers alloc]init];
        users.name = self.textFiled.text;
        [self.delegate addViewController:self addUserName:users];
        // NSLog(@"!!_%@",self.textFiled.text);
    }
    [[self navigationController] popViewControllerAnimated:true];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
