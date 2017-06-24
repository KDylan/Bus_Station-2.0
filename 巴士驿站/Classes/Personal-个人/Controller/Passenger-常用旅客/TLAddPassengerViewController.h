//
//  TLAddPassengerViewController.h
//  巴士驿站
//
//  Created by Maominghui on 16/7/15.
//  Copyright © 2016年 Edge. All rights reserved.
//

#import <UIKit/UIKit.h>
@class TLUsers;
@class TLAddPassengerViewController;
@protocol TLAddPassengerViewControllerDelegate <NSObject>

@optional
-(void)addViewController:(TLAddPassengerViewController *)viewController addUser:(TLUsers *)user;

@end
@interface TLAddPassengerViewController : UIViewController
@property(nonatomic,strong)id<TLAddPassengerViewControllerDelegate> delegate;
@end
