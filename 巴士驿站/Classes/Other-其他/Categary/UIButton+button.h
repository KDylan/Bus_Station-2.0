//
//  UIButton+button.h
//  轻松学英语
//
//  Created by 胡潇炜 on 16/4/28.
//  Copyright © 2016年 胡潇炜. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIImage+Image.h"
@interface UIButton (button)

+(instancetype)setImage:(NSString *)imageName addTarget:(nullable id)target action:(SEL)action forControlEvents:(UIControlEvents)controlEvents;

+(instancetype)makeRect:(CGRect)rect buttonWithType:(UIButtonType)buttonType normalImage:(NSString *)normalImage selectImage:(NSString *)selectImage addTarget:(nullable id)target action:(SEL)action forControlEvents:(UIControlEvents)controlEvents;

@end
