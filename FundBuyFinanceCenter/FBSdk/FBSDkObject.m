//
//  FBSDkObject.m
//  FundBuyFinanceCenter
//
//  Created by Darwin on 15/8/4.
//  Copyright (c) 2015年 Darwin. All rights reserved.
//

#import "FBSDkObject.h"

@implementation FBMember
-(id)initWithDictionary:(NSDictionary *)dictionaryValue error:(NSError *__autoreleasing *)error{
    self = [super init];
    if (self) {
        self.mobilePhone = [dictionaryValue objectForKey:@"mobilePhone"];
        self.nickname = [dictionaryValue objectForKey:@"nickname"];
        self.userId = [dictionaryValue objectForKey:@"userId"];
    }
    return self;
}
+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
             @"mobilePhone": @"mobilePhone",
             @"nickname": @"nickname",
             @"userId": @"userId",
             };
}

+ (NSString *)managedObjectEntityName {
    return NSStringFromClass([self class]);
}

+ (NSDictionary *)managedObjectKeysByPropertyKey {
    return nil;
}

+ (instancetype)data:(NSDictionary *)jsonData
{
    NSError *error = nil;
    FBMember *data = [MTLJSONAdapter modelOfClass:[self class] fromJSONDictionary:jsonData error:&error];
    
    if (error) {
        NSLog(@"parse %@ data error:\n%@",NSStringFromClass([self class]),error);
    }
    return data;
}
- (BOOL)isEqual:(FBMember *)object
{
    if ([object isKindOfClass:[self class]]) {
        return [object.nickname isEqualToString:self.nickname];
    } else {
        return NO;
    }
}
@end

@implementation BannerWrapper

#pragma mark - JSON serialization

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
             @"result" : @"result",
             @"resultId" : @"resultId",
             @"resultMsg" : @"resultMSG",
             @"bannerList" : @"banner"
             };
}

+ (NSValueTransformer *)bannerListJSONTransformer
{
    return [NSValueTransformer mtl_JSONArrayTransformerWithModelClass:[Banner class]];
}

#pragma mark - Managed object serialization

+ (NSString *)managedObjectEntityName {
    return @"BannerWrapper";
}

+ (NSDictionary *)managedObjectKeysByPropertyKey {
    return nil;
}

+(NSDictionary *)relationshipModelClassesByPropertyKey{
    return @{
             @"bannerList"  : [Banner class],
             };
}

//在从coredata中取数据时的数据排序方式
+(NSSortDescriptor *)sortDescriptor{
    return [[NSSortDescriptor alloc] initWithKey:@"resultId" ascending:YES];
}

@end

@implementation Banner

#pragma mark - JSON serialization

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
             @"bannerId" : @"id",
             @"picUrl" : @"picUrl",
             @"toDetailUrl" : @"toDetailUrl",
             @"width":@"width",
             @"height":@"height"
             };
}

#pragma mark - Managed object serialization

+ (NSString *)managedObjectEntityName {
    return @"Banner";
}

+ (NSDictionary *)managedObjectKeysByPropertyKey {
    return nil;
}

@end
