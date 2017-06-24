//
//  TLSearchTableViewMode.m
//  巴士驿站
//
//  Created by ZhangHongxia on 2016/12/1.
//  Copyright © 2016年 Edge. All rights reserved.
//

#import "TLticketDate.h"

@implementation TLticketDate

-(id)initWithDict:(NSDictionary *)dict
{
    if (self=[super init]) {
      
        self.carID=dict[@"CarID"][@"PlateNumber"];
        self.startOffSName=dict[@"TicketStartOffStation"];
        self.destinationSName=dict[@"TicketDestinationStation"];
        self.startOffTime=dict[@"CarID"][@"StartOffTime"];
        self.endTime=dict[@"CarID"][@"EndTime"];
     
        
        
        self.leftTicket =[dict[@"TicketLeftNumber"] longLongValue];
       
        self.ticketPrice = [dict[@"TicketPrice"] doubleValue];
        

       // NSLog(@"-------------%lld",self.leftTicket);
   //     NSLog(@"-------------%lf",self.ticketPrice);

        self.interval=[self dateTimeDifferenceWithStartTime:_startOffTime endTime:_endTime];
    }
    return self;
}

//-(NSString *)changeTimeType:(NSString *)date
//{
//    
//}

//计算时间差
-(NSString *)dateTimeDifferenceWithStartTime:(NSString *)startTime endTime:(NSString *)endTime{
    NSArray *timeArray1=[startTime componentsSeparatedByString:@"."];
    startTime=[timeArray1 objectAtIndex:0];
    
    NSArray *timeArray2=[endTime componentsSeparatedByString:@"."];
    endTime=[timeArray2 objectAtIndex:0];
    
 //   NSLog(@"%@.....%@",startTime,endTime);
    NSDateFormatter *date=[[NSDateFormatter alloc] init];
    [date setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    
    NSDate *d1=[date dateFromString:startTime];
    
    NSTimeInterval late1=[d1 timeIntervalSince1970]*1;
    
    
    NSDate *d2=[date dateFromString:endTime];
    
    NSTimeInterval late2=[d2 timeIntervalSince1970]*1;
    
    NSTimeInterval cha=late2-late1;
    NSString *timeString=@"";
    NSString *house=@"";
    NSString *min=@"";
    NSString *sen=@"";
    
//    sen = [NSString stringWithFormat:@"%d", (int)cha%60];
//    //    秒
//    sen=[NSString stringWithFormat:@"%@", sen];
    
    min = [NSString stringWithFormat:@"%d", (int)cha/60%60];
    //    分
    min=[NSString stringWithFormat:@"%@", min];
    
    //    小时
    house = [NSString stringWithFormat:@"%d", (int)cha/3600];
    
    house=[NSString stringWithFormat:@"%@", house];
    
    timeString=[NSString stringWithFormat:@"%@时%@分",house,min];
        return timeString;
}

@end
