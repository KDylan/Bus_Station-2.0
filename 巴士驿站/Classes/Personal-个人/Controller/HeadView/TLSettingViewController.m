//
//  TLTestViewController.m
//  巴士驿站
//
//  Created by Edge on 16/7/13.
//  Copyright © 2016年 Edge. All rights reserved.
//
#define MAS_SHORTHAND  //  不用mas
//  mas_equalTo(self.view) = equalTo(self.view);
#define MAS_SHORTHAND_GLOBALS
#import "TLSettingViewController.h"
#import "TLNicknameViewController.h"
#import "TLNameViewController.h"
#include "TLChPasswordViewController.h"
//#import "Masonry.h"
#import "TLSaveData.h"
#import "TLUsers.h"
#import "TLSaveData.h"
//#import "CoreGraphics.h"
@interface TLSettingViewController ()<UIImagePickerControllerDelegate, UINavigationControllerDelegate, UIActionSheetDelegate,TLNicknameViewControllerDelegate,TLNameViewControllerDelegate>
//  存储传过来的模型数据
@property(nonatomic,strong)NSMutableArray *users;

@property(nonatomic,weak)UITableView *tableview;
//  获取传进来cell的名字属性
@property(nonatomic,weak)UITableViewCell *namecell;
//  获取传进来cell的昵称属性
@property(nonatomic,weak)UITableViewCell *nickNamecell;
//  设置tableViiecell 的头像
@property(nonatomic,weak)UIImageView *imageView;
@end

@implementation TLSettingViewController
// 模型数据初始化
- (NSMutableArray *)users{
    if (!_users) {
        _users = [NSMutableArray array];
    }
    return _users;
}

- (void)viewDidLoad {
    [super viewDidLoad];
   self.navigationItem.title = @"个人信息";
    
    //消除底部多余的cell的分割线
    self.tableView.tableFooterView = [[UIView alloc]init];
    [self addQuateButton];
}

//  添加退出按钮
-(void)addQuateButton{
    UIButton *button = [[UIButton alloc]init];
    [button setBackgroundColor:[UIColor colorWithWhite:0.960 alpha:1.000]];
    //设置button的title
    [button setTitle:@"退出当前账号" forState:UIControlStateNormal];
    //title字体大小
    button.titleLabel.font = [UIFont systemFontOfSize:20];
    //设置title的字体居中
    button.titleLabel.textAlignment = NSTextAlignmentCenter;
    //  设置字体颜色
   [button setTitleColor:[UIColor redColor]forState:UIControlStateNormal];
    [self.view addSubview:button];
    
    [button mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.right.equalTo(self.view).offset(-15);
        make.left.equalTo(self.view).offset(15);
        make.height.equalTo(@40);
        make.center.mas_equalTo(self.view);

    }];
    //  切圆角
    button.layer.masksToBounds = YES;
    button.layer.cornerRadius = 10;
    
    [button addTarget:self action:@selector(clickButton:) forControlEvents:UIControlEventTouchUpInside];
}
//  弹出提示框
-(void)clickButton:(id)sender{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"退出当前账户" message:nil preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *determine = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        //  添加方法
        //获取UserDefaults单例
        NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
        //移除UserDefaults中存储的用户信息
        [userDefaults removeObjectForKey:@"userName"];
        [userDefaults removeObjectForKey:@"passWord"];
        [userDefaults synchronize];
        [self.navigationController popViewControllerAnimated:YES];
        
    }];
    
    UIAlertAction *destory = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        //  添加方法
    }];
    [alert addAction:determine];
    [alert addAction:destory];
    [self presentViewController:alert animated:YES completion:nil];
}

#pragma tableView 代理方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section;
{
    return 4;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;
{
    static NSString *ID = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        //  设置cell的显示样式
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:ID];
    }
  // cell.backgroundColor =  [UIColor colorWithWhite:0.9959 alpha:1.0];
    
//    // 用view来画分割线
//    UIView *customLine = [[UIView alloc] init];
//    customLine.frame = CGRectMake(cell.frame.origin.x, cell.frame.size.height - 1, self.view.frame.size.width+55, 1);
//    customLine.backgroundColor =  [UIColor colorWithWhite:0.893 alpha:1.000];
//    [cell.contentView addSubview:customLine];
//
    //  切圆角
