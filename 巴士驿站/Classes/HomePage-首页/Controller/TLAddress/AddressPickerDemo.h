//
//  AddressPickerDemo.h
//  BAddressPickerDemo
//
//  Created by 林洁 on 16/1/13.
//  Copyright © 2016年 onlylin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddressPickerDemo : UIViewController
@property(nonatomic,strong)void(^siteBlock)(NSString *str);
@property(nonatomic,retain)NSString *selectOrderDetailView;
@property(nonatomic,retain)NSString *selectHomePageView;
@end
