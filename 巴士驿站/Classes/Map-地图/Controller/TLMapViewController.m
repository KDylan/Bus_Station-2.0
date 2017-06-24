//
//  TLMapViewController.m
//  巴士驿站
//
//  Created by mac on 16/9/12.
//  Copyright © 2016年 Edge. All rights reserved.
//

//常量
#define kWidth [UIScreen mainScreen].bounds.size.width
#define kHeight [UIScreen mainScreen].bounds.size.height


#import "TLMapViewController.h"
#import <AMapFoundationKit/AMapFoundationKit.h>
#import <AMapLocationKit/AMapLocationKit.h>
#import "NaviPointAnnotation.h"
#import "SelectableOverlay.h"
#import "RouteCollectionViewCell.h"
#import "GPSNaviViewController.h"

#define kRoutePlanInfoViewHeight    100.f
#define kRouteIndicatorViewHeight   64.f
#define kCollectionCellIdentifier   @"kCollectionCellIdentifier"

@interface TLMapViewController ()<MAMapViewDelegate, AMapNaviWalkManagerDelegate,AMapLocationManagerDelegate, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) UICollectionView *routeIndicatorView;
@property (nonatomic, strong) NSMutableArray *routeIndicatorInfoArray;
//  位置
@property(nonatomic,strong)AMapLocationManager *locationManager;

@property(nonatomic,strong)UIButton *NavBtn;//  导航按钮

@property(nonatomic,strong)UIButton *LocationBtn;//  定位按钮

@property(nonatomic,strong)UIButton *routeBtn ;//  绘制路线

@end

@implementation TLMapViewController

#pragma ma rk - Life Cycle


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    self.navigationItem.title = @"地图";
    [self CLLocation];
    
    [self initProperties];
    
    [self initMapView];
   
    [self initWalkManager];
   
    [self configSubViews];
    
    [self initRouteIndicatorView];
    
    [self showNaviRoutes];
    
    [self addLocationButton];
    
    [self addPushToNavRouteButton];
   
}

#pragma mark 定位

-(void)CLLocation
{
    
    self.locationManager = [[AMapLocationManager alloc]init];
    self.locationManager.delegate = self;
    [self.locationManager setLocatingWithReGeocode:YES];
    [self.locationManager startUpdatingLocation];
    
}

- (void)amapLocationManager:(AMapLocationManager *)manager didUpdateLocation:(CLLocation *)location reGeocode:(AMapLocationReGeocode *)reGeocode
{
    
    self.startPoint = [AMapNaviPoint locationWithLatitude:location.coordinate.latitude longitude: location.coordinate.longitude];
    self.endPoint   = [AMapNaviPoint locationWithLatitude:32.974407 longitude:112.652540];
    
    NSLog(@"location:{lat:%f; lon:%f; accuracy:%f}", location.coordinate.latitude, location.coordinate.longitude, location.horizontalAccuracy);
    
    NSLog(@"start:%@",self.startPoint);
    NSLog(@"endpoint:%@",self.endPoint);
    
    
    if (reGeocode)
    {
        NSLog(@"reGeocode:%@", reGeocode);
    }
}

#pragma mark - SubViews
-(void)clickNavRouteButton{
    
  //  self.hidesBottomBarWhenPushed=YES;
    
    GPSNaviViewController *NavRoutes = [[GPSNaviViewController alloc]init];
    NavRoutes.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:NavRoutes animated:YES];
}
//  添加定位按钮
-(void)addLocationButton{
    
    UIButton *LocationBtn = [[UIButton alloc]init];
    [LocationBtn setBackgroundColor:[UIColor clearColor]];
    
    self.LocationBtn = LocationBtn;

    [LocationBtn setTitleColor:[UIColor blackColor] forState:0];
    [LocationBtn setImage:[UIImage imageNamed:@"location"] forState:UIControlStateNormal];
    [LocationBtn setBackgroundImage:[UIImage imageNamed:@"white"] forState:UIControlStateNormal];
    [self.view addSubview:LocationBtn];
     [LocationBtn addTarget:self action:@selector(clickLocationButton) forControlEvents:UIControlEventTouchUpInside];
    
    [LocationBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).offset(15);
        make.bottom.equalTo(self.view).offset(-115);
        make.width.equalTo(@50);
        make.height.equalTo(@50);
    }];
}


