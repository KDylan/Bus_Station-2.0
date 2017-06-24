//
//  TLSearchTableViewCell.m
//  巴士驿站
//
//  Created by 胡潇炜 on 16/7/28.
//  Copyright © 2016年 Edge. All rights reserved.
//

#import "TLSearchTableViewCell.h"

@implementation TLSearchTableViewCell

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.Label1 = [self creatLabel:self.Label1 str:@"车牌号" textAlignment:NSTextAlignmentLeft];
        self.busLabel=[self creatLabel:self.busLabel textAlignment:NSTextAlignmentLeft];
        self.startImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"未标题-1_"]];
        [self addSubview:self.startImage];
        
        self.startLabel = [self creatLabel:self.startLabel textAlignment:NSTextAlignmentCenter];
        self.arrowImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"2_03"]];
        [self addSubview:self.arrowImage];
        
        self.timeLabel = [self creatLabel:self.timeLabel  textAlignment:NSTextAlignmentCenter];
        self.destinationImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"4_03"]];
        [self addSubview:self.destinationImage];
        self.destinationLabel = [self creatLabel:self.destinationLabel  textAlignment:NSTextAlignmentCenter];
        self.startTime = [self creatLabel:self.startTime  textAlignment:NSTextAlignmentCenter];
        self.destinationTime = [self creatLabel:self.destinationTime  textAlignment:NSTextAlignmentCenter];
        
        self.Label2 = [self creatLabel:self.Label2 str:@"座位余票:" textAlignment:NSTextAlignmentRight];
        self.leftTicket=[self creatLabel:self.leftTicket textAlignment:NSTextAlignmentLeft];
        self.Label3 = [self creatLabel:self.Label3 str:@"¥" textAlignment:NSTextAlignmentRight];
        self.priceLabel=[self creatLabel:self.priceLabel textAlignment:NSTextAlignmentLeft];
        
        [self.Label1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.mas_left).with.offset(10);
            make.top.equalTo(self.mas_top).with.offset(10);
            make.width.equalTo(@70);
            make.height.equalTo(@20);
        }];
        [self.busLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.Label1.mas_right);
            make.top.equalTo(self.Label1.mas_top);
            make.right.equalTo(self.mas_right).with.offset(-20);
            make.height.equalTo(@20);
        }];
        
        [self.startImage mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.mas_left).with.offset(10);
            make.top.equalTo(self.Label1.mas_bottom).with.offset(10);
            make.right.equalTo(self.startLabel.mas_left);
            make.height.equalTo(@20);
            make.width.equalTo(@30);
        }];
        
        [self.startLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.startImage.mas_right);
            make.right.equalTo(self.arrowImage.mas_left);
            make.centerY.equalTo(self.startImage);
            make.height.equalTo(@20);
            make.width.equalTo(@50);
        }];
        
        [self.arrowImage mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.startLabel.mas_right);
            make.right.equalTo(self.destinationImage.mas_left);
            make.top.equalTo(self.busLabel.mas_bottom).with.offset(10);
            make.height.equalTo(@10);
        }];
        
        [self.timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.arrowImage);
            make.top.equalTo(self.arrowImage.mas_bottom);
            make.width.equalTo(@150);
            make.height.equalTo(@20);
        }];
        
        [self.destinationImage mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.arrowImage.mas_right);
            make.right.equalTo(self.destinationLabel.mas_left);
            make.top.equalTo(self.startImage);
            make.width.equalTo(@30);
            make.height.equalTo(@20);
        }];
        
        [self.destinationLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.destinationImage.mas_right);
            make.right.equalTo(self.mas_right).with.offset(-10);
            make.centerY.equalTo(self.startImage);
            make.width.equalTo(@50);
            make.height.equalTo(@20);
        }];
        
        [self.startTime mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.mas_left).with.offset(30);
            make.top.equalTo(self.startLabel.mas_bottom).with.offset(5);
            make.width.equalTo(@50);
            make.height.equalTo(@20);
        }];
        
        [self.destinationTime mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.mas_right).with.offset(-30);
            make.top.equalTo(self.startLabel.mas_bottom).with.offset(5);
            make.width.equalTo(@50);
            make.height.equalTo(@20);
        }];
        
        [self.Label2 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.mas_left).with.offset(10);
            make.top.equalTo(self.startTime.mas_bottom).with.offset(5);
            make.width.equalTo(@100);
            make.height.equalTo(@20);
        }];
        
        [self.leftTicket mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.Label2.mas_right).with.offset(5);
            make.top.equalTo(self.startTime.mas_bottom).with.offset(5);
            make.width.equalTo(@30);
            make.height.equalTo(@20);
        }];
        
        [self.priceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.mas_right).with.offset(-10);
            make.top.equalTo(self.startTime.mas_bottom).with.offset(5);
            make.width.equalTo(@50);
            make.height.equalTo(@20);
        }];
        
        [self.Label3 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.priceLabel.mas_left);
            make.top.equalTo(self.startTime.mas_bottom).with.offset(5);
            make.width.equalTo(@20);
            make.height.equalTo(@20);
        }];
        
        
    }
    return self;
}

-(UILabel *)creatLabel:(UILabel *)label textAlignment:(NSTextAlignment)textAlignment
{
    label = [[UILabel alloc] init];
    label.textAlignment = textAlignment;
    label.font=[UIFont systemFontOfSize:15];
   // label.backgroundColor=[UIColor redColor];
    [self addSubview:label];
    return label;
}

-(UILabel *)creatLabel:(UILabel *)label str:(NSString *)str textAlignment:(NSTextAlignment)textAlignment
{
    label = [[UILabel alloc] init];
    label.text = str;
 //   label.backgroundColor=[UIColor greenColor];
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
