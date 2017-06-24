//
//  TLContactsDetailView.m
//  巴士驿站
//
//  Created by mac on 16/12/2.
//  Copyright © 2016年 Edge. All rights reserved.
//

#import "TLContactsDetailView.h"
#import "Masonry.h"
@implementation TLContactsDetailView

/**
 *  自定义联系人信息
 *
 */
-(id)initWithFrame:(CGRect)frame
{
    if (self=[super initWithFrame:frame]) {
        
        self.backgroundColor = [UIColor whiteColor];
        self.nameLabel = [self creatLabel:self.nameLabel str:@"李刚" textAlignment:NSTextAlignmentLeft];
        
        self.teleLabel = [self creatLabel:self.teleLabel str:@"18256777846" textAlignment:NSTextAlignmentLeft];
        //
        //        self.priceLabel = [self creatLabel:self.priceLabel str:@"票价:¥" textAlignment:NSTextAlignmentLeft];
        //
        //        self.priceNumberLabel = [self creatLabel:self.priceNumberLabel str:@"185.0" textAlignment:NSTextAlignmentLeft];
        
//        self.identityLabel = [self creatLabel:self.identityLabel str:@"41138712897313" textAlignment:NSTextAlignmentRight];
//        
        [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.mas_left).with.offset(10);
            make.top.equalTo(self.mas_top).with.offset(10);
            make.width.equalTo(@80);
            make.height.equalTo(@30);
        }];
        
        [self.teleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.nameLabel);
            make.top.equalTo(self.nameLabel.mas_bottom);
            make.width.equalTo(@120);
            make.height.equalTo(@30);
        }];
        
        //        [self.priceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        //            make.left.equalTo(self.nameLabel);
        //            make.top.equalTo(self.teleLabel.mas_bottom);
        //            make.width.equalTo(@50);
        //            make.height.equalTo(@30);
        //        }];
        //
        //        [self.priceNumberLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        //            make.left.equalTo(self.priceLabel.mas_right);
        //            make.top.equalTo(self.teleLabel.mas_bottom);
        //            make.width.equalTo(@80);
        //            make.height.equalTo(@30);
        //        }];
        //
//        [self.identityLabel mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.right.equalTo(self.mas_right);
//            make.top.equalTo(self.teleLabel);
//            make.width.equalTo(@180);
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
