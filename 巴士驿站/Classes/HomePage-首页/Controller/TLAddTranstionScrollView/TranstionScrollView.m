//
//  TranstionScrollView.m
//  YY
//
//  Created by chenHS on 16/6/17.
//  Copyright © 2016年  . All rights reserved.
//

#import "TranstionScrollView.h"

@implementation TranstionScrollView
-(instancetype)initWithFrame:(CGRect)frame placeholder:(UIImage *)placeholder{
    self = [super initWithFrame:frame];
    if (self) {
        index = 0;
        [self initImageViewWithFrame:frame andPlaceholder:placeholder];
        [self initGestureRecognizer];
        
    }return self;
}
-(void)initImageViewWithFrame:(CGRect)frame andPlaceholder:(UIImage *)placeholder{
    self.bgImageView= [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, CGRectGetWidth(frame), CGRectGetHeight(frame))];
    if (placeholder) {
        [self.bgImageView setImage:placeholder];
    }
    [self addSubview:self.bgImageView];
    self.bgImageView.userInteractionEnabled = YES;
}
-(void)initGestureRecognizer{

    self.leftTap = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(toChageImage:)];
    self.leftTap.direction =UISwipeGestureRecognizerDirectionLeft;
    [self.bgImageView addGestureRecognizer:self.leftTap];
    self.rightTap = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(toChageImage:)];
    self.rightTap.direction =UISwipeGestureRecognizerDirectionRight;
    [self.bgImageView addGestureRecognizer:self.rightTap];
    
    self.tap =[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(toTap:)];
    [self.tap setNumberOfTapsRequired:1];
    [self.bgImageView addGestureRecognizer:self.tap];
  
}
-(void)initPageControl{
    self.pageControl.numberOfPages =self.imageArray.count;
    self.pageControl.currentPage = 0;

    [self addSubview:self.pageControl];
    [self bringSubviewToFront:self.pageControl];
}
-(void)initTime{
 
      dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
    if ( self.myTimer==nil) {
         self.myTimer = [NSTimer scheduledTimerWithTimeInterval:ScrollTimeInterval target:self selector:@selector(setBgImageViewAnimation) userInfo:nil repeats:YES];
    }
      });
    
}
#pragma  mark 单击事件
-(void)toTap:(UITapGestureRecognizer *)sender{
    if (_selectImageBlock) {
         _selectImageBlock(index);
    }
   
}
#pragma  mark 左滑右滑
-(void)toChageImage:(UISwipeGestureRecognizer *)sender{
    [self.myTimer invalidate];
    self.myTimer =nil;
    if (self.imageArray.count>0) {
       
        if (sender.direction == UISwipeGestureRecognizerDirectionLeft) {
            index ++;
            if (index ==self.imageArray.count||index>self.imageArray.count ) {
                index=0;
            }
           
            self.myCatransition.subtype =kCATransitionFromRight;
            
        }else if  (sender.direction == UISwipeGestureRecognizerDirectionRight){
        
            index--;
            if (index<0) {
                index = self.imageArray.count-1;
            }
            self.myCatransition.subtype =kCATransitionFromLeft;
        }
        [self setBgImageViewData];

    }
    self.pageControl.currentPage =index;
   
}
-(void)pageTurn:(UIPageControl *)pageControl{
    
    [self.myTimer invalidate];
    self.myTimer =nil;

    NSInteger pageNumber  = [pageControl currentPage];
    if (pageNumber ==index) {
        return;
    }else if(pageNumber >index ){
        index =pageNumber;
          self.myCatransition.subtype =kCATransitionFromRight;
    }else{
        index =pageNumber;
         self.myCatransition.subtype =kCATransitionFromLeft;
    }
     [self setBgImageViewData];
     self.pageControl.currentPage= pageNumber;
}
-(void)setBgImageViewAnimation{
    
    index ++;
    if (index ==self.imageArray.count||index>self.imageArray.count ) {
        index=0;
    }
    self.myCatransition.subtype =kCATransitionFromRight;
    [self setBgImageViewData];
}

-(void)setBgImageViewData{
    
   
    self.pageControl.currentPage =index;
    [self.bgImageView setImage:[UIImage imageNamed:self.imageArray[index]]];
    [self.bgImageView.layer addAnimation:self.myCatransition forKey:@"transition"];
    if (self.myTimer.isValid!=YES) {
        [self initTime];
    }
    
}
- (void)stopAnimation{
    self.displayLink.paused = YES;
    [self.displayLink invalidate];
    self.displayLink = nil;
}
#pragma  mark 刷新数据
-(void)setImageArrayWithArray :(NSArray *)imageArr{
    if (imageArr.count>0) {
        [self.imageArray setArray:imageArr];
        [self initPageControl];
        [self initTime];
    }
   
    [self.bgImageView setImage:[UIImage imageNamed: imageArr[0] ]];
}
-(NSMutableArray *)imageArray{
    if (!_imageArray) {
        _imageArray = [[NSMutableArray alloc]init];
    }
    return _imageArray;
}
-(CATransition *)myCatransition{
    if (!_myCatransition) {
        _myCatransition = [CATransition animation];
        _myCatransition.type = kCATransitionPush;
        _myCatransition.duration =0.3;
    }
    return _myCatransition;
}
-(UIPageControl *)pageControl{
    if (!_pageControl) {
        _pageControl = [[UIPageControl alloc]initWithFrame:CGRectMake((self.frame.size.width-90),CGRectGetHeight(self.frame)-25,100, 20)];
    
        [_pageControl addTarget:self action:@selector(pageTurn:) forControlEvents:UIControlEventValueChanged];
    }
    return _pageControl;
}
-(NSTimer *)myTimer{
    
    return _myTimer;
}
 /*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
