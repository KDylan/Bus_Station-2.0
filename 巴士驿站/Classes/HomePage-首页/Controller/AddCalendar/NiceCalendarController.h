//
//  ViewController.h
//  日历选择时间
//
//  Created by Jax on 16/1/28.
//  Copyright © 2016年 Jax. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NiceCalendarController : UIViewController
@property(nonatomic,strong)void(^DateBlock)(NSString *str);

@end

