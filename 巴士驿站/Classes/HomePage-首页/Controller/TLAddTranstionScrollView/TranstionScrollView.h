//
//  TranstionScrollView.h
//  YY
//
//  Created by chenHS on 16/6/17.
//  Copyright © 2016年 . All rights reserved.
//

#import <UIKit/UIKit.h>
#define ScrollTimeInterval 3.0f
typedef void (^SelectImageBlock) (NSInteger index);
@interface TranstionScrollView : UIView{
    NSInteger index;
}
@property (nonatomic, strong) CATransition * myCatransition;
@property (nonatomic, strong)  UISwipeGestureRecognizer  * leftTap;
@property (nonatomic, strong)  UISwipeGestureRecognizer  * rightTap;
@property (nonatomic, strong) UITapGestureRecognizer *tap;
@property (nonatomic, strong) UIImageView * bgImageView;
@property (nonatomic, strong) NSMutableArray  *imageArray;
@property (nonatomic, copy) SelectImageBlock  selectImageBlock;
@property (nonatomic, strong) UIPageControl *pageControl;
@property (nonatomic, strong) CADisplayLink * displayLink;
@property (nonatomic, strong)NSTimer *myTimer;
-(instancetype)initWithFrame:(CGRect)frame placeholder:(UIImage *)placeholder;
-(void)setImageArrayWithArray :(NSArray *)imageArr;

@end
