//
//  TLWriteOrderTableViewController.h
//  巴士驿站
//
//  Created by Edge on 16/7/28.
//  Copyright © 2016年 Edge. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TLticketDate.h"

@interface TLWriteOrderTableViewController : UIViewController

@property(nonatomic,strong)TLticketDate *tkDict;
/**
 用于AddressPickerDemo选择显示界面
 */
@property(nonatomic,assign)NSString *selectWriteOrder;
@end
