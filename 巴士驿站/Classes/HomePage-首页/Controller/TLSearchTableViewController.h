//
//  TLSearchTableViewController.h
//  巴士驿站
//
//  Created by 胡潇炜 on 16/7/28.
//  Copyright © 2016年 Edge. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TLSearchTableViewController : UIViewController

@property(nonatomic,strong)NSString * StartOffName;
@property(nonatomic,strong)NSString * DestinationName;
@property(nonatomic,strong)NSString * TicketDate;

//  json字符转字典
@property(nonatomic,strong)NSDictionary *dict;

@end
