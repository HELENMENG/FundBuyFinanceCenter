//
//  EquipmentData.h
//  demo4CoreData
//
//  Created by JunhuaShao on 14/11/22.
//  Copyright (c) 2014年 JunhuaShao. All rights reserved.
//

#import <Mantle.h>

@interface EquipmentData : MTLModel<MTLJSONSerializing,MTLManagedObjectSerializing>

@property (copy, nonatomic, readonly) NSString *equipmentName;
@property (copy, nonatomic, readonly) NSString *equipmentLevel;

@end
