//
//  TLNotPaidOrderTableViewCell.m
//  巴士驿站
//
//  Created by mac on 16/12/2.
//  Copyright © 2016年 Edge. All rights reserved.
//

#import "TLNotPaidOrderTableViewCell.h"
#import "Masonry.h"
@implementation TLNotPaidOrderTableViewCell

/**
 *  自定义订单cell的初始化函数重写
 */
-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self=[super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        //        self.busLabel = [self creatLabel:self.busLabel str:@"汽车票" textAlignment:NSTextAlignmentLeft];
        //
        self.stateLabel = [self creatLabel:self.stateLabel str:@"待付款" textAlignment:NSTextAlignmentRight];
        self.stateLabel.font=[UIFont systemFontOfSize:12.0];
        self.stateLabel.textColor=[UIColor greenColor];
        self.startLabel = [self creatLabel:self.startLabel str:@"杭州西湖站-" textAlignment:NSTextAlignmentLeft];
        
        self.destinationLabel = [self creatLabel:self.destinationLabel str:@"温州南站" textAlignment:NSTextAlignmentRight];
        
        //        self.timeLabel = [self creatLabel:self.timeLabel str:@"出发时间:" textAlignment:NSTextAlignmentLeft];
        self.dateLabel = [self creatLabel:self.dateLabel str:@"2016-10-01 09:55" textAlignment:NSTextAlignmentLeft];
        self.dateLabel.font=[UIFont systemFontOfSize:12.0];
        self.priceLabel = [self creatLabel:self.priceLabel str:@"¥252.0" textAlignment:NSTextAlignmentRight];
        self.priceLabel.textColor=[UIColor redColor];
        self.arrowImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"appbar.next"]];
        [self addSubview:self.arrowImage];
        [self.arrowImage mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.mas_left);
            make.width.equalTo(self.arrowImage);
            make.height.equalTo(self.arrowImage);
            make.centerY.equalTo(self.mas_centerY);
            
        }];
        
        [self.startLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.arrowImage.mas_right).with.offset(20);
            make.top.equalTo(self.mas_top).with.offset(20);
            make.height.equalTo(@20);
            make.width.equalTo(self.startLabel);
            
        }];
        
        [self.destinationLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.startLabel.mas_right);
            make.top.equalTo(self.mas_top).with.offset(20);
            make.height.equalTo(@20);
            make.width.equalTo(self.destinationLabel);
        }];
        
        [self.dateLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.arrowImage.mas_right).with.offset(20);
            make.bottom.equalTo(self.mas_bottom).with.offset(-20);
            make.height.equalTo(@20);
            make.width.equalTo(self.dateLabel);
        }];
        [self.priceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.mas_right).with.offset(-10);
            make.top.equalTo(self.mas_top).with.offset(20);
            make.width.equalTo(self.priceLabel);
            make.height.equalTo(@30);
        }];
        [self.stateLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.mas_right).with.offset(-10);
            make.bottom.equalTo(self.mas_bottom).with.offset(-20);
            make.height.equalTo(@20);
            make.width.equalTo(self.stateLabel);
        }];
        //
        
        
        //       [self.timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        //                make.left.equalTo(self.busLabel);
        //                make.right.equalTo(self.dateLabel.mas_left);
        //                 make.top.equalTo(self.startLabel.mas_bottom).with.offset(10);
        //                make.width.equalTo(@80);
        //                make.height.equalTo(@20);
        //              }];
        //                }];
        
        
        
        //        self.cancelButton = [UIButton buttonWithType:UIButtonTypeCustom];
        //        [self.cancelButton setTitle:@"取消订单" forState:UIControlStateNormal];
        //        [self.cancelButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        //        [self.cancelButton addTarget:self action:@selector(cancelButtonPressed) forControlEvents:UIControlEventTouchUpInside];
        //        //title字体大小
        //        self.cancelButton.titleLabel.font = [UIFont systemFontOfSize:18];
        //        //设置title的字体居中
        //        self.cancelButton.titleLabel.textAlignment = NSTextAlignmentCenter;
        //        [self.cancelButton.layer setMasksToBounds:YES];
        //        [self.cancelButton.layer setCornerRadius:2.0];
        //        [self.cancelButton.layer setBorderWidth:2.0];
        //        CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
        //        CGColorRef colorref = CGColorCreate(colorSpace,(CGFloat[]){ 0, 0, 1, 1 });//R,G,B,alpha
        //        [self.cancelButton.layer setBorderColor:colorref];
        //        [self addSubview:self.cancelButton];
        
        //        self.payButton = [UIButton buttonWithType:UIButtonTypeCustom];
        //        [self.payButton setTitle:@"支付" forState:UIControlStateNormal];
        //        [self.payButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        //        [self.payButton addTarget:self action:@selector(payButtonPressed) forControlEvents:UIControlEventTouchUpInside];
        //        //title字体大小
        //        self.payButton.titleLabel.font = [UIFont systemFontOfSize:18];
        //        //设置title的字体居中
        //        self.payButton.titleLabel.textAlignment = NSTextAlignmentCenter;
        //        [self.payButton.layer setMasksToBounds:YES];
        //        [self.payButton.layer setCornerRadius:2.0];
        //        [self.payButton.layer setBorderWidth:2.0];
        //        [self.payButton.layer setBorderColor:colorref];
        //        [self addSubview:self.payButton];
        
        
        //        [self.busLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        //            make.left.equalTo(self.mas_left).with.offset(30);
        //            make.top.equalTo(self.mas_top).with.offset(15);
        //            make.height.equalTo(@20);
        //            make.width.equalTo(@60);
        //        }];
        //
        //
        
        ////        [self.cancelButton mas_makeConstraints:^(MASConstraintMaker *make) {
        ////            make.left.equalTo(self.priceLabel.mas_right).with.offset(10);
        ////            make.right.equalTo(self.payButton.mas_left).with.offset(-10);
        ////            make.top.equalTo(self.timeLabel.mas_bottom).with.offset(5);
        ////            make.width.equalTo(self.payButton);
        ////            make.height.equalTo(@30);
        ////        }];
        ////
        ////        [self.payButton mas_makeConstraints:^(MASConstraintMaker *make) {
        ////            make.left.equalTo(self.cancelButton.mas_right).with.offset(10);
        ////            make.right.equalTo(self.stateLabel);
        ////            make.top.equalTo(self.timeLabel.mas_bottom).with.offset(5);
        ////            make.width.equalTo(self.priceLabel);
        ////            make.height.equalTo(@30);
        ////        }];
        
    }
    return self;
}

/**
 *  Label的创建函数
 *
 *  @param label         label
 *  @param str           label的上的文字
 *  @param textAlignment label上文字的位置
 *
 *  @return 返回UILabel类型
 */
-(UILabel *)creatLabel:(UILabel *)label str:(NSString *)str textAlignment:(NSTextAlignment)textAlignment
{
    label = [[UILabel alloc] init];
    label.text = str;
    label.textAlignment = textAlignment;
    [self addSubview:label];
    return label;
}

-(void)cancelButtonPressed
{
    
}

-(void)payButtonPressed
{
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}


@end
