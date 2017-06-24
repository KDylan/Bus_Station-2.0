//
//  BAddressPickerController.h
//  Bee
//
//  Created by 林洁 on 16/1/12.
//  Copyright © 2016年 Lin. All rights reserved.
//

#import <UIKit/UIKit.h>

@class BAddressPickerController;

@protocol BAddressPickerDataSource <NSObject>

@required
- (NSArray*)arrayOfHotCitiesInAddressPicker:(BAddressPickerController*)addressPicker;

@end

@protocol BAddressPickerDelegate <NSObject>

-(void)addressPicker:(BAddressPickerController*)addressPicker didSelectedCity:(NSString*)city;

- (void)beginSearch:(UISearchBar*)searchBar;

- (void)endSearch:(UISearchBar*)searchBar;

@end

@interface BAddressPickerController : UIViewController<UITableViewDataSource,UITableViewDelegate,UISearchBarDelegate,UISearchDisplayDelegate>

//数据源代理协议
@property (nonatomic, weak) id<BAddressPickerDataSource> dataSource;
//委托代理协议
@property (nonatomic, weak) id<BAddressPickerDelegate> delegate;

/**
 接收TLHomePageViewController和TLOrderDetailViewController的数据，选择显示相应界面
 */
@property(nonatomic, retain)NSString *selectHomePageV;
@property(nonatomic, retain)NSString *selectOrderDetailV;
- (id)initWithFrame:(CGRect)frame setHomePage:(NSString *)selectHomePageV setOrderDetail:(NSString *)selectOrderDetailV;

@end
