//
//  TLSiteDetailView.m
//  巴士驿站
//
//  Created by 胡潇炜 on 16/7/13.
//  Copyright © 2016年 Edge. All rights reserved.
//

#import "TLSiteDetailView.h"
#import "Masonry.h"

@implementation TLSiteDetailView

/**
 *  自定义车票信息
 */
-(id)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor colorWithRed:113/255.0 green:193/255.0 blue:237/255.0 alpha:1];
        
        self.startLabel = [self creatLabel:self.startLabel str:@"杭州西湖站" textAlignment:NSTextAlignmentCenter];
        
        self.destinationLabel = [self creatLabel:self.destinationLabel str:@"温州南站" textAlignment:NSTextAlignmentCenter];
        
        self.arrowImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"appbar.next"]];
        [self addSubview:self.arrowImage];
        
        self.coachNumberLabel = [self creatLabel:self.coachNumberLabel str:@"9988车次" textAlignment:NSTextAlignmentCenter];
        
        self.ticketNumberLabel = [self creatLabel:self.ticketNumberLabel str:@"两张" textAlignment:NSTextAlignmentCenter];
        
        self.orderNumber=[self creatLabel:self.orderNumber str:@"取票订单号:" textAlignment:NSTextAlignmentLeft];
        
        self.orderNumbertext=[self creatLabel:self.orderNumbertext str:@"1111111111" textAlignment:NSTextAlignmentCenter];
        
        self.departureTime=[self creatLabel:self.departureTime str:@"发车时间:" textAlignment:NSTextAlignmentLeft];
        
        self.departureTimetext=[self creatLabel:self.departureTimetext str:@"07月01日(周三)09:20" textAlignment:NSTextAlignmentCenter];
        [self.startLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.mas_left).with.offset(10);
            make.right.equalTo(self.arrowImage.mas_left).with.offset(-10);
            make.top.equalTo(self.mas_top).with.offset(10);
            make.height.equalTo(@30);
            make.width.equalTo(self.destinationLabel);
        }];
        
        [self.destinationLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.arrowImage.mas_right).with.offset(10);
            make.right.equalTo(self.mas_right).with.offset(-10);
            make.top.equalTo(self.mas_top).with.offset(10);
            make.height.equalTo(@30);
            make.width.equalTo(self.startLabel);
        }];
        
        [self.arrowImage mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.startLabel.mas_right).with.offset(10);
            make.right.equalTo(self.destinationLabel.mas_left).with.offset(-10);
            make.centerY.equalTo(self.startLabel.mas_centerY);
            
        }];
        
        [self.coachNumberLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.startLabel);
            make.top.equalTo(self.startLabel.mas_bottom).with.offset(10);
            make.height.equalTo(@30);
            make.width.equalTo(@80);
        }];
        
        [self.ticketNumberLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.destinationLabel);
            make.top.equalTo(self.destinationLabel.mas_bottom).with.offset(10);
            make.height.equalTo(@30);
            make.width.equalTo(@80);
        }];
        
               [self.departureTime mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.mas_left).with.offset(10);
            make.top.equalTo(self.coachNumberLabel.mas_bottom).with.offset(10);
            make.height.equalTo(@30);
            make.width.equalTo(self.departureTime);
            
        }];
        
        [self.departureTimetext mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.departureTime.mas_right);
            make.top.equalTo(self.coachNumberLabel.mas_bottom).with.offset(10);
            make.height.equalTo(@30);
            make.width.equalTo(self.departureTimetext);
            
        }];

        [self.orderNumber mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.mas_left).with.offset(10);
            make.top.equalTo(self.departureTime.mas_bottom);
            make.height.equalTo(@30);
            make.width.equalTo(self.orderNumber);
            
        }];
        
        [self.orderNumbertext mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.orderNumber.mas_right);
            make.top.equalTo(self.departureTime.mas_bottom);
            make.height.equalTo(@30);
            make.width.equalTo(self.orderNumbertext);
            
        }];


    }
    return self;
}

-(UILabel *)creatLabel:(UILabel *)label str:(NSString *)str textAlignment:(NSTextAlignment)textAlignment
{
    label = [[UILabel alloc] init];
    label.text = str;
    label.textAlignment = textAlignment;
    [self addSubview:label];
    return label;
}


@end
