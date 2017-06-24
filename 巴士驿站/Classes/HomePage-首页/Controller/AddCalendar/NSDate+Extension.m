//
//  NSDate+Extension.m
//  日历选择时间
//
//  Created by Jax on 16/1/28.
//  Copyright © 2016年 Jax. All rights reserved.
//

#import "NSDate+Extension.h"

@implementation NSDate (Extension)


+ (NSInteger)currentYear {
    NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDateComponents *components = [gregorian components:NSCalendarUnitYear fromDate:[self date]];
    return [components year];
}
+ (NSInteger)currentMonth {
    NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDateComponents *components = [gregorian components:NSCalendarUnitMonth fromDate:[self date]];
    return [components month];
}
+ (NSInteger)currentDay {
    NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDateComponents *components = [gregorian components:NSCalendarUnitDay fromDate:[self date]];

    return [components day];
}



+ (NSInteger)numberOfDaysInCurrentMonth {
    return [[NSCalendar currentCalendar] rangeOfUnit:NSCalendarUnitDay inUnit:NSCalendarUnitMonth forDate:[self new]].length;
}

+ (NSInteger)numberOfWeeksInCurrentMonth {
    NSInteger weeks = 0;
    NSInteger weekday = [self firstWeekDayInMonth];
    if (weekday >= 0) {
        weeks += 1;
    }
    NSInteger monthDays = [self numberOfDaysInCurrentMonth];
    weeks = weeks + (monthDays + (7 - weekday)) / 7;
    if ((monthDays - (7 - weekday)) % 7 > 0) {
        weeks += 1;
    }
    return weeks;
}



+ (NSInteger)firstWeekDayInMonth {
    NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    [gregorian setFirstWeekday:1];
    
    NSDateComponents *components = [gregorian components:NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay fromDate:[self date]];
    [components setDay:1];
    NSDate *newDate = [gregorian dateFromComponents:components];
    
    NSUInteger firstWeekday = [gregorian ordinalityOfUnit:NSCalendarUnitWeekday inUnit:NSCalendarUnitWeekOfMonth forDate:newDate];
    return firstWeekday - 1;;
}



+ (NSDate *)lastMonthDate {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *components = [calendar components:(NSCalendarUnitWeekday | NSCalendarUnitMonth |NSCalendarUnitYear | NSCalendarUnitDay) fromDate:[self date]];
    if ([components month] == 1) {
        [components setMonth:12];
        [components setYear:[components year] -1];
    } else {
        [components setMonth:[components month] - 1];
    }
    NSDate *lastMonthDate = [calendar dateFromComponents:components];
    return lastMonthDate;
}
+ (NSDate *)nextMonthDate {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *components = [calendar components:(NSCalendarUnitWeekday | NSCalendarUnitMonth |NSCalendarUnitYear | NSCalendarUnitDay) fromDate:[self date]];
    if ([components month] == 12) {
        [components setMonth:1];
        [components setYear:[components year] + 1];
    } else {
        [components setMonth:[components month] + 1];
    }
    NSDate *nextMontDate = [calendar dateFromComponents:components];
    return nextMontDate;
}

+ (NSDate *)lastMonthDate:(NSDate *)date {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *components = [calendar components:(NSCalendarUnitWeekday | NSCalendarUnitMonth |NSCalendarUnitYear | NSCalendarUnitDay) fromDate:date];
    if ([components month] == 1) {
        [components setMonth:12];
        [components setYear:[components year] -1];
    } else {
        [components setMonth:[components month] - 1];
    }
    NSDate *lastMonthDate = [calendar dateFromComponents:components];
    return lastMonthDate;
}
+ (NSDate *)nextMonthDate:(NSDate *)date {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *components = [calendar components:(NSCalendarUnitWeekday | NSCalendarUnitMonth |NSCalendarUnitYear | NSCalendarUnitDay) fromDate:date];
    if ([components month] == 12) {
        [components setMonth:1];
        [components setYear:[components year] + 1];
    } else {
        [components setMonth:[components month] + 1];
    }
    NSDate *nextMontDate = [calendar dateFromComponents:components];
    return nextMontDate;
}


+ (NSInteger)currentYear:(NSDate *)date {
    NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDateComponents *components = [gregorian components:NSCalendarUnitYear fromDate:date];
    return [components year];
}
+ (NSInteger)currentMonth:(NSDate *)date {
    NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDateComponents *components = [gregorian components:NSCalendarUnitMonth fromDate:date];
    return [components month];
}
+ (NSInteger)currentDay:(NSDate *)date {
    NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDateComponents *components = [gregorian components:NSCalendarUnitDay fromDate:date];
    
    return [components day];
}



+ (NSInteger)numberOfDaysInCurrentMonth:(NSDate *)date {
    return [[NSCalendar currentCalendar] rangeOfUnit:NSCalendarUnitDay inUnit:NSCalendarUnitMonth forDate:date].length;
}
+ (NSInteger)numberOfWeeksInCurrentMonth:(NSDate *)date {
    NSInteger weeks = 0;
    NSInteger weekday = [self firstWeekDayInMonth:date];
    if (weekday >= 0) {
        weeks += 1;
    }
    NSInteger monthDays = [self numberOfDaysInCurrentMonth:date];
    weeks = weeks + (monthDays - (7 - weekday)) / 7;
    if ((monthDays - (7 - weekday)) % 7 > 0) {
        weeks += 1;
    }
    return weeks;
}



+ (NSInteger)firstWeekDayInMonth:(NSDate *)date {
    NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    [gregorian setFirstWeekday:1];
    
    NSDateComponents *components = [gregorian components:NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay fromDate:date];
    [components setDay:1];
    NSDate *newDate = [gregorian dateFromComponents:components];
    
    NSUInteger firstWeekday = [gregorian ordinalityOfUnit:NSCalendarUnitWeekday inUnit:NSCalendarUnitWeekOfMonth forDate:newDate];
    return firstWeekday - 1;;
}

+ (BOOL)isWeekendWithDate:(NSDate *)date {
    
    if (date == NULL || date == nil) {
        return NO;
    }
    
    NSCalendar * calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDateComponents *comps = [calendar components:NSCalendarUnitWeekday fromDate:date];
    NSInteger weekday = [comps weekday];
    return (weekday == 1 || weekday == 7);
}
    

+ (NSString *)getweekDayWithDate:(NSDate *) date
{
    NSCalendar * calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDateComponents *comps = [calendar components:NSCalendarUnitWeekday fromDate:date];
    
    // 1 是周日，2是周一 3.以此类推
    NSString *weekdayString = @"";
    NSInteger weekday = [comps weekday];
    switch (weekday) {
        case 1:
            weekdayString = @"星期日";
            break;
        case 2:
            weekdayString = @"星期一";
            break;
        case 3:
            weekdayString = @"星期二";
            break;
        case 4:
            weekdayString = @"星期三";
            break;
        case 5:
            weekdayString = @"星期四";
            break;
        case 6:
            weekdayString = @"星期五";
            break;
        case 7:
            weekdayString = @"星期六";
            break;
        default:
            break;
    }
    return weekdayString;
    
}
@end
