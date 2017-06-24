//
//  TLAddPassengerTableViewController.h
//  巴士驿站
//
//  Created by Maominghui on 16/7/29.
//  Copyright © 2016年 Edge. All rights reserved.
//
/*
#import <UIKit/UIKit.h>
@class TLUsers;
@class TLAddPassengerTableViewController;
@protocol TLAddPassengerTableViewControllerDelegate <NSObject>

@optional

-(void)addViewController:(TLAddPassengerTableViewController *)viewController addUser:(TLUsers *)user;

@end

@interface TLAddPassengerTableViewController : UITableViewController
@property(nonatomic,weak)id<TLAddPassengerTableViewControllerDelegate> delegate;
@end
*/
#import <UIKit/UIKit.h>
@class TLUsers;
@class TLAddPassengerTableViewController;
@protocol TLAddPassengerTableViewControllerDelegate <NSObject>

@optional
-(void)addViewController:(TLAddPassengerTableViewController *)viewController addUser:(TLUsers *)user;

@end
@interface TLAddPassengerTableViewController : UITableViewController
@property(nonatomic,weak)id<TLAddPassengerTableViewControllerDelegate> delegate;
@end


