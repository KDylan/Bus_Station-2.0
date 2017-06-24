//
//  TLMapViewController.h
//  巴士驿站
//
//  Created by mac on 16/9/12.
//  Copyright © 2016年 Edge. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MAMapKit/MAMapKit.h>
#import <AMapNaviKit/AMapNaviKit.h>

@interface TLMapViewController : UIViewController
@property (nonatomic, strong) MAMapView *mapView;

@property (nonatomic, strong) AMapNaviWalkManager *walkManager;
//  起始点
@property (nonatomic, strong) AMapNaviPoint *startPoint;
//  终点
@property (nonatomic, strong) AMapNaviPoint *endPoint;


@end
