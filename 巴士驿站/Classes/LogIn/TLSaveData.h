//
//  TLSaveData.h
//  巴士驿站
//
//  Created by Edge on 16/10/7.
//  Copyright © 2016年 Edge. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TLSaveData : NSObject//<NSCoding>
// 用户名
@property(nonatomic,strong)NSString *userName;
//  密码
@property(nonatomic,strong)NSString *passWord;

@end
