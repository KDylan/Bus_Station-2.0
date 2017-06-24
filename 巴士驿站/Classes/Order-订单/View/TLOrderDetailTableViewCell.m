//
//  TLOrderDetailTableViewCell.m
//  巴士驿站
//
//  Created by 胡潇炜 on 16/7/13.
//  Copyright © 2016年 Edge. All rights reserved.
//

#import "TLOrderDetailTableViewCell.h"
#import "TLSiteDetailView.h"
#import "TLPassengerDetailView.h"
#import "TLStationDetailView.h"
#import "TLContactsDetailView.h"
#import "AddressPickerDemo.h"

@implementation TLOrderDetailTableViewCell


/**
 *  自定义订单详情cell的初始化函数重写
 */
-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self=[super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        self.backgroundColor = [UIColor colorWithRed:206/255.0 green:211/255.0 blue:212/255.0 alpha:1];
        self.timeLabel = [self creatLabel:self.timeLabel str:@"2016-10-01 09:55" textAlignment:NSTextAlignmentLeft];
        self.contactsLabel = [self creatLabel:self.contactsLabel str:@"联系人信息" textAlignment:NSTextAlignmentLeft];
        self.passengerLabel = [self creatLabel:self.passengerLabel str:@"乘客信息" textAlignment:NSTextAlignmentLeft];
        self.stationLabel = [self creatLabel:self.stationLabel str:@"车站信息" textAlignment:NSTextAlignmentLeft];
        
        self.siteDetailView = [[TLSiteDetailView alloc] init];
        [self addSubview:self.siteDetailView];
        
       
        
        self.contactsDetailView = [[TLContactsDetailView alloc]init];
        [self addSubview:self.contactsDetailView];

        self.passengerDetailView = [[TLPassengerDetailView alloc]init];
        [self addSubview:self.passengerDetailView];
        
        self.stationDetailView = [[TLStationDetailView alloc] init];
        [self addSubview:self.stationDetailView];
        
//        self.stationDetailButton=[[UIButton alloc]init];
//        [self.stationDetailButton addTarget:self action:@selector(addSiteDetail:) forControlEvents:UIControlEventTouchUpInside];
////        self.stationDetailButton.backgroundColor=[UIColor redColor];
//        [self addSubview:self.stationDetailButton];
        
        [self.timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.mas_top).with.offset(10);
            make.left.equalTo(self.mas_left).with.offset(10);
            make.width.equalTo(@200);
            make.height.equalTo(@30);
        }];
        
        [self.siteDetailView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.mas_left).with.offset(10);
            make.right.equalTo(self.mas_right).with.offset(-10);
            make.top.equalTo(self.timeLabel.mas_bottom);
            make.height.equalTo(@155);
        }];
       
        [self.contactsLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.siteDetailView.mas_bottom).with.offset(10);
            make.left.equalTo(self.mas_left).with.offset(10);
            make.width.equalTo(@200);
            make.height.equalTo(@30);
            
        }];
        [self.contactsDetailView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.mas_left).with.offset(10);
            make.right.equalTo(self.mas_right).with.offset(-10);
            make.top.equalTo(self.contactsLabel.mas_bottom);
            make.height.equalTo(@100);
        }];
        [self.passengerLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.contactsDetailView.mas_bottom).with.offset(10);
            make.left.equalTo(self.mas_left).with.offset(10);
            make.width.equalTo(@200);
            make.height.equalTo(@30);
            
        }];
        
        [self.passengerDetailView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.mas_left).with.offset(10);
            make.right.equalTo(self.mas_right).with.offset(-10);
            make.top.equalTo(self.passengerLabel.mas_bottom);
            make.height.equalTo(@100);
        }];
        
        [self.stationLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.passengerDetailView.mas_bottom).with.offset(10);
            make.left.equalTo(self.mas_left).with.offset(10);
            make.width.equalTo(@200);
            make.height.equalTo(@30);
        }];
//        
//        [self.stationDetailButton mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.left.equalTo(self.mas_left).with.offset(10);
//            make.right.equalTo(self.mas_right).with.offset(-10);
//            make.top.equalTo(self.stationLabel.mas_bottom);
//            make.height.equalTo(@50);
//        }];
        
        [self.stationDetailView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.mas_left).with.offset(10);
            make.right.equalTo(self.mas_right).with.offset(-10);
            make.top.equalTo(self.stationLabel.mas_bottom);
            make.height.equalTo(@50);
        }];
       
        
    }
    return self;
}
//-(void)addSiteDetail:(UIButton *)btn
//{
//    [self.delegate addSiteDetailaction:btn];
//}

-(UILabel *)creatLabel:(UILabel *)label str:(NSString *)str textAlignment:(NSTextAlignment)textAlignment
{
    label = [[UILabel alloc] init];
    label.text = str;
    label.textAlignment = textAlignment;
    [self addSubview:label];
    return label;
}


//- (void)awakeFromNib {
//    // Initialization code
//}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
