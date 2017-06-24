//
//  TLChangePassengerViewController.h
//  巴士驿站
//
//  Created by Edge on 16/7/25.
//  Copyright © 2016年 Edge. All rights reserved.
//

#import <UIKit/UIKit.h>
@class TLUsers;
@class TLChangePassengerViewController;
@protocol TLChangePassengerViewControllerDelegate <NSObject>

@optional
-(void)editViewController:(TLChangePassengerViewController *)editviewController didSaveUser:(TLUsers *)user;

@end

@interface TLChangePassengerViewController : UIViewController
////  乘客名字
//@property(nonatomic,strong)NSString *passName;
////  身份证号
//@property(nonatomic,strong)NSString *passID;
////  乘客证件类型
//@property(nonatomic,strong)NSString *pPaper;
////  乘客手机号
//@property(nonatomic,strong)NSString *pNumber;
//
/** 模型属性  */
@property(nonatomic,strong)TLUsers * user;
//  代理
@property(nonatomic,weak)id<TLChangePassengerViewControllerDelegate> delegate;
@end
