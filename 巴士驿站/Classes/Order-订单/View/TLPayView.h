//
//  TLPayView.h
//  巴士驿站
//
//  Created by 胡潇炜 on 16/7/14.
//  Copyright © 2016年 Edge. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TLPayView : UIView

@property(nonatomic,strong)UILabel *name;

@property(nonatomic,strong)UILabel *number;

@property(nonatomic,strong)UIButton *payButton;
@property(nonatomic,assign)double payPrice;

-(id)initWithFrame:(CGRect)frame payNumber:(double)payPrice;
-(void)payClick:(double)payPrice;

@end
