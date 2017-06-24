//
//  BusPersonalViewController.m
//  巴士驿站
//
//  Created by Edge on 16/7/10.
//  Copyright © 2016年 Edge. All rights reserved.
//

#import "TLPersonalViewController.h"
#import "TLPerTableViewCell.h"
#import "TLPassengerViewController.h"
#import "TLSettingViewController.h"
#import "TLComplaintsViewController.h"
#import "TLFeedbackViewController.h"
#import "TLUpdateTableViewController.h"
#import "TLHelpTableViewController.h"
#import "TLAboutViewController.h"
#import "TLCallTableViewController.h"
#import "WXApi.h"
#import <ShareSDK/ShareSDK.h>
#import <ShareSDKUI/ShareSDK+SSUI.h>
#import "TLSaveData.h"
@interface TLPersonalViewController ()<UITableViewDelegate,UITableViewDataSource,WXApiDelegate>
//@property(nonatomic,strong)NSArray *sources;
@property(nonatomic,weak)UIImageView *imageView_Center;
@property(nonatomic,weak)UITableView *tableView;
@property(nonatomic,weak)UIView *m_headView;
@property(nonatomic,weak)UIButton *button;
@end


@implementation TLPersonalViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor redColor];
    self.navigationItem.title = @"个人";
    
    [self addTableView];
    [self addHeaderView];
    [self AddHeadButton];
    [self addCenterImage];
     [self addSetButton];
}

#pragma 添加控件
-(void )addTableView{
   
    UITableView *tableView = [[UITableView alloc]initWithFrame:CGRectMake(0,0, self.view.bounds.size.width, self.view.bounds.size.height)];
     self.tableView=tableView;
    self.tableView.dataSource = self;
     self.tableView.delegate = self;
    self.tableView.tableFooterView = [[UIView alloc]init];
    self.tableView.backgroundColor = [UIColor colorWithRed:0.9278 green:0.9179 blue:0.9377 alpha:1.0];
    //  让分割线消失
   //  self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview: _tableView];
}
//  添加headView
-(void)addHeaderView{
    
     UIView *m_headView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width,200)];
    self.m_headView=m_headView;
    self.m_headView.backgroundColor = [UIColor blueColor];
     [self.view addSubview: self.m_headView];
     self.tableView.tableHeaderView= self.m_headView;
    
}
 //  添加button
-(void)AddHeadButton{
   
    UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(0, 0,self.m_headView.bounds.size.width,self.m_headView.bounds.size.height)];
    self.button = button;
    [self.button  setBackgroundImage:[UIImage imageNamed:@"img_05-1.png"] forState:UIControlStateNormal];
    [self.button  addTarget:self action:@selector(clickrRghtButton) forControlEvents:UIControlEventTouchUpInside];
     [ self.m_headView addSubview:self.button];
}

//  添加中心image
-(void)addCenterImage{
    
     UIImageView *imageView_Center = [[UIImageView alloc]initWithFrame:CGRectMake(self.m_headView.bounds.size.width/2-45,self.m_headView.bounds.size.height/2-45, 90, 90)];
    self.imageView_Center=imageView_Center;
    self.imageView_Center.image = [UIImage imageNamed:@"88.jpg"];
    //  裁剪图片；直径为50
    self.imageView_Center.layer.masksToBounds = YES;
    self.imageView_Center.layer.cornerRadius = 45;
    [self.button addSubview:self.imageView_Center];
}

-(void)addSetButton{
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem iteamwithImageNamed:@"mine-setting-icon" HighImageNamed:@"mine-setting-icon-click" target:self action:@selector(clickrRghtButton)];
  }

#pragma Action
-(void)clickrRghtButton{
    
//        NSString *tempath = NSTemporaryDirectory();
//        
//        NSString *filrpath = [tempath stringByAppendingString:@"Bus_Station.date"];
//        
//        TLSaveData *t = [NSKeyedUnarchiver unarchiveObjectWithFile:filrpath];
    NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
    NSString *name = [userDefault objectForKey:@"userName"];
      if (name == nil) {
        [self judgeLogin];
    }
    else{
        
        TLSettingViewController *vc = [[TLSettingViewController alloc]init];
        vc.view.backgroundColor = [UIColor colorWithRed:0.888 green:0.865 blue:0.872 alpha:1.000];
        //  隐藏tabBar
        vc.hidesBottomBarWhenPushed = YES;
        // vc.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithTitle:@"个人" style:UIBarButtonItemStylePlain target:nil action:nil];
        self.navigationItem.backBarButtonItem = item;
        [self.navigationController pushViewController:vc animated:YES];
        

    }
}

////  查看保存的密码
//-(void)getDate{
//
//    NSString *tempath = NSTemporaryDirectory();
//    
//    NSString *filrpath = [tempath stringByAppendingString:@"Bus_Station.date"];
//    
//    TLSaveData *t = [NSKeyedUnarchiver unarchiveObjectWithFile:filrpath];
//    
//  //  NSLog(@"UserName = %@,PassWord = %@",t.userName,t.passWord);
//}