//    cell.layer.masksToBounds = YES;
//    cell.layer.cornerRadius = 10;
    

    //  显示箭头
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    //  修改cell字体大小
    UIFont *newFont = [UIFont fontWithName:@"Arial" size:15.0];
    //创建完字体格式之后就告诉cell
    cell.textLabel.font = newFont;
    cell.detailTextLabel.font=newFont;
    //  分割线左对齐
    [cell setLayoutMargins:UIEdgeInsetsZero];
    [cell setSeparatorInset:UIEdgeInsetsZero];
    [self.tableView setLayoutMargins:UIEdgeInsetsZero];
    [self.tableView setSeparatorInset:UIEdgeInsetsZero];
    switch (indexPath.row) {
        case 0:
        {
            cell.textLabel.text=@"头像";
            UIImageView *imageView = [[UIImageView alloc]init];
            self.imageView=imageView;
            imageView.image = [UIImage imageNamed:@"02"];
            //  图片居中
            imageView.contentMode =  UIViewContentModeCenter;
        
            imageView.layer.masksToBounds = YES;
            imageView.layer.cornerRadius = 20;//  view的一半
    
            imageView.contentMode=UIViewContentModeScaleAspectFill;//  图片适应大小；可能会变形
            [cell.contentView addSubview:imageView];

            [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(@5);
                make.height.equalTo(@40);
                make.width.equalTo(@40);
                make.right.equalTo(@0);
             //   make.bottom.equalTo(@5);
            }];

        }
            break;
        case 1:
        {
            cell.textLabel.text=@"昵称";
            self.nickNamecell = cell;   //获取当前传入的cell
        }
          
            break;
        case 2:
            cell.textLabel.text=@"姓名";
            self.namecell=cell;    //获取当前传入的cell
            break;
        case 3:
            cell.textLabel.text=@"修改账户密码";
            break;
    }

    return cell;
}
- (void)tableView:(UITableView*)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    switch (indexPath.row) {
        case 0:
        {
            [self tap];
        }
            break;
        case 1:
            { TLNicknameViewController *pushCell = [[TLNicknameViewController alloc]init];
             //  跳转遵守代理
                pushCell.delegate = self;
            UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithTitle:@"个人信息" style:UIBarButtonItemStylePlain target:nil action:nil];
            self.navigationItem.backBarButtonItem = item;
            [self.navigationController pushViewController:pushCell animated:YES ];
        }
            break;
        case 2:
        { TLNameViewController *pushCell = [[TLNameViewController alloc]init];
            //  跳转遵守代理
            pushCell.delegate = self;
            UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithTitle:@"个人信息" style:UIBarButtonItemStylePlain target:nil action:nil];
            self.navigationItem.backBarButtonItem = item;
            [self.navigationController pushViewController:pushCell animated:YES ];
        }
            break;
        case 3:{
            TLChPasswordViewController *pushCell = [[TLChPasswordViewController alloc]init];
            UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithTitle:@"个人信息" style:UIBarButtonItemStylePlain target:nil action:nil];
            self.navigationItem.backBarButtonItem = item;
            [self.navigationController pushViewController:pushCell animated:YES ];
    }
            break;
    }
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
     return 50;
}

#pragma 自定义代理获取数据
//  获取niickName数据
-(void)addViewController:(TLNicknameViewController *)addViewController addUser:(TLUsers *)User{
    
    [self.users addObject:User];
    self.nickNamecell.detailTextLabel.text = User.nickName;
    [self.tableView reloadData];
}
//  获取name数据
-(void)addViewController:(TLNameViewController *)ViewController addUserName:(TLUsers *)name{
  
    [self.users addObject:name];
    self.namecell.detailTextLabel.text = name.name;
     [self.tableView reloadData];

}

#pragma 头像设置

- (void)tap {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"选择获得照片的路径" message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    
    UIAlertAction *action1 = [UIAlertAction actionWithTitle:@"从相册中选一张" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [self  openAlBum];
    }];
    
    UIAlertAction *action2 = [UIAlertAction actionWithTitle:@"拍一张照片" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [self openCamera];
    }];
    UIAlertAction *destory = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    
    [alert addAction:action1];
    [alert addAction:action2];
    
    [alert addAction:destory];
    
    [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:alert animated:YES completion:nil];
}

/**
 *  打开相机
 */
- (void)openCamera {
    UIImagePickerController *ipc = [[UIImagePickerController alloc] init];
    ipc.delegate = self;
    ipc.sourceType = UIImagePickerControllerSourceTypeCamera;
    [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:ipc animated:YES completion:nil];
}

/**
 *  打开相册
 */
- (void)openAlBum {
    UIImagePickerController *ipc = [[UIImagePickerController alloc] init];
    ipc.title = @"相册";
    ipc.allowsEditing=YES;  //  图片允许编辑
    ipc.delegate = self;
    ipc.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:ipc animated:YES completion:nil];
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingImage:(UIImage *)image editingInfo:(NSDictionary<NSString *,id> *)editingInfo {
    //选取完图片之后关闭视图
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info {
    self.imageView.image = info[@"UIImagePickerControllerOriginalImage"];
   // self.imageView.image =[info objectForKey:UIImagePickerControllerEditedImage];
    
    [picker dismissViewControllerAnimated:YES completion:nil];
    
}

@end
