//
//  FBBaseCoreDataResponder.h
//  FundBuyFinanceCenter
//
//  Created by Darwin on 15/8/5.
//  Copyright (c) 2015年 Darwin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>
@interface FBBaseCoreDataResponder : UIResponder
@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;
@end
