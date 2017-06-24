//
//  TLSiteDetailView.h
//  巴士驿站
//
//  Created by 胡潇炜 on 16/7/13.
//  Copyright © 2016年 Edge. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TLSiteDetailView : UIView

@property(nonatomic,strong)UILabel *startLabel;

@property(nonatomic,strong)UILabel *destinationLabel;

@property(nonatomic,strong)UIImageView *arrowImage;

@property(nonatomic,strong)UILabel *coachNumberLabel;

@property(nonatomic,strong)UILabel *ticketNumberLabel;

@property(nonatomic,strong)UILabel *orderNumber;

@property(nonatomic,strong)UILabel *orderNumbertext;

@property(nonatomic,strong)UILabel *departureTime;

@property(nonatomic,strong)UILabel *departureTimetext;
@end
