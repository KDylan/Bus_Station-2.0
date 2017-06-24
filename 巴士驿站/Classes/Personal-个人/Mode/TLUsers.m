//
//  TLUsers.m
//  巴士驿站
//
//  Created by Edge on 16/7/17.
//  Copyright © 2016年 Edge. All rights reserved.
//

#import "TLUsers.h"
@implementation TLUsers
//-(void)encodeWithCoder:(NSCoder *)aCoder{
////  归档属性
//    [aCoder encodeObject:self.passName forKey:@"passName"];
//    [aCoder encodeObject:self.passID forKey:@"passID"];
//    [aCoder encodeObject:self.pPaper forKey:@"pPaper"];
//    [aCoder encodeObject:self.pNumber forKey:@"pNumber"];
//
//}
////  解档
//-(instancetype)initWithCoder:(NSCoder *)aDecoder{
//    if (self=[super init]) {
//        self.passName = [aDecoder decodeObjectForKey:@"passName"];
//         self.passID = [aDecoder decodeObjectForKey:@"passID"];
//         self.pPaper = [aDecoder decodeObjectForKey:@"pPaper"];
//         self.pNumber = [aDecoder decodeObjectForKey:@"pNumber"];
//    }
//    return self;
//}
//+ (instancetype)statusWithDict:(NSDictionary *)dict
//{
//    return [[self alloc] initWithDict:dict];
//}
-(id)init{
    if (self=[super init]) {
        self.select=NO;
    }
    return self;
}
- (id)initWithDict:(NSDictionary *)dict
{
    if (self = [super init]) {
        self.PassengersName= dict[@"PassengersName"];
        self.PassengersIDCardNo = dict[@"PassengersIDCardNo"];
        self.PassengersIDType = dict[@"PassengersIDType"];
        self.PassengersPhoneNumber = dict[@"PassengersPhoneNumber"];
    }
    return self;
}
@end
