//
//  TLNameViewController.h
//  巴士驿站
//
//  Created by Edge on 16/7/15.
//  Copyright © 2016年 Edge. All rights reserved.
//

#import <UIKit/UIKit.h>
@class TLUsers;
@class TLNameViewController;
@protocol TLNameViewControllerDelegate <NSObject>
@optional
-(void)addViewController:(TLNameViewController *)ViewController addUserName:(TLUsers *)name;

@end
@interface TLNameViewController : UIViewController
@property(nonatomic,weak)id<TLNameViewControllerDelegate> delegate;
@end
