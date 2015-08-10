//
//  PlayerData.h
//  demo4CoreData
//
//  Created by JunhuaShao on 14/11/22.
//  Copyright (c) 2014年 JunhuaShao. All rights reserved.
//

#import <Mantle.h>
#import "EquipmentData.h"
@interface PlayerData : MTLModel<MTLJSONSerializing,MTLManagedObjectSerializing>

@property (copy, nonatomic, readonly) NSString *playerIconUrl;

@property (copy, nonatomic, readonly) NSString *playerName;
@property (copy, nonatomic, readonly) NSString *serverTag;
// EquipmentData 记得在model中，将对应关系写成toMany
@property (copy, nonatomic, readonly) NSArray  *equipments;

@property (assign, nonatomic)         NSNumber *isBindPlayer;

// 时间戳 timeIntervalSince1970
@property (copy, nonatomic, readonly) NSNumber *saveDate;

+ (instancetype)data:(NSDictionary *)jsonData;

@end