//  添加导航划线按钮
- (void)configSubViews
{
    
     UIButton *routeBtn = [self createToolButton];
   // [routeBtn setFrame:CGRectMake((CGRectGetWidth(self.view.bounds)-80)/2.0, 124, 80, 30)];
    [routeBtn setImage:[UIImage imageNamed:@"line"] forState:UIControlStateNormal];
 
    [routeBtn setBackgroundImage:[UIImage imageNamed:@"white"] forState:UIControlStateNormal];
    [routeBtn setBackgroundColor:[UIColor clearColor]];
    
    self.routeBtn = routeBtn;
    
   // [routeBtn setTitle:@"路径规划" forState:UIControlStateNormal];
    [routeBtn addTarget:self action:@selector(routePlanAction:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:routeBtn];
    
    [routeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).offset(15);
        make.bottom.equalTo(self.view).offset(-185);
        make.width.equalTo(@50);
        make.height.equalTo(@50);
    }];

}

//  添加进入导航按钮
-(void)addPushToNavRouteButton{
    //GPSNaviViewController *GPSstart = [[GPSNaviViewController alloc]init];
    
    UIButton *NavBtn = [[UIButton alloc]init];
    [NavBtn setBackgroundColor:[UIColor clearColor]];
    [self.view addSubview:NavBtn];
    [NavBtn setTitleColor:[UIColor blackColor] forState:0];
    
    [NavBtn setImage:[UIImage imageNamed:@"nav"] forState:UIControlStateNormal];
    
    [NavBtn setBackgroundImage:[UIImage imageNamed:@"white"] forState:UIControlStateNormal];
    
    [NavBtn addTarget:self action:@selector(clickNavRouteButton) forControlEvents:UIControlEventTouchUpInside];
    
    
    [NavBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).offset(15);
        make.bottom.equalTo(self.view).offset(-255);
        make.width.equalTo(@50);
        make.height.equalTo(@50);
    }];
}



-(void)clickLocationButton
{
    //  设置地图中心点
    CLLocationCoordinate2D center =self.mapView.userLocation.location.coordinate;
    //   设置范围
    MACoordinateSpan span = MACoordinateSpanMake(0.0034, 0.0034);
    MACoordinateRegion region = MACoordinateRegionMake(center, span);
    [self.mapView setRegion:region animated:YES];
    
    [self.mapView setCenterCoordinate:self.mapView.userLocation.location.coordinate animated:YES];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
  //   self.tabBarController.tabBar.hidden = NO;
//    self.tabBarController.hidesBottomBarWhenPushed = NO;
    self.navigationController.navigationBarHidden = NO;
    self.navigationController.toolbarHidden = YES;
}

-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
 
   // self.tabBarController.tabBar.hidden = YES;
    
  //  [self setHidesBottomBarWhenPushed:YES];
}

//- (void)viewDidAppear:(BOOL)animated
//{
//    [super viewDidAppear:animated];
//    
//   // [self initAnnotations];
//}
-(void)mapView:(MAMapView *)mapView didUpdateUserLocation:(MAUserLocation *)userLocation
updatingLocation:(BOOL)updatingLocation
{
    NSLog(@"定位%@",userLocation);
    CLGeocoder *geocoder = [[CLGeocoder alloc] init];
    
    // 反地理编码；根据经纬度查找地名
    [geocoder reverseGeocodeLocation:userLocation.location completionHandler:^(NSArray *placemarks, NSError *error) {
        if (placemarks.count == 0 || error) {
            NSLog(@"找不到该位置");
            return;
        }
        // 当前地标
        CLPlacemark *pm = [placemarks firstObject];
        
        // 区域名称
        userLocation.title = pm.locality;
        NSLog(@"%@",pm.locality);
        
        // 详细名称
        userLocation.subtitle = pm.name;
        NSLog(@"%@",pm.name);
        
    }];
    
}
#pragma mark - Initalization

