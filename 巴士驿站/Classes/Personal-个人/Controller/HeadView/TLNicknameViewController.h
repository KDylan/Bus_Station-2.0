//
//  TLNicknameViewController.h
//  巴士驿站
//
//  Created by Edge on 16/7/14.
//  Copyright © 2016年 Edge. All rights reserved.
//

#import <UIKit/UIKit.h>
@class TLUsers;
@class TLNicknameViewController;
@protocol TLNicknameViewControllerDelegate <NSObject>

@optional
-(void)addViewController:(TLNicknameViewController *)addViewController addUser:(TLUsers *)User;

@end
@interface TLNicknameViewController : UIViewController
@property(nonatomic,weak)id<TLNicknameViewControllerDelegate> delegate;
@end
