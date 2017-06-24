//
//  TLSearchTableViewController.m
//  巴士驿站
//
//  Created by f on 16/7/28.
//  Copyright © 2016年 Edge. All rights reserved.
//

#import "TLSearchTableViewController.h"
#import "TLSearchTableViewCell.h"
#import "TLWriteOrderTableViewController.h"
#import "LoginViewController.h"
#import "TLticketDate.h"
//#import "Masonry.h"
@interface TLSearchTableViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    NSMutableArray *tkResultArray;
    TLticketDate *tkDict;
}
@property(nonatomic,weak)UIView *m_headView;
@property(nonatomic,weak)UITableView *tableView;

@end

@implementation TLSearchTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    tkResultArray= [[NSMutableArray alloc] init];
    self.tabBarItem.tag=0;
    self.title = @"查询";
    [self requesrServices];
    [self addTableView];
    [self addHeaderView];
    
    
    
   
  //   NSLog(@"%d",tkResultArray.count);
  }

#pragma mark - Table view data source

-(void )addTableView{
    
    UITableView *tableView = [[UITableView alloc]initWithFrame:CGRectMake(0,0, self.view.bounds.size.width, self.view.bounds.size.height)];
    self.tableView=tableView;
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.tableView.tableFooterView = [[UIView alloc]init];
    self.tableView.backgroundColor = [UIColor colorWithRed:0.9278 green:0.9179 blue:0.9377 alpha:1.0];
    //  让分割线消失
    //  self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;//  取消分割线

    [self.view addSubview: self.tableView];
}
//  添加headView
-(void)addHeaderView{
    
    UIView *m_headView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width,40)];
    self.m_headView=m_headView;
    self.m_headView.backgroundColor = [UIColor colorWithRed:0.9278 green:0.9179 blue:0.9377 alpha:1.0];
    [self.view addSubview: self.m_headView];
    self.tableView.tableHeaderView= self.m_headView;
    
    UILabel *label = [[UILabel alloc]init];
    
    label.text = _TicketDate;
    label.textAlignment = NSTextAlignmentCenter;
    [self.m_headView addSubview:label];
    
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.m_headView).with.offset(15);
        make.left.equalTo(self.view).offset(50);
        make.width.equalTo(@130);
        make.height.equalTo(@15);
    }];
    UILabel *label1 = [[UILabel alloc]init];
    
    NSDateFormatter *dataFormatter = [[NSDateFormatter alloc] init];
    [dataFormatter setDateFormat:@"YYYY-MM-dd"];
    NSDate *date = [dataFormatter dateFromString:_TicketDate];
    
    NSString *weekStr=[self weekdayStringFromDate:date] ;
    
    label1.text = weekStr;
    label1.textAlignment = NSTextAlignmentCenter;
       [self.m_headView addSubview:label1];
    
    [label1 mas_makeConstraints:^(MASConstraintMaker *make) {
//      make.top.equalTo(self.m_headView).with.offset(15);
        make.right.equalTo(self.view).offset(-80);
        make.centerY.equalTo(label.mas_centerY);
        make.width.equalTo(@70);
        make.height.equalTo(@15);
    }];
}

