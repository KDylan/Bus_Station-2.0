//
//  UIBarButtonItem+UIBarButtonItem_TLUIBarButtonIteamExtention.m
//  巴士驿站
//
//  Created by Edge on 16/7/12.
//  Copyright © 2016年 Edge. All rights reserved.
//

#import "UIBarButtonItem+UIBarButtonItem_TLUIBarButtonIteamExtention.h"

@implementation UIBarButtonItem (UIBarButtonItem_TLUIBarButtonIteamExtention)
+(instancetype)iteamwithImageNamed:(NSString *)imageName HighImageNamed:(NSString *)HighImageName target:(id)target action:(SEL)action{
    UIButton *but = [[UIButton alloc]init];
    [but setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    [but setImage:[UIImage imageNamed:HighImageName] forState:UIControlStateHighlighted];
    but.frame = CGRectMake(0, 0, but.currentImage.size.width, but.currentImage.size.height);
    [but addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    //显示图片
    return [[UIBarButtonItem alloc]initWithCustomView:but];
}

@end
