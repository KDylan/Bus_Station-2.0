//
//  CalendarCell.m
//  日历选择时间
//
//  Created by Jax on 16/1/28.
//  Copyright © 2016年 Jax. All rights reserved.
//

#import "CalendarCell.h"
#import "NSDate+Extension.h"

#define SCREEN_WIDTH  [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height

@implementation CalendarCell

+ (instancetype)cellWithTableView:(UITableView *)tableView {
    static NSString *CellIdentifier = @"CalendarCell";
    CalendarCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        cell = [[CalendarCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        
    }
    return cell;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self                = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    self.buttonsArray   = [NSMutableArray array];
    self.labelsArray    = [NSMutableArray array];
    self.gridViewsArray = [NSMutableArray array];
    if (self) {
        /* 最多42天 */
        NSInteger totalDays = 42;
        
        CGFloat buttonWidth  = SCREEN_WIDTH / 7;
        CGFloat buttonHeight = 80;
        
        NSInteger row    = 0;
        NSInteger column = 0;
        
        for (NSInteger i = 0; i < totalDays; i ++) {
            row    = i / 7;
            column = i % 7;
            
            UIView *gridView = [[UIView alloc] init];
            [self.contentView addSubview:gridView];
            gridView.frame = CGRectMake(buttonWidth * column, buttonHeight * row, buttonWidth, buttonHeight);
            [gridView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(gridViewOnTap:)]];
            
            UILabel *topLabel      = [[UILabel alloc] init];
            [gridView addSubview:topLabel];
            topLabel.frame         = CGRectMake(0, 10, buttonWidth, 15);
            topLabel.textAlignment = NSTextAlignmentCenter;
            topLabel.font          = [UIFont systemFontOfSize:11];
            
            UIButton *button = [[UIButton alloc] init];
            button.userInteractionEnabled = NO;
            button.frame = CGRectMake(0, 30, 60, 40);
            [gridView addSubview:button];
            
            [self.gridViewsArray addObject:gridView];
            [self.buttonsArray addObject:button];
            [self.labelsArray addObject:topLabel];
        }
        for (int i = 0; i < 6; i ++) {
            CGRect lineFrame         = CGRectMake(0, i * 80, SCREEN_WIDTH, 0.5);
            UIView *lineView         = [[UIView alloc] initWithFrame:lineFrame];
            lineView.backgroundColor = [UIColor lightGrayColor];
            [self.contentView addSubview:lineView];
        }
    }
    return self;
}

- (void)setDateModel:(DateModel *)dateModel {
    _dateModel = dateModel;

    NSInteger month = [NSDate currentMonth];
    NSInteger year = [NSDate currentYear];
    
    NSDate *currentDate = self.dateModel.currentDate;
    NSInteger days = [NSDate numberOfDaysInCurrentMonth:currentDate];
    
    NSInteger currentYear =     [NSDate currentYear:currentDate];
    NSInteger currentMonth = [NSDate currentMonth:currentDate];
    NSInteger currentDay   = [NSDate currentDay:currentDate];
    
    NSInteger firstWeekDay = [NSDate firstWeekDayInMonth:currentDate];

    for (NSInteger i = 0; i < 42; i ++) {
        UIView *gridView = self.gridViewsArray[i];
        UIButton *button = self.buttonsArray[i];
        if (i < firstWeekDay) {
            [button setTitle:@"" forState:UIControlStateNormal];
        } else if (i < firstWeekDay + days) {
            NSString *titleString = [NSString stringWithFormat:@"%ld", (i - firstWeekDay + 1)];
            [button setTitle:titleString forState:UIControlStateNormal];
        } else {
            [button setTitle:@"" forState:UIControlStateNormal];
        }
    
        NSInteger currentYear1 = [NSDate currentYear:currentDate];
        NSInteger currentMonth1 = [NSDate currentMonth:currentDate];
        NSInteger selectedDateNum1 = [[button titleForState:UIControlStateNormal] integerValue];
        
        NSDate *selectedDate = [[NSDate alloc] init];
        if (selectedDateNum1 > 0) {
            NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
            [dateFormatter setDateFormat:@"yyyy-MM-dd"];
            NSString *selectedDateString = [NSString stringWithFormat:@"%ld-%ld-%ld", (long)currentYear1, (long)currentMonth1, (long)selectedDateNum1];
            selectedDate = [dateFormatter dateFromString:selectedDateString];
        } else {
            selectedDate = nil;
        }
        
        UILabel *label = self.labelsArray[i];
        
        if (currentYear == year && currentMonth == month && currentDay + firstWeekDay - 1 == i) {
            label.text = @"今天";
            label.textColor = [UIColor redColor];
            [button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
            label.textAlignment = NSTextAlignmentCenter;
        } else if (currentMonth == 1 && selectedDateNum1 == 1) {
            label.text = @"元旦";
            label.textAlignment = NSTextAlignmentCenter;
            label.textColor = [UIColor redColor];
            [button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        } else {
            label.text = @"";
        }
        
        if ((currentYear < year) ||
            (currentYear == year && currentMonth < month) ||
            (currentYear == year && currentMonth == month && i < currentDay + firstWeekDay - 1) ) {
            [button setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
            gridView.userInteractionEnabled = NO;
        } else {
            if ([NSDate isWeekendWithDate:selectedDate]) {
                [button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
            } else {
                [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            }
            gridView.userInteractionEnabled = YES;
        }

    }
}

+ (CGFloat)rowHeigth:(DateModel *)dateModel {
    NSInteger weeks = [NSDate numberOfWeeksInCurrentMonth:dateModel.currentDate
                       ];
    return weeks * 80;
}

- (void)gridViewOnTap:(UITapGestureRecognizer *)tap {

    NSDate *currentDate = self.dateModel.currentDate;
    NSInteger days = [NSDate numberOfDaysInCurrentMonth:currentDate];
    NSInteger selectedDateNum = 0;
    for (int i = 0; i < tap.view.subviews.count; i ++) {
        if ([tap.view.subviews[i] isKindOfClass:[UIButton class]]) {
            UIButton *btn = (UIButton *)tap.view.subviews[i];
            NSString *btnTitle = [btn titleForState:UIControlStateNormal];
            if ([btnTitle isEqualToString:@""] || btnTitle == nil) {
                return ;
            }
            selectedDateNum = [btn.titleLabel.text integerValue];
            if(selectedDateNum > days || selectedDateNum < 0) return;
            break;
        }
    }
    
    
    DateModel *returnDateModel = [[DateModel alloc] init];
    returnDateModel.currentDate = currentDate;
    returnDateModel.selectedDateNum = selectedDateNum;
    if ([self.delegate respondsToSelector:@selector(calendarCellButtonClicked:)]) {
        [self.delegate calendarCellButtonClicked:returnDateModel];
    }
    
}

@end