#pragma 设置tableView代理
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 4;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section ==0) {
        return 1;
    }else if (section==1){
        return 2;
    }
    else if (section==2){
        return 2;
    }else if (section==3){
        return 3;
    }
    return 8;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *ID =@"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
//    if(indexPath.row!=7){
//        //用view来画分割线
//        UIView *customLine = [[UIView alloc] init];
//        customLine.frame = CGRectMake(cell.frame.origin.x, cell.frame.size.height - 1, self.view.frame.size.width+55, 5);
//        customLine.backgroundColor =  [UIColor colorWithRed:0.9162 green:0.9162 blue:0.9162 alpha:1.0];
//        [cell.contentView addSubview:customLine];
//    }
}
    if (indexPath.section==0) {// 0组
        if (indexPath.row==0) {//  0组0行
            cell.textLabel.text = @"常用旅客";
            cell.imageView.image = [UIImage imageNamed:@"02"];
        }
    }
    else if (indexPath.section==1)
    {
        if (indexPath.row==0) {
            cell.textLabel.text = @"分享";
            cell.imageView.image = [UIImage imageNamed:@"03_03"];
        }
        if (indexPath.row==1) {
            cell.textLabel.text = @"检查更新";
            cell.imageView.image = [UIImage imageNamed:@"06_03"];
        }
    }else if (indexPath.section==2)
    {
        if (indexPath.row==0) {
            cell.textLabel.text = @"意见反馈";
            cell.imageView.image = [UIImage imageNamed:@"05_03"];
        }
        if (indexPath.row==1) {
            cell.textLabel.text = @"我要投诉";
            cell.imageView.image = [UIImage imageNamed:@"04_03"];
        }
    }
    else if (indexPath.section==3)
    {
        if (indexPath.row==0) {
            cell.textLabel.text = @"帮助中心";
            cell.imageView.image = [UIImage imageNamed:@"07_03"];
        }
        if (indexPath.row==1) {
            cell.textLabel.text = @"咨询客服";
            cell.imageView.image = [UIImage imageNamed:@"09_03"];
        }
        if (indexPath.row==2) {
            cell.textLabel.text = @"关于";
            cell.imageView.image = [UIImage imageNamed:@"08_03"];
        }
    }
    //  分割线左对齐
    [cell setLayoutMargins:UIEdgeInsetsZero];
    [cell setSeparatorInset:UIEdgeInsetsZero];
    [self.tableView setLayoutMargins:UIEdgeInsetsZero];
    [self.tableView setSeparatorInset:UIEdgeInsetsZero];
    
    //cell.textLabel.text = self.sources[indexPath.row][@"title"];
  //  cell.imageView.image = [UIImage imageNamed:self.sources[indexPath.row][@"image"]];
    //  cell上面的箭头
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *m_headView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width,250)];
    m_headView.backgroundColor = [UIColor blueColor];
    UIImageView *imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"img_05"]];
    UIImageView *imageView_Center = [[UIImageView alloc]initWithFrame:CGRectMake(self.view.bounds.size.width/2-45,imageView.bounds.size.height/2-20, 90, 90)];
    imageView_Center.image = [UIImage imageNamed:@"88.jpg"];
     [self.view addSubview:m_headView];
     [m_headView addSubview:imageView];
    [imageView addSubview:imageView_Center];
    return m_headView;
}

- (void)tableView:(UITableView*)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
   
    if (indexPath.section==0) {
        if (indexPath.row==0) {
            
            NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
            NSString *name = [userDefault objectForKey:@"userName"];
            if (name == nil) {
                [self judgeLogin];
            }
            else{
                
            TLPassengerViewController *pushCell0 = [[TLPassengerViewController alloc]init];
           //  隐藏tabBar
            pushCell0.hidesBottomBarWhenPushed = YES;
            UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithTitle:@"个人" style:UIBarButtonItemStylePlain target:nil action:nil];
            self.navigationItem.backBarButtonItem = item;
         [self.navigationController pushViewController:pushCell0 animated:YES ];
        }
    }
    }else if (indexPath.section==1) {
            if (indexPath.row==0) {
                //  微信分享
                NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
                NSString *name = [userDefault objectForKey:@"userName"];
                if (name == nil) {
                    [self judgeLogin];
                }
                else{
                    
                [self weChatShare];
             }
            }
            if (indexPath.row==1) {
                
                NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
                NSString *name = [userDefault objectForKey:@"userName"];
                if (name == nil) {
                    [self judgeLogin];
                }
                else{
                    //  检测更新
                    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"" message:@"当前已是最新版本" preferredStyle:UIAlertControllerStyleAlert];
                    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"确认" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
                                         }];
                    [alertController addAction:okAction];
                    [self presentViewController:alertController animated:YES completion:nil];
