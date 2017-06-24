//
//  CalendarCell.h
//  日历选择时间
//
//  Created by Jax on 16/1/28.
//  Copyright © 2016年 Jax. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DateModel.h"

#define SCREEN_WIDTH [UIScreen  mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height

@protocol CalendarCellDelegate <NSObject>

@optional

- (void)calendarCellButtonClicked:(DateModel *)date;

@end



@interface CalendarCell : UITableViewCell

@property (nonatomic, strong) DateModel *dateModel;

@property (nonatomic, strong) NSMutableArray *buttonsArray;
@property (nonatomic, strong) NSMutableArray *labelsArray;
@property (nonatomic, strong) NSMutableArray *gridViewsArray;

+ (instancetype)cellWithTableView:(UITableView *)tableView;
+ (CGFloat)rowHeigth:(DateModel *)dateModel;

@property (nonatomic, assign) id<CalendarCellDelegate> delegate;

@end
