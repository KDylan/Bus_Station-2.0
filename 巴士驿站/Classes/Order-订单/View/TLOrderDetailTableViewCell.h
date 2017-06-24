//
//  TLOrderDetailTableViewCell.h
//  巴士驿站
//
//  Created by 胡潇炜 on 16/7/13.
//  Copyright © 2016年 Edge. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TLSiteDetailView.h"
#import "TLPassengerDetailView.h"
#import "TLStationDetailView.h"
#import "TLContactsDetailView.h"

//@protocol MycellDelegate <NSObject>
//
//@optional
//-(void)addSiteDetailaction:(UIButton *)button;
//
//@end

@interface TLOrderDetailTableViewCell : UITableViewCell
//+(instancetype)cellWithtableView:(UITableView *)tableview;

//@property(nonatomic,weak) id<MycellDelegate> delegate;

@property(nonatomic,strong)UILabel *timeLabel;

@property(nonatomic,strong)TLSiteDetailView *siteDetailView;

@property(nonatomic,strong)UILabel *contactsLabel;

@property(nonatomic,strong)TLContactsDetailView *contactsDetailView;

@property(nonatomic,strong)UILabel *passengerLabel;

@property(nonatomic,strong)TLPassengerDetailView *passengerDetailView;

@property(nonatomic,strong)UILabel *stationLabel;

@property(nonatomic,strong)TLStationDetailView *stationDetailView;
/**
 覆盖到车站地址上的button，实现点击事件
 */
//@property(nonatomic,strong)UIButton *stationDetailButton;

@end
