//
//  ForgetPasswordTwoViewController.h
//  登陆界面测试
//
//  Created by mac on 16/7/19.
//  Copyright © 2016年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>
@class  login;
@interface ForgetPasswordTwoViewController : UIViewController
@property(nonatomic,strong)NSDictionary * dict;
@property(nonatomic,copy) login *logininfo;

//从a传值到b  属性必须定义在.h文件中
@property(nonatomic,strong)NSString *userPhone;
//@property(nonatomic,strong)NSString *uuID;//用户标识；
@end
