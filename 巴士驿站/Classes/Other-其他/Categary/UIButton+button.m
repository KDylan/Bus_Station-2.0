//
//  UIButton+button.m
//  轻松学英语
//
//  Created by 胡潇炜 on 16/4/28.
//  Copyright © 2016年 胡潇炜. All rights reserved.
//

#import "UIButton+button.h"

@implementation UIButton (button)

+(instancetype)setImage:(NSString *)imageName addTarget:(nullable id)target action:(SEL)action forControlEvents:(UIControlEvents)controlEvents
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setImage:[UIImage imageWithOriginalName:imageName] forState:UIControlStateNormal];
    [button addTarget:target action:action forControlEvents:controlEvents];
    [button sizeToFit];
    return button;

}

+(instancetype)makeRect:(CGRect)rect buttonWithType:(UIButtonType)buttonType normalImage:(NSString *)normalImage selectImage:(NSString *)selectImage addTarget:(nullable id)target action:(SEL)action forControlEvents:(UIControlEvents)controlEvents
{
    UIButton *button = [UIButton buttonWithType:buttonType];
    button.frame = rect;
    [button setImage:[UIImage imageNamed:selectImage] forState:UIControlStateSelected];
    [button setImage:[UIImage imageNamed:normalImage] forState:UIControlStateNormal];
    [button sizeToFit];
    [button addTarget:target action:action forControlEvents:controlEvents];
    return button;
}
@end
