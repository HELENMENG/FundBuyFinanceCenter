//
//  PlayerData.m
//  demo4CoreData
//
//  Created by JunhuaShao on 14/11/22.
//  Copyright (c) 2014年 JunhuaShao. All rights reserved.
//

#import "PlayerData.h"

@implementation PlayerData

+ (NSDictionary *)JSONKeyPathsByPropertyKey
{
    return @{
              @"playerIconUrl":@"url",
              @"playerName":@"name",
              @"serverTag":@"tag",
              @"saveDate":@"time",
             };
}

// 将equipments数组中的元素自动转换成EquipmentData
+ (NSValueTransformer *)equipmentsJSONTransformer
{
    return [MTLValueTransformer mtl_JSONArrayTransformerWithModelClass:EquipmentData.class];
}

+ (instancetype)data:(NSDictionary *)jsonData
{
    NSError *error = nil;
    PlayerData *data = [MTLJSONAdapter modelOfClass:[self class] fromJSONDictionary:jsonData error:&error];
    
    if (error) {
        NSLog(@"parse %@ data error:\n%@",NSStringFromClass([self class]),error);
    }
    return data;
}

- (BOOL)isEqual:(PlayerData *)object
{
    if ([object isKindOfClass:[self class]]) {
        return [object.playerName isEqualToString:self.playerName];
    } else {
        return NO;
    }
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

+ (NSDictionary *)relationshipModelClassesByPropertyKey
{
    return @{@"equipments":EquipmentData.class};
}

+ (NSValueTransformer *)isBindPlayerEntityAttributeTransformer
{
    
    return [[NSValueTransformer valueTransformerForName:MTLBooleanValueTransformerName] mtl_invertedTransformer];
}


@end
