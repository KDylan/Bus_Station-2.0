//
//  TLStationDetailView.m
//  巴士驿站
//
//  Created by 胡潇炜 on 16/7/14.
//  Copyright © 2016年 Edge. All rights reserved.
//

#import "TLStationDetailView.h"
#import "Masonry.h"

@implementation TLStationDetailView

/**
 *  自定义车站信息
 */
-(id)initWithFrame:(CGRect)frame
{
    if (self=[super initWithFrame:frame]) {
        
        self.backgroundColor = [UIColor whiteColor];
//        self.name = [self creatLabel:self.name str:@"车站:" textAlignment:NSTextAlignmentLeft];
//        self.detailName = [self creatLabel:self.detailName str:@"杭州市西湖区小和山站" textAlignment:NSTextAlignmentLeft];
        self.address = [self creatLabel:self.address str:@"车站地址:" textAlignment:NSTextAlignmentLeft];
        self.detailAddress = [self creatLabel:self.detailAddress str:@"杭州市西湖区小和山路407号" textAlignment:NSTextAlignmentLeft];
//        self.tele = [self creatLabel:self.tele str:@"车站电话:" textAlignment:NSTextAlignmentLeft];
//        self.detailTele = [self creatLabel:self.detailTele str:@"0570-88886887" textAlignment:NSTextAlignmentLeft];
//        self.time = [self creatLabel:self.time str:@"购票时间:" textAlignment:NSTextAlignmentLeft];
//        self.detailTime = [self creatLabel:self.detailTime str:@"2016-10-11 09:15:07" textAlignment:NSTextAlignmentLeft];
//        self.server = [self creatLabel:self.server str:@"客服电话:" textAlignment:NSTextAlignmentLeft];
//        self.detailServer = [self creatLabel:self.detailServer str:@"400-87518868" textAlignment:NSTextAlignmentLeft];
//        
//        [self.name mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.left.equalTo(self.mas_left).with.offset(10);
//            make.top.equalTo(self.mas_top).with.offset(10);
//            make.width.equalTo(@50);
//            make.height.equalTo(@30);
//        }];
        
//        [self.detailName mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.left.equalTo(self.name.mas_right);
//            make.right.equalTo(self.mas_right).with.offset(-10);
//            make.top.equalTo(self.mas_top).with.offset(10);
//            make.height.equalTo(@30);
//        }];
//        
        [self.address mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.mas_left).with.offset(10);
            make.top.equalTo(self.mas_top).with.offset(10);
            make.width.equalTo(@100);
            make.height.equalTo(@30);
        }];
        
        [self.detailAddress mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.address.mas_right);
            make.top.equalTo(self.mas_top).with.offset(10);
            make.width.equalTo(self.detailAddress);
            make.height.equalTo(@30);
        }];
//
//        [self.tele mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.left.equalTo(self.mas_left).with.offset(10);
//            make.top.equalTo(self.address.mas_bottom);
//            make.width.equalTo(@100);
//            make.height.equalTo(@30);
//        }];
//        
//        [self.detailTele mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.left.equalTo(self.tele.mas_right);
//            make.right.equalTo(self.mas_right).with.offset(-10);
//            make.top.equalTo(self.address.mas_bottom);
//            make.height.equalTo(@30);
//
//        }];
//        
//        [self.time mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.left.equalTo(self.mas_left).with.offset(10);
//            make.top.equalTo(self.tele.mas_bottom);
//            make.width.equalTo(@100);
//            make.height.equalTo(@30);
//        }];
//        
//        [self.detailTime mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.left.equalTo(self.time.mas_right);
//            make.right.equalTo(self.mas_right).with.offset(-10);
//            make.top.equalTo(self.tele.mas_bottom);
//            make.height.equalTo(@30);
//        }];
//        
//        [self.server mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.left.equalTo(self.mas_left).with.offset(10);
//            make.top.equalTo(self.time.mas_bottom);
//            make.width.equalTo(@100);
//            make.height.equalTo(@30);
//        }];
//        
//        [self.detailServer mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.left.equalTo(self.server.mas_right);
//            make.right.equalTo(self.mas_right).with.offset(-10);
//            make.top.equalTo(self.time.mas_bottom);
//            make.height.equalTo(@30);
//        }];
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