- (void)initProperties
{
    NSLog(@"initProperties-start:%@",self.startPoint);
    NSLog(@"initProperties-endpoint:%@",self.endPoint);
    
    self.routeIndicatorInfoArray = [NSMutableArray array];
}

- (void)initMapView
{
    if (self.mapView == nil)
    {
        self.mapView = [[MAMapView alloc] initWithFrame:self.view.bounds];
        [self.mapView setDelegate:self];
        _mapView.showsUserLocation = YES;    //YES 为打开定位，NO为关闭定位
        //自定义定位经度圈样式
        _mapView.customizeUserLocationAccuracyCircleRepresentation = NO;
       
        _mapView.pausesLocationUpdatesAutomatically = NO;
         //后台定位
        _mapView.allowsBackgroundLocationUpdates = YES;//iOS9以上系统必须配置
        
        _mapView.userTrackingMode = MAUserTrackingModeFollow;
        
        [self.view addSubview:self.mapView];
    }
}

- (void)initWalkManager
{
    if (self.walkManager == nil)
    {
        self.walkManager = [[AMapNaviWalkManager alloc] init];
        [self.walkManager setDelegate:self];
    }
}

//  添加显示时间和路程label
- (void)initRouteIndicatorView
{
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    
    _routeIndicatorView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, CGRectGetHeight(self.view.bounds) - kRouteIndicatorViewHeight-44, self.view.bounds.size.width, kRouteIndicatorViewHeight) collectionViewLayout:layout];
    
    _routeIndicatorView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleTopMargin;
    _routeIndicatorView.backgroundColor = [UIColor clearColor];
    _routeIndicatorView.pagingEnabled = YES;
    _routeIndicatorView.showsVerticalScrollIndicator = NO;
    _routeIndicatorView.showsHorizontalScrollIndicator = NO;
    
    _routeIndicatorView.delegate = self;
    _routeIndicatorView.dataSource = self;
    
    [_routeIndicatorView registerClass:[RouteCollectionViewCell class] forCellWithReuseIdentifier:kCollectionCellIdentifier];
    
    [self.view addSubview:_routeIndicatorView];
}
//  添加大头针
//- (void)initAnnotations
//{
////    NaviPointAnnotation *beginAnnotation = [[NaviPointAnnotation alloc] init];
////    [beginAnnotation setCoordinate:CLLocationCoordinate2DMake(self.startPoint.latitude, self.startPoint.longitude)];
////    beginAnnotation.title = @"起始点";
////    beginAnnotation.navPointType = NaviPointAnnotationStart;
////    
//   // [self.mapView addAnnotation:beginAnnotation];
//    
//    NaviPointAnnotation *endAnnotation = [[NaviPointAnnotation alloc] init];
//    [endAnnotation setCoordinate:CLLocationCoordinate2DMake(self.endPoint.latitude, self.endPoint.longitude)];
//    endAnnotation.title = @"终点";
//    endAnnotation.navPointType = NaviPointAnnotationEnd;
//    
//    [self.mapView addAnnotation:endAnnotation];
//}

