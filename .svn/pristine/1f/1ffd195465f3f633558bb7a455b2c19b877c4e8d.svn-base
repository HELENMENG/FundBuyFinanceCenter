//
//  FBPersistence.h
//  FundBuyFinanceCenter
//
//  Created by Darwin on 15/8/4.
//  Copyright (c) 2015年 Darwin. All rights reserved.
//

#import <Foundation/Foundation.h>
@interface FBPersistence : NSObject

//数据模型对象
@property(strong,nonatomic) NSManagedObjectModel *managedObjectModel;
//上下文对象
@property(strong,nonatomic) NSManagedObjectContext *managedObjectContext;
//持久性存储区
@property(strong,nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

//确定sqlite文件存储路径
-(NSURL *)storeURL;

//初始化Core Data使用的数据库
-(NSPersistentStoreCoordinator *)persistentStoreCoordinator;

//managedObjectModel的初始化赋值函数
-(NSManagedObjectModel *)managedObjectModel;

//managedObjectContext的初始化赋值函数
-(NSManagedObjectContext *)managedObjectContext;

//保存MTLModel对象至coredata
-(BOOL)saveMTLModel:(MTLModel<MTLManagedObjectSerializing> *)mtlModel
              error:(NSError * __autoreleasing *)error;

//从coredata中提取出MTLModel
-(MTLModel *)getMTLmodel:(MTLModel<MTLManagedObjectSerializing> *)mtlModel
                   error:(NSError *__autoreleasing *)error;

//+ (NSFetchRequest *)fetchRequest;
@end
