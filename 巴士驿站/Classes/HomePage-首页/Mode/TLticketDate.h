//
//  TLSearchTableViewMode.h
//  巴士驿站
//
//  Created by ZhangHongxia on 2016/12/1.
//  Copyright © 2016年 Edge. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TLticketDate : NSObject{
   // long leftTicket;      //余票
   // double ticketPrice;          //价格
}

//车次
@property(nonatomic,copy)NSString *carID;
//起始站
@property(nonatomic,copy)NSString *startOffSName;
//终点站
@property(nonatomic,copy)NSString *destinationSName;
//开始时间
@property(nonatomic,copy)NSString *startOffTime;
//结束时间
@property(nonatomic,copy)NSString *endTime;
//用时
@property(nonatomic,copy)NSString *interval;
////余票
////@property(nonatomic,copy)NSString *leftTicket;
//@property(nonatomic,assign)long leftTicket;
@property (nonatomic) long long leftTicket;
//价格
//@property(nonatomic,copy)NSString *ticketPrice;
@property(nonatomic,assign)double ticketPrice;


//@property (assign, readwrite) BOOL select;
-(id)initWithDict:(NSDictionary *)dict;
//-(NSString *)changeTimeType:(NSString *)date;
-(NSString *)dateTimeDifferenceWithStartTime:(NSString *)startTime endTime:(NSString *)endTime;
@end
