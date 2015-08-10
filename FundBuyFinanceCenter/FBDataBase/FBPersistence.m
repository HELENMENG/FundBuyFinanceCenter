//
//  FBPersistence.m
//  FundBuyFinanceCenter
//
//  Created by Darwin on 15/8/4.
//  Copyright (c) 2015年 Darwin. All rights reserved.
//

#import "FBPersistence.h"
#import "Mantle.h"
@implementation FBPersistence
@synthesize managedObjectContext;
@synthesize managedObjectModel;
@synthesize persistentStoreCoordinator;
//确定sqlite文件存储路径
-(NSURL *)storeURL{
    //得到数据库的路径
    //    NSString *docs = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    //    //CoreData是建立在SQLite之上的，数据库名称需与Xcdatamodel文件同名
    //    NSURL *storeUrl = [NSURL fileURLWithPath:[docs stringByAppendingPathComponent:@"CoreData.sqlite"]];
    
    NSArray *documnetDir=NSSearchPathForDirectoriesInDomains(NSDocumentationDirectory, NSUserDomainMask, YES);
    NSString *docDir=[documnetDir objectAtIndex:0];
    NSString *path=[docDir stringByAppendingPathComponent:@"CoreData.sqlite"];
    NSURL *storeURL=[NSURL fileURLWithPath:path];
    return storeURL;
}


//初始化Core Data使用的数据库
-(NSManagedObjectModel *)managedObjectModel
{
    if (managedObjectModel != nil) {
        return managedObjectModel;
    }
    NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"Coredata" withExtension:@"momd"];
    managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
    return managedObjectModel;
}

//managedObjectModel的初始化赋值函数
-(NSPersistentStoreCoordinator *)persistentStoreCoordinator
{
    if (persistentStoreCoordinator != nil) {
        return persistentStoreCoordinator;
    }
    
    NSError *error = nil;
    persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc]
                                  initWithManagedObjectModel:self.managedObjectModel];
    if (![persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType
                                                  configuration:nil
                                                            URL:[self storeURL]
                                                        options:nil
                                                          error:&error]) {
        NSLog(@"Error: %@,%@",error,[error userInfo]);
        [NSException raise:@"open failed" format:@"Reason:%@",[error localizedDescription]];
    }
    
    return persistentStoreCoordinator;
}

//managedObjectContext的初始化赋值函数
-(NSManagedObjectContext *)managedObjectContext
{
    if (managedObjectContext != nil) {
        return managedObjectContext;
    }
    
    NSPersistentStoreCoordinator *coordinator =self.persistentStoreCoordinator;
    
    if (coordinator != nil) {
        managedObjectContext = [[NSManagedObjectContext alloc]init];
        [managedObjectContext setPersistentStoreCoordinator:coordinator];
    }
    
    return managedObjectContext;
}

//保存MTLModel对象至coredata
-(BOOL)saveMTLModel:(MTLModel<MTLManagedObjectSerializing> *)mtlModel
              error:(NSError *__autoreleasing *)error{
    //-----Need Add Remove the Entity First  START---------
    NSManagedObject *exsitManagedObject=[self getManagedObject:mtlModel
                                                         error:error];
    if (exsitManagedObject!=nil) {
        [self.managedObjectContext deleteObject:exsitManagedObject];
        [self.managedObjectContext save:error];
    };
    //-----Need Add Remove the Entity First  END-----------
    
    NSManagedObject *managedObject = [MTLManagedObjectAdapter
                                      managedObjectFromModel:mtlModel
                                      insertingIntoContext:self.managedObjectContext
                                      error:error];
    
    if (managedObject==nil) {
        NSLog(@"[NSManagedObject] Error:%@",*error);
        return NO;
    }
    
    if (![self.managedObjectContext save:error]) {
        NSLog(@"[self.managedObjectContext] Error:%@",*error);
        return NO;
    };
    return YES;
};

//从coredata中提取出MTLModel
-(MTLModel *)getMTLmodel:(MTLModel<MTLManagedObjectSerializing> *)mtlModel
                   error:(NSError *__autoreleasing *)error{
    
    NSManagedObject *managedObject=[self getManagedObject:mtlModel error:error];
    MTLModel *mrlMotel=[[MTLModel alloc] init];
    
    mrlMotel = [MTLManagedObjectAdapter modelOfClass:[mtlModel class]
                                   fromManagedObject:managedObject error:error];
    
    if (error) {
        NSLog(@"[mrlMotel] Error:%@",*error);
    }
    return mrlMotel;
};

//从coredata中获取已存的ManagedObject
-(NSManagedObject *)getManagedObject:(MTLModel<MTLManagedObjectSerializing> *)mtlModel
                               error:(NSError *__autoreleasing *)error{
    NSString *entityName=[[mtlModel class] managedObjectEntityName];
    
    //获取entity中对象数量
    NSFetchRequest *requestCount=[NSFetchRequest fetchRequestWithEntityName:entityName];
    NSUInteger count=[self.managedObjectContext countForFetchRequest:requestCount
                                                               error:error];
    //获取entity中第一个对象.这个对象必须存在且唯一。
    if (count==1) {
        NSFetchRequest *request=[[NSFetchRequest alloc] init];
        [request setEntity:[NSEntityDescription entityForName:entityName
                                       inManagedObjectContext:self.managedObjectContext]];
//        NSSortDescriptor *sort=[[mtlModel class] sortDescriptor];
        NSArray *sortDes=[[NSArray alloc] initWithObjects: nil];
        [request setSortDescriptors:sortDes];
        NSArray *getObject=[self.managedObjectContext
                            executeFetchRequest:request
                            error:error];
        
        return [getObject objectAtIndex:0];
    }
    return nil;
}

//从文件系统中删除sqlite文件
-(bool)deleteAllEntities{
    bool status=NO;
    NSError *error;
    @try{
        [[NSFileManager defaultManager] removeItemAtPath:[self storeURL].path
                                                   error:&error];
        status=YES;
    }
    @catch (NSException *exception) {
        status=NO;
    }
    @finally {
        return status;
    }
}
@end
