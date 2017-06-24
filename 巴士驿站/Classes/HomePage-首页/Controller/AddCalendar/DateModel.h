//
//  DateModel.h
//  MyCalendar
//
//  Created by Jax on 16/6/12.
//  Copyright © 2016年 Jax. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DateModel : NSObject
@property (assign, nonatomic) NSInteger dayValue;
@property (nonatomic, strong) NSDate    *currentDate;
@property (nonatomic, assign) NSInteger selectedDateNum;

@end