//                TLUpdateTableViewController *pushCell4 = [[TLUpdateTableViewController alloc]init];
//                //  隐藏tabBar
//                pushCell4.hidesBottomBarWhenPushed = YES;
//                UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:nil action:nil];
//                self.navigationItem.backBarButtonItem = item;
//                [self.navigationController pushViewController:pushCell4 animated:YES ];
            }
        }
    }
    else if (indexPath.section==2) {
            if (indexPath.row==0) {
               
                NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
                NSString *name = [userDefault objectForKey:@"userName"];
                if (name == nil) {
                    [self judgeLogin];
                }
                else{
                TLFeedbackViewController *pushCell3 = [[TLFeedbackViewController alloc]init];
                //  隐藏tabBar
                pushCell3.hidesBottomBarWhenPushed = YES;
                UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:nil action:nil];
                self.navigationItem.backBarButtonItem = item;
                [self.navigationController pushViewController:pushCell3 animated:YES ];
            }
        }
            if (indexPath.row==1) {
                NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
                NSString *name = [userDefault objectForKey:@"userName"];
                if (name == nil) {
                    [self judgeLogin];
                }
                else{
                TLComplaintsViewController *pushCell2 = [[TLComplaintsViewController alloc]init];
                //  隐藏tabBar
                pushCell2.hidesBottomBarWhenPushed = YES;
                UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:nil action:nil];
            self.navigationItem.backBarButtonItem = item;
            [self.navigationController pushViewController:pushCell2 animated:YES ];
            }
            }
    }
    else if (indexPath.section==3) {
            if (indexPath.row==0) {
                TLHelpTableViewController *pushCell5 = [[TLHelpTableViewController alloc]init];
                //  隐藏tabBar
                pushCell5.hidesBottomBarWhenPushed = YES;
                UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:nil action:nil];
            self.navigationItem.backBarButtonItem = item;
            [self.navigationController pushViewController:pushCell5 animated:YES ];
            }
            if (indexPath.row==1) {
                TLCallTableViewController *pushCell7 = [[TLCallTableViewController alloc]init];
                //  隐藏tabBar
                pushCell7.hidesBottomBarWhenPushed = YES;
                UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:nil action:nil];
            self.navigationItem.backBarButtonItem = item;
            [self.navigationController pushViewController:pushCell7 animated:YES ];
            }
            if (indexPath.row==2) {
                TLAboutViewController *pushCell6 = [[TLAboutViewController alloc]init];
                //  隐藏tabBar
                pushCell6.hidesBottomBarWhenPushed = YES;
                UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:nil action:nil];
                self.navigationItem.backBarButtonItem = item;
                [self.navigationController pushViewController:pushCell6 animated:YES ];
            }
        }
}
//  行高
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
     return 50;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 8;
}
#pragma mark 微信分享
-(void)weChatShare{
    //1、创建分享参数
    NSArray* imageArray = @[[UIImage imageNamed:@"88.png"]];
    //（注意：图片必须要在Xcode左边目录里面，名称必须要传正确，如果要分享网络图片，可以这样传iamge参数 images:@[@"http://mob.com/Assets/images/logo.png?v=20150320"]）
    if (imageArray) {
        NSMutableDictionary *shareParams = [NSMutableDictionary dictionary];
        [shareParams SSDKSetupShareParamsByText:@"巴士驿站，您自己的大巴车，小伙伴们快来上车，老司机要开车啦~~~"
                                         images:imageArray
                                            url:[NSURL URLWithString:@"vzeros.com"]
                                          title:@"巴士驿站"
                                           type:SSDKContentTypeAuto];
        //2、分享（可以弹出我们的分享菜单和编辑界面）
        [ShareSDK showShareActionSheet:nil //要显示菜单的视图, iPad版中此参数作为弹出菜单的参照视图，只有传这个才可以弹出我们的分享菜单，可以传分享的按钮对象或者自己创建小的view 对象，iPhone可以传nil不会影响
                                 items:@[
                                         @(SSDKPlatformSubTypeWechatTimeline),
                                         @(SSDKPlatformSubTypeWechatSession)
                                         ]
                           shareParams:shareParams
                   onShareStateChanged:^(SSDKResponseState state, SSDKPlatformType platformType, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error, BOOL end) {
                       
                       switch (state) {
                           case SSDKResponseStateSuccess:
                           {
                               UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"分享成功"
                                                                                   message:nil
                                                                                  delegate:nil
                                                                         cancelButtonTitle:@"确定"
                                                                         otherButtonTitles:nil];
                               [alertView show];
                               break;
                           }
                           case SSDKResponseStateFail:
                           {
                               UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"分享失败"
                                                                               message:[NSString stringWithFormat:@"%@",error]
                                                                              delegate:nil
                                                                     cancelButtonTitle:@"OK"
                                                                     otherButtonTitles:nil, nil];
                               [alert show];
                               break;
                           }
                           default:
                               break;
                       }
                   }
         ];}}

//  判断登录
-(void)judgeLogin{
    
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"提示" message:@"请登录后操作" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *cancleAction  = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
        
        //
        
    }];
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"确认" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        
        LoginViewController *login = [[LoginViewController alloc]init];
        UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:login];
        [self presentViewController: nav animated:YES completion:nil];
        
    }];
    [alertController addAction:cancleAction];
    [alertController addAction:okAction];
    [self presentViewController:alertController animated:YES completion:nil];
}

@end