//根据日期将返回星期几
-(NSString*)weekdayStringFromDate:(NSDate*)inputDate {
    
    NSArray *weekdays = [NSArray arrayWithObjects: [NSNull null], @"星期天", @"星期一", @"星期二", @"星期三", @"星期四", @"星期五", @"星期六", nil];
    
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    
    NSTimeZone *timeZone = [[NSTimeZone alloc] initWithName:@"Asia/Shanghai"];
    
    [calendar setTimeZone: timeZone];
    
    NSCalendarUnit calendarUnit = NSWeekdayCalendarUnit;
    
    NSDateComponents *theComponents = [calendar components:calendarUnit fromDate:inputDate];
    
    return [weekdays objectAtIndex:theComponents.weekday];
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return tkResultArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *ID = @"cell";
    TLSearchTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    if (!cell) {
        cell = [[TLSearchTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    if (indexPath.row >=1) {
        // 用view来画分割线
        UIView *customLine = [[UIView alloc] init];
        customLine.frame = CGRectMake(cell.frame.origin.x, cell.frame.origin.y, self.view.frame.size.width+55, 10);
        customLine.backgroundColor =  [UIColor colorWithRed:0.9278 green:0.9179 blue:0.9377 alpha:1.0];
        [cell.contentView addSubview:customLine];
    }
    TLticketDate *date=tkResultArray[indexPath.row] ;
  
    cell.busLabel.text=date.carID;
    cell.startLabel.text=date.startOffSName;
    cell.destinationLabel.text=date.destinationSName;
    
    //
    cell.startTime.text=[[date.startOffTime substringFromIndex:date.startOffTime.length - 8] substringToIndex:5];
   // NSLog(@"%@",cell.startTime.text);
  //  cell.startTime.text=date.startOffTime;
    cell.destinationTime.text=[[date.endTime substringFromIndex:date.endTime.length - 8] substringToIndex:5];
    cell.timeLabel.text=date.interval;
    
    //LongLong转NSString
    NSNumber *longlongNumber = [NSNumber numberWithLongLong:date.leftTicket] ;
    cell.leftTicket.text = [longlongNumber stringValue];
    
    //double转NSString
    cell.priceLabel.text=[NSString stringWithFormat:@"%.1f",date.ticketPrice];
    return cell;
}
//  选择弹出登录框
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
//    TLWriteOrderTableViewController *vc = [[TLWriteOrderTableViewController alloc]init];
//    [self.navigationController pushViewController:vc animated:YES];
  
    
    //以下为完整部分，判断是否登录。
    NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
    NSString *name = [userDefault objectForKey:@"userName"];
    if (name == nil) {
        LoginViewController *vc = [[LoginViewController alloc]init];
        UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:vc];
        [self presentViewController:nav animated:YES completion:nil];
    }
    else{
            TLWriteOrderTableViewController *vc = [[TLWriteOrderTableViewController alloc]init];
        
        NSIndexPath * index = [self.tableView indexPathForSelectedRow];
        TLticketDate *date=tkResultArray[index.row] ;
        vc.tkDict=date;
        NSLog(@"%@",vc.tkDict.destinationSName);
        [self.navigationController pushViewController:vc animated:YES];
    }
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 120;
}

#pragma mark 和服务器交互
-(void)requesrServices{
    
    
    QueryServiceImplSoapBinding * OnSelectQueryBinding = [ [QueryServiceImplSvc QueryServiceImplSoapBinding]initWithAddress:QueryURL];
    
    OnSelectQueryBinding.logXMLInOut = YES;
    
    tns1_executeQuery * OnSelectQueryRequest = [[tns1_executeQuery alloc] init];


    OnSelectQueryRequest.TicketOffDate=_TicketDate;
   // NSLog(@"----------------%@",_TicketDate);
    
    OnSelectQueryRequest.StartOffStationName=_StartOffName;
    OnSelectQueryRequest.DestinationStationName=_DestinationName;
    
    
//    OnSelectQueryRequest.TicketOffDate=@"2016-12-15";
//    
//    OnSelectQueryRequest.StartOffStationName=@"南阳市";
//    OnSelectQueryRequest.DestinationStationName=@"北京市";
  
    
    QueryServiceImplSoapBindingResponse * response = [OnSelectQueryBinding executeQueryUsingParameters:OnSelectQueryRequest];
    
    NSString * resultStr = [[NSString alloc] init];
       for (id queryResult in response.bodyParts) {
      
        if ([queryResult isKindOfClass:[tns1_executeQueryResponse class]]) {
//            NSLog(@"111");
            NSLog(@"输出结果：%@", [queryResult return_]);
            resultStr = [queryResult return_];
        }
    }
    
    [self dictionaryWithJsonString:resultStr];//  string->dict
//#pragma 状态返回值有疑问
    NSString *str = [_dict objectForKey:@"status"];
    NSString *strerror = [_dict objectForKey:@"errmsg"];
    NSLog(@"str = %@",str);
    
    if (str==NULL) {
        UIAlertView *alter = [[UIAlertView alloc]initWithTitle:nil message:@"当前网络不可用,请检查后重试" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
        [alter show];
    }else if([str isEqualToString:@"0"])
    {
        
        NSLog(@"获取成功");
    }else
    {
        UIAlertView *alter = [[UIAlertView alloc]initWithTitle:nil message:strerror delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
        [alter show];
    }

}

-(NSDictionary *)dictionaryWithJsonString:(NSString *)jsonString {
    if (jsonString == nil) {
        return nil;
    }
    NSData *jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    NSError *err;
    NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:jsonData
                                                         options:NSJSONReadingMutableContainers
                                                           error:&err];
    self.dict =dict;
    NSLog(@"%@",self.dict);
    if([[_dict objectForKey:@"status"] isEqualToString:@"0"])
    {
        tkDict = [[TLticketDate alloc]initWithDict:self.dict];
        NSLog(@"%@",tkDict);
        [tkResultArray addObject:tkDict];
        NSLog(@"%@",tkResultArray);
    }
    
  //  NSLog(@"-----------%d",tkResultArray.count);
    if(err) {
        NSLog(@"json解析失败：%@",err);
    }
    return dict;
}

//-(NSArray *)dictionaryWithJsonString:(NSString *)jsonString {
//    if (jsonString == nil) {
//        return nil;
//    }
//    NSData *jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
//    NSError *err;
//    
//    NSArray *json  = [NSJSONSerialization JSONObjectWithData:jsonData
//                                                     options:NSJSONReadingMutableContainers
//                                                       error:&err];
//    for (NSDictionary *dict in json) {
//        TLticketDate *tkDict = [[TLticketDate alloc]initWithDict:dict];
//        [tkResultArray addObject:tkDict];
//        NSLog(@"-----------%@",tkDict);
//    }
//    [self.tableView reloadData];
//    
//    if(err) {
//        self.dict=tkResultArray[0];
//        NSLog(@"json解析失败：%@",err);
//        
//    }
//    return tkResultArray;
//}






/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