#pragma mark - Button Action
- (UIButton *)createToolButton
{
    UIButton *toolBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    toolBtn.layer.borderColor  = [UIColor lightGrayColor].CGColor;
    toolBtn.layer.borderWidth  = 0.5;
    toolBtn.layer.cornerRadius = 5;
    
    [toolBtn setBounds:CGRectMake(0, 0, 80, 30)];
    [toolBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    toolBtn.titleLabel.font = [UIFont systemFontOfSize:13.0];
    
    return toolBtn;
}

- (void)routePlanAction:(id)sender
{
    //  添加终点大头针
    NaviPointAnnotation *endAnnotation = [[NaviPointAnnotation alloc] init];
    [endAnnotation setCoordinate:CLLocationCoordinate2DMake(self.endPoint.latitude, self.endPoint.longitude)];
    endAnnotation.title = @"终点";
    endAnnotation.navPointType = NaviPointAnnotationEnd;
    
    [self.mapView addAnnotation:endAnnotation];
    
    //进行步行路径规划
    [self.walkManager calculateWalkRouteWithStartPoints:@[self.startPoint]
                                              endPoints:@[self.endPoint]];
    
    NSLog(@"routePlanAction-startPoin=%@",self.startPoint);
    NSLog(@"routePlanAction-endPoint=%@",self.endPoint);
    
}

#pragma mark - Handle Navi Routes
//  显示路径
- (void)showNaviRoutes
{
    if (self.walkManager.naviRoute == nil)
    {
        return;
    }
    
    [self.mapView removeOverlays:self.mapView.overlays];
    [self.routeIndicatorInfoArray removeAllObjects];
    
    //将路径显示到地图上
    AMapNaviRoute *aRoute = self.walkManager.naviRoute;
    int count = (int)[[aRoute routeCoordinates] count];
    
    //添加路径Polyline
    CLLocationCoordinate2D *coords = (CLLocationCoordinate2D *)malloc(count * sizeof(CLLocationCoordinate2D));
    for (int i = 0; i < count; i++)
    {
        AMapNaviPoint *coordinate = [[aRoute routeCoordinates] objectAtIndex:i];
        coords[i].latitude = [coordinate latitude];
        coords[i].longitude = [coordinate longitude];
    }
    
    MAPolyline *polyline = [MAPolyline polylineWithCoordinates:coords count:count];
    
    SelectableOverlay *selectablePolyline = [[SelectableOverlay alloc] initWithOverlay:polyline];
    
    [self.mapView addOverlay:selectablePolyline];
    free(coords);
    
    //更新CollectonView的信息
    RouteCollectionViewInfo *info = [[RouteCollectionViewInfo alloc] init];
    info.title = [NSString stringWithFormat:@"路径信息:"];
    info.subtitle = [NSString stringWithFormat:@"长度:%ld米 | 预估时间:%ld秒", (long)aRoute.routeLength, (long)aRoute.routeTime];
    
    [self.routeIndicatorInfoArray addObject:info];
    
    [self.mapView showAnnotations:self.mapView.annotations animated:NO];
    [self.routeIndicatorView reloadData];
}

- (void)selecteOverlayWithRouteID:(NSInteger)routeID
{
    [self.mapView.overlays enumerateObjectsWithOptions:NSEnumerationReverse usingBlock:^(id<MAOverlay> overlay, NSUInteger idx, BOOL *stop)
     {
         if ([overlay isKindOfClass:[SelectableOverlay class]])
         {
             SelectableOverlay *selectableOverlay = overlay;
             
           //   获取overlay对应的renderer.
             MAPolylineRenderer * overlayRenderer = (MAPolylineRenderer *)[self.mapView rendererForOverlay:selectableOverlay];
             
             if (selectableOverlay.routeID == routeID)
             {
                 /* 设置选中状态. */
                 selectableOverlay.selected = YES;
                 
                 /* 修改renderer选中颜色. */
                 overlayRenderer.fillColor   = selectableOverlay.selectedColor;
                 overlayRenderer.strokeColor = selectableOverlay.selectedColor;
                 
                 /* 修改overlay覆盖的顺序. */
                 [self.mapView exchangeOverlayAtIndex:idx withOverlayAtIndex:self.mapView.overlays.count - 1];
             }
             else
             {
                 /* 设置选中状态. */
                 selectableOverlay.selected = NO;
                 
                 /* 修改renderer选中颜色. */
                 overlayRenderer.fillColor   = selectableOverlay.regularColor;
                 overlayRenderer.strokeColor = selectableOverlay.regularColor;
             }
             
             [overlayRenderer glRender];
         }
     }];
}


#pragma mark - AMapNaviDriveManager Delegate

- (void)walkManager:(AMapNaviWalkManager *)walkManager error:(NSError *)error
{
    NSLog(@"error:{%ld - %@}", (long)error.code, error.localizedDescription);
}

- (void)walkManagerOnCalculateRouteSuccess:(AMapNaviWalkManager *)walkManager
{
    NSLog(@"onCalculateRouteSuccess");
    
    //算路成功后显示路径
    [self showNaviRoutes];
}

- (void)walkManager:(AMapNaviWalkManager *)walkManager onCalculateRouteFailure:(NSError *)error
{
    NSLog(@"onCalculateRouteFailure:{%ld - %@}", (long)error.code, error.localizedDescription);
}

- (void)walkManager:(AMapNaviWalkManager *)walkManager didStartNavi:(AMapNaviMode)naviMode
{
    NSLog(@"didStartNavi");
}

- (void)walkManagerNeedRecalculateRouteForYaw:(AMapNaviWalkManager *)walkManager
{
    NSLog(@"needRecalculateRouteForYaw");
}

- (void)walkManager:(AMapNaviWalkManager *)walkManager playNaviSoundString:(NSString *)soundString soundStringType:(AMapNaviSoundType)soundStringType
{
    NSLog(@"playNaviSoundString:{%ld:%@}", (long)soundStringType, soundString);
}

- (void)walkManagerDidEndEmulatorNavi:(AMapNaviWalkManager *)walkManager
{
    NSLog(@"didEndEmulatorNavi");
}

- (void)walkManagerOnArrivedDestination:(AMapNaviWalkManager *)walkManager
{
    NSLog(@"onArrivedDestination");
}

#pragma mark - UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.routeIndicatorInfoArray.count;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    RouteCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kCollectionCellIdentifier forIndexPath:indexPath];
    
    cell.shouldShowPrevIndicator = (indexPath.row > 0 && indexPath.row < _routeIndicatorInfoArray.count);
    cell.shouldShowNextIndicator = (indexPath.row >= 0 && indexPath.row < _routeIndicatorInfoArray.count-1);
    cell.info = self.routeIndicatorInfoArray[indexPath.row];
    
    return cell;
}

