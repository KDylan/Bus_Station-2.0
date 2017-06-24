//
//  Coding.m
//  runtime
//
//  Created by Edge on 16/7/26.
//  Copyright © 2016年 Edge. All rights reserved.
//

#import "Coding.h"
#import <objc/runtime.h>
@implementation Coding

-(void)encodeWithCoder:(NSCoder *)aCoder{
    
    unsigned int count=0;
    /**
     *  拷贝一个类的成员变量列表!
     *
     *  @param cls#>       哪个类!(参数类型: Class类型!!)
     *  @param outCount#>  成员变量的个数!(参数类型:指向int的指针!)
     *
     *  @return  Ivar * (返回值类型: 指向Ivar的指针!!)
     */

    Ivar *ivars =  class_copyIvarList([self class],&count);
    
    for (int i=0; i<count; i++) {
        // 取出属性
        Ivar ivar = ivars[i];
        //  查看成员变量
        const char *C_Name = ivar_getName(ivar);
        
        NSString *KEY = [NSString stringWithUTF8String:C_Name];
        //   归档
        [aCoder encodeObject:[self valueForKey:KEY] forKey:KEY];// 归档整个对象
    }
     //注意: 在C语言中 但凡用到了 new/creat/copy 这类函数!! 就要释放指针!!
    free(ivars);  //  释放指针
}

-(instancetype)initWithCoder:(NSCoder *)aDecoder{
   
    if (self=[super init]) {
        
        unsigned int count=0;
        
        Ivar *ivars = class_copyIvarList([self class], &count);
        for (int i=0; i<count; i++) {
            //  取出ivar
            Ivar ivar = ivars[i];
            const char *cName = ivar_getName(ivar);
            NSString *key = [NSString stringWithUTF8String:cName];
            //  解档
            id value = [aDecoder decodeObjectForKey:key];
            //  设置到属性上面去
            [self setValue:value forKey:key];
        }
        free(ivars);
    }
    return self;
}
@end
