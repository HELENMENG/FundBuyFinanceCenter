//
//  EquipmentData.m
//  demo4CoreData
//
//  Created by JunhuaShao on 14/11/22.
//  Copyright (c) 2014年 JunhuaShao. All rights reserved.
//

#import "EquipmentData.h"

@implementation EquipmentData

+ (NSDictionary *)JSONKeyPathsByPropertyKey
{
    return @{
             @"equipmentName":@"equipmentName",
             @"equipmentLevel":@"equipmentLevel",
             };
}


+ (instancetype)data:(NSDictionary *)jsonData
{
    NSError *error = nil;
    EquipmentData *data = [MTLJSONAdapter modelOfClass:[self class] fromJSONDictionary:jsonData error:&error];
    
    if (error) {
        NSLog(@"parse %@ data error:\n%@",NSStringFromClass([self class]),error);
    }
    return data;
}


#pragma mark - CoreData

+ (NSString *)managedObjectEntityName
{
    return NSStringFromClass([self class]);
}

+ (NSDictionary *)managedObjectKeysByPropertyKey
{
    return @{};
}


@end
