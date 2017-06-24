//
//  AppDelegate.m
//  巴士驿站
//
//  Created by Edge on 16/7/10.
//  Copyright © 2016年 Edge. All rights reserved.
//

#import "AppDelegate.h"
#import "TLRootTabBarController.h"
#import <AMapFoundationKit/AMapFoundationKit.h>
#import <ShareSDK/ShareSDK.h>
#import <ShareSDKConnector/ShareSDKConnector.h>
#import "WXApi.h"//  微信
#import "LoginViewController.h"
#import "TLLoginViewController.h"
#import <SMS_SDK/SMSSDK.h>
//SMSSDK官网公共key
#define appkey @"192a48b0acac1"
#define app_secrect @"99ba7df15fa9e9f1722761a73beb760d"

@interface AppDelegate ()<WXApiDelegate>

@end

@implementation AppDelegate
//sharerSDK:177dc9318e8dc
//share Serect:9d40e8d09b92d7063f62ff62e76e94db
//  微信 AppID: wxcd190358eee3917c
//  微信：App Serect :479354554a6a283a845a3b28cc2a5c06
//  高德API: 6920ea737d02e5c614bf6c25b237a93c

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    //  地图集成
    //  创建窗口
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
   TLRootTabBarController *tabBarVc= [[TLRootTabBarController alloc]init];
    //self.window.backgroundColor = [UIColor yellowColor];
    self.window.rootViewController = tabBarVc;
    //  显示窗口
    [self.window makeKeyAndVisible];
    
    tabBarVc.delegate=self;
    
    // 短信
    [SMSSDK registerApp:appkey withSecret:app_secrect];
    
    //  地图
    [AMapServices sharedServices].apiKey = @"6920ea737d02e5c614bf6c25b237a93c";
    [[AMapServices sharedServices] setEnableHTTPS:YES];

    //微信支付
    [WXApi registerApp:@"wxd930ea5d5a258f4f" withDescription:@"微信支付"];
    
    
    //  微信分享
    [ShareSDK registerApp:@"177dc9318e8dc" activePlatforms:@[ @(SSDKPlatformTypeWechat)] onImport:^(SSDKPlatformType platformType) {
                                                                 switch (platformType){
                                                                     case SSDKPlatformTypeWechat:
                                                                         [ShareSDKConnector connectWeChat:[WXApi class]];
                                                                         break;
                                                              default:
                                                                         break;
                                                                 }
                                                             } onConfiguration:^(SSDKPlatformType platformType, NSMutableDictionary *appInfo) {
                                                        switch (platformType){
                                                            case
                                                                     SSDKPlatformTypeWechat:
                                                                         [appInfo SSDKSetupWeChatByAppId:@"wxcd190358eee3917c"
                                                                                               appSecret:@"479354554a6a283a845a3b28cc2a5c06"];
                                                                         break;  
                                                        default: break;}
                                                                 }];
    
    return YES;
}
- (BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url

{
    return [WXApi handleOpenURL:url delegate:self];
}
- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation
{
    return [WXApi handleOpenURL:url delegate:self];
}

- (void)onResp:(BaseResp *)resp
{
    if ([resp isKindOfClass:[SendMessageToWXResp class]]) {
        switch (resp.errCode) {
            case WXSuccess: { // 成功
                NSLog(@"发送成功");
                break;
            }
            case WXErrCodeCommon: { // 普通错误类型
                [SVProgressHUD showErrorWithStatus:@"网络繁忙，请稍后再试"];
                break;
            }
            case WXErrCodeUserCancel: { // 用户取消发送
                NSLog(@"取消发送");
                break;
            }
            case WXErrCodeSentFail: { // 发送失败
                NSLog(@"发送失败");
                break;
            }
            case WXErrCodeAuthDeny: { // 授权失败
                NSLog(@"授权失败");
                break;
            }
            case WXErrCodeUnsupport: { // 微信版本不支持
                NSLog(@"版本不支持");
                break;
            }
            default:
                break;
        }
    }
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
