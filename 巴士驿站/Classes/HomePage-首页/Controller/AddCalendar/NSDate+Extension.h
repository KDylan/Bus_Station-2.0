//
//  NSDate+Extension.h
//  日历选择时间
//
//  Created by Jax on 16/1/28.
//  Copyright © 2016年 Jax. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (Extension)

+ (NSInteger)currentYear;
+ (NSInteger)currentMonth;
+ (NSInteger)currentDay;
+ (NSInteger)numberOfDaysInCurrentMonth;
+ (NSInteger)numberOfWeeksInCurrentMonth;
+ (NSInteger)firstWeekDayInMonth;


+ (NSDate *)lastMonthDate;
+ (NSDate *)nextMonthDate;
+ (NSDate *)lastMonthDate:(NSDate *)date;
+ (NSDate *)nextMonthDate:(NSDate *)date;

+ (NSInteger)currentYear:(NSDate *)date;
+ (NSInteger)currentMonth:(NSDate *)date;
+ (NSInteger)currentDay:(NSDate *)date;
+ (NSInteger)numberOfDaysInCurrentMonth:(NSDate *)date;
+ (NSInteger)numberOfWeeksInCurrentMonth:(NSDate *)date;
+ (NSInteger)firstWeekDayInMonth:(NSDate *)date;

+ (BOOL)isWeekendWithDate:(NSDate *)date;
+ (NSString *)getweekDayWithDate:(NSDate *)date;

@end
