//
//  ViewController.m
//  日历选择时间
//
//  Created by Jax on 16/1/28.
//  Copyright © 2016年 Jax. All rights reserved.
//

#import "NiceCalendarController.h"
#import "NSDate+Extension.h"
#import "CalendarCell.h"

static CGFloat kHeadViewHeigth = 28.f;

@interface NiceCalendarController ()<UITableViewDataSource, UITableViewDelegate, CalendarCellDelegate>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *dateModelsArray;

@property (strong, nonatomic) NSDate *tempDate;
@end

@implementation NiceCalendarController


#pragma mark - 懒加载

- (NSMutableArray *)dateModelsArray {
    if (_dateModelsArray == nil) {
        _dateModelsArray = [NSMutableArray array];
    }
    return _dateModelsArray;
}

#pragma mark - view life

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"选择日期";
    //  设置CGRectZero从导航栏下开始计算
    if ([self respondsToSelector:@selector(setEdgesForExtendedLayout:)]) {
        self.edgesForExtendedLayout = UIRectEdgeNone;
    }
    
    [self getLastDate];
    [self getCurrentDate];
    [self getNextDate];
    
    [self configHeadView];
    [self configTableView];
    
}

- (void)configTableView {
    self.tableView= [[UITableView alloc] initWithFrame:CGRectMake(0, 25, SCREEN_WIDTH, SCREEN_HEIGHT - 25) style:UITableViewStylePlain];
    [self.view addSubview:self.tableView];
    self.tableView.dataSource      = self;
    self.tableView.delegate        = self;
    self.tableView.backgroundColor = [UIColor lightGrayColor];
    self.tableView.tableFooterView = [[UIView alloc] init];
    
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:self.dateModelsArray.count / 2];
    [self.tableView scrollToRowAtIndexPath:indexPath atScrollPosition:UITableViewScrollPositionTop animated:NO];
}

- (void)configHeadView {
    
    NSArray *array = @[@"周日", @"周一", @"周二", @"周三", @"周四", @"周五", @"周六"];
    
    UIView *headView = [[UIView alloc] init];
    headView.frame = CGRectMake(0, 0, SCREEN_WIDTH, 25);
    headView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:headView];
    CGFloat width = SCREEN_WIDTH / 7;
    for (int i = 0; i < 7 ; i ++) {
        UILabel *label = [[UILabel alloc] init];
        [headView addSubview:label];
        label.frame = CGRectMake(width * i, 0, width, 25);
        label.text = array[i];
        label.textAlignment = NSTextAlignmentCenter;
        label.textColor = [UIColor blackColor];
    }
}

#pragma mark - UITableView data delegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.dateModelsArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)   indexPath {
    CalendarCell *calendarCell = [CalendarCell cellWithTableView:tableView];
    calendarCell.delegate = self;
    calendarCell.selectionStyle = UITableViewCellSelectionStyleNone;
    calendarCell.tag = indexPath.section;
    calendarCell.dateModel = self.dateModelsArray[indexPath.section];
    return calendarCell;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    
    DateModel *dateModel = self.dateModelsArray[section];
    
    UIView *tableHeadView = [[UIView alloc] init];
    tableHeadView.backgroundColor = [UIColor whiteColor];
    
    UILabel *label = [[UILabel alloc] init];
    [tableHeadView addSubview:label];
    label.textAlignment = NSTextAlignmentCenter;
    label.frame = CGRectMake(0, 0, SCREEN_WIDTH, kHeadViewHeigth);
    label.textColor = [UIColor blackColor];
    NSInteger currentYear = [NSDate currentYear:dateModel.currentDate];
    NSInteger currentMonth = [NSDate currentMonth:dateModel.currentDate];
    label.text = [NSString stringWithFormat:@"%ld年%ld月", (long)currentYear, (long)currentMonth];
    for (int i = 0; i < 2; i ++) {
        CGRect lineFrame = CGRectMake(0, i * kHeadViewHeigth, SCREEN_WIDTH, 0.5);
        UIView *lineView = [[UIView alloc] initWithFrame:lineFrame];
        [tableHeadView addSubview:lineView];
        lineView.backgroundColor = [UIColor lightGrayColor];
    }
    
    return tableHeadView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return kHeadViewHeigth;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [CalendarCell rowHeigth:self.dateModelsArray[indexPath.section]];
}

#pragma mark - 数据源
- (void)getLastDate {
    NSDate *lastMonthDate = [NSDate lastMonthDate];
    for (int i = 0; i < 12; i ++) {
        DateModel *dateModel = [[DateModel alloc] init];
        dateModel.currentDate = lastMonthDate;
        [self.dateModelsArray insertObject:dateModel atIndex:0];
        lastMonthDate = [NSDate lastMonthDate:lastMonthDate];
    }
}

- (void)getCurrentDate {
    DateModel *dateModel = [[DateModel alloc] init];
    dateModel.currentDate = [NSDate date];
    [self.dateModelsArray addObject:dateModel];
}

- (void)getNextDate {
    
    NSInteger currentYear = [NSDate currentYear];
    NSInteger currentMonth = [NSDate currentMonth];
    NSString *currentDateString = [NSString stringWithFormat:@"%ld-%ld", (long)currentYear, (long)currentMonth];
    NSDateFormatter *ft = [[NSDateFormatter alloc] init];
    [ft setDateFormat:@"yyyy-MM"];
    NSDate *currentMonthDate = [ft dateFromString:currentDateString];
    
    for (int i = 0; i < 12; i ++) {
        NSDate *nextMonthDate = [NSDate nextMonthDate:currentMonthDate];
        DateModel *dateModel = [[DateModel alloc] init];
        dateModel.currentDate = nextMonthDate;
        [self.dateModelsArray addObject:dateModel];
        currentMonthDate = nextMonthDate;
    }
}

- (void)calendarCellButtonClicked:(DateModel *)date {
   
   
    NSDate *returnDate = date.currentDate;
    NSInteger selectedDateNum = date.selectedDateNum;
    
    NSInteger currentYear = [NSDate currentYear:returnDate];
    NSInteger currentMonth = [NSDate currentMonth:returnDate];
   // NSInteger days = [NSDate numberOfDaysInCurrentMonth];
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
 //   NSString *selectedDateString = [NSString stringWithFormat:@"%ld-%ld-%ld", currentYear, currentMonth, selectedDateNum];
    //NSDate *selectedDate = [dateFormatter dateFromString:selectedDateString];
    
   // NSString *weekDayString = [NSDate getweekDayWithDate:selectedDate];
    
  //  NSString *string = [NSString stringWithFormat:@"%ld年%ld月%ld号 %@", currentYear, currentMonth, selectedDateNum, weekDayString];
    
    NSString *string = [NSString stringWithFormat:@"%ld年%ld月%ld日", (long)currentYear, (long)currentMonth,selectedDateNum];
     self.DateBlock(string);
     [self.navigationController popViewControllerAnimated:YES];
    
//    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示信息" message:string delegate:nil cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
//    [alert show];
}

@end