#pragma mark - UICollectionViewDelegateFlowLayout

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(CGRectGetWidth(collectionView.bounds) - 10, CGRectGetHeight(collectionView.bounds) - 5);
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(0, 5, 5, 5);
}

#pragma mark - UICollectionViewDelegate

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    return;
}

#pragma mark - MAMapView Delegate

- (MAAnnotationView *)mapView:(MAMapView *)mapView viewForAnnotation:(id<MAAnnotation>)annotation
{
    if ([annotation isKindOfClass:[NaviPointAnnotation class]])
    {
        static NSString *annotationIdentifier = @"NaviPointAnnotationIdentifier";
        
        MAPinAnnotationView *pointAnnotationView = (MAPinAnnotationView*)[self.mapView dequeueReusableAnnotationViewWithIdentifier:annotationIdentifier];
        if (pointAnnotationView == nil)
        {
            pointAnnotationView = [[MAPinAnnotationView alloc] initWithAnnotation:annotation
                                                                  reuseIdentifier:annotationIdentifier];
        }
        
        pointAnnotationView.animatesDrop   = NO;
        pointAnnotationView.canShowCallout = YES;
        pointAnnotationView.draggable      = NO;
        
        NaviPointAnnotation *navAnnotation = (NaviPointAnnotation *)annotation;
        
        if (navAnnotation.navPointType == NaviPointAnnotationStart)
        {
            [pointAnnotationView setPinColor:MAPinAnnotationColorGreen];
        }
        else if (navAnnotation.navPointType == NaviPointAnnotationEnd)
        {
            [pointAnnotationView setPinColor:MAPinAnnotationColorRed];
        }
        
        return pointAnnotationView;
    }
    return nil;
}

- (MAOverlayRenderer *)mapView:(MAMapView *)mapView rendererForOverlay:(id<MAOverlay>)overlay
{
    if ([overlay isKindOfClass:[SelectableOverlay class]])
    {
        SelectableOverlay * selectableOverlay = (SelectableOverlay *)overlay;
        id<MAOverlay> actualOverlay = selectableOverlay.overlay;
        
        MAPolylineRenderer *polylineRenderer = [[MAPolylineRenderer alloc] initWithPolyline:actualOverlay];
        
        polylineRenderer.lineWidth = 8.f;
        polylineRenderer.strokeColor = selectableOverlay.isSelected ? selectableOverlay.selectedColor : selectableOverlay.regularColor;
        
        return polylineRenderer;
    }
    
    return nil;
}

@end
