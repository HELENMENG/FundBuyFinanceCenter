//
//  FBSDkObject.h
//  FundBuyFinanceCenter
//
//  Created by Darwin on 15/8/4.
//  Copyright (c) 2015年 Darwin. All rights reserved.
//

@interface FBMember : MTLModel<MTLJSONSerializing,MTLManagedObjectSerializing>
{
    NSString *_mobilePhone;
    NSString *_nickname;//用户昵称
    NSNumber * _userId;
    
}
@property(nonatomic,strong) NSString * mobilePhone;
@property (nonatomic,strong) NSString *nickname;
@property(nonatomic,strong)NSNumber *userId;

+ (instancetype)data:(NSDictionary *)jsonData;
@end

@interface BannerWrapper : MTLModel <MTLJSONSerializing,MTLManagedObjectSerializing>

@property (nonatomic, readonly) bool result;
@property (copy, nonatomic, readonly) NSNumber *resultId;
@property (copy, nonatomic, readonly) NSString *resultMsg;
@property (copy, nonatomic) NSArray *bannerList;
+(NSSortDescriptor *)sortDescriptor;
@end

@interface Banner : MTLModel <MTLJSONSerializing, MTLManagedObjectSerializing>

@property (copy, nonatomic, readonly) NSNumber *bannerId;
@property (copy, nonatomic, readonly) NSString *picUrl;
@property (copy, nonatomic, readonly) NSString *toDetailUrl;
@property (copy, nonatomic, readonly) NSNumber *width;
@property (copy, nonatomic, readonly) NSNumber *height;

@end




