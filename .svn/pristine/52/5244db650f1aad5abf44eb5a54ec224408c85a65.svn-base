//
//  MasterViewController.m
//  FundBuyFinanceCenter
//
//  Created by Darwin on 15/8/3.
//  Copyright (c) 2015年 Darwin. All rights reserved.
//

#import "MasterViewController.h"
#import "DetailViewController.h"
#import "FBSDkObject.h"
#import "FBPersistence.h"
#import "AppDelegate.h"
#import "PlayerData.h"
@interface MasterViewController ()

@end

@implementation MasterViewController

- (void)awakeFromNib {
    [super awakeFromNib];
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad) {
        self.clearsSelectionOnViewWillAppear = NO;
        self.preferredContentSize = CGSizeMake(320.0, 600.0);
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    AppDelegate  *delegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
   [self createContent];
    NSLog(@"%@",[self queryAllOfData:delegate.managedObjectContext]);
//    NSArray *dataArr=[self queryAllOfData:delegate.managedObjectContext];
    [self updateData:@"30" withIsLook:@"" withContext:delegate.managedObjectContext];
    [self selectData:10 andOffset:10 withContext:delegate.managedObjectContext];
   // [self deleteAllOfData:dataArr withManage:delegate.managedObjectContext];
   // Do any additional setup after loading the view, typically from a nib.
    self.navigationItem.leftBarButtonItem = self.editButtonItem;
    
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.tableView.emptyDataSetSource = self;
    self.tableView.emptyDataSetDelegate = self;
    
    // A little trick for removing the cell separators
    self.tableView.tableFooterView = [UIView new];
    [self.tableView reloadData];
    [self.tableView reloadEmptyDataSet];
}
#pragma mark - UITableViewDataSource Methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    
    return cell;
}
- (UIImage *)imageForEmptyDataSet:(UIScrollView *)scrollView
{
    return [UIImage imageNamed:@"placeholder_dropbox.png"];
}
- (NSAttributedString *)titleForEmptyDataSet:(UIScrollView *)scrollView
{
    NSString *text = @"Please Allow Photo Access";
    
    NSDictionary *attributes = @{NSFontAttributeName: [UIFont boldSystemFontOfSize:18.0],
                                 NSForegroundColorAttributeName: [UIColor darkGrayColor]};
    
    return [[NSAttributedString alloc] initWithString:text attributes:attributes];
}

- (NSAttributedString *)descriptionForEmptyDataSet:(UIScrollView *)scrollView
{
    NSString *text = @"This allows you to share photos from your library and save photos to your camera roll.";
    
    NSMutableParagraphStyle *paragraph = [NSMutableParagraphStyle new];
    paragraph.lineBreakMode = NSLineBreakByWordWrapping;
    paragraph.alignment = NSTextAlignmentCenter;
    
    NSDictionary *attributes = @{NSFontAttributeName: [UIFont systemFontOfSize:14.0],
                                 NSForegroundColorAttributeName: [UIColor lightGrayColor],
                                 NSParagraphStyleAttributeName: paragraph};
    
    return [[NSAttributedString alloc] initWithString:text attributes:attributes];
}
- (NSAttributedString *)buttonTitleForEmptyDataSet:(UIScrollView *)scrollView forState:(UIControlState)state
{
    NSDictionary *attributes = @{NSFontAttributeName: [UIFont boldSystemFontOfSize:17.0]};
    
    return [[NSAttributedString alloc] initWithString:@"Continue" attributes:attributes];
}
- (UIImage *)buttonImageForEmptyDataSet:(UIScrollView *)scrollView forState:(UIControlState)state
{
    return [UIImage imageNamed:@"button_image"];
}
- (UIColor *)backgroundColorForEmptyDataSet:(UIScrollView *)scrollView
{
    return [UIColor whiteColor];
}
- (BOOL)emptyDataSetShouldDisplay:(UIScrollView *)scrollView
{
    return YES;
}
- (BOOL)emptyDataSetShouldAllowScroll:(UIScrollView *)scrollView
{
    return YES;
}
- (void)emptyDataSetDidTapView:(UIScrollView *)scrollView
{
    // Do something
}
- (void)emptyDataSetDidTapButton:(UIScrollView *)scrollView
{
    // Do something
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)createContent
{
    AppDelegate *delegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    for (FBMember *data in [self jsonData]) {
        [self createEntityInContext:delegate.managedObjectContext data:data];
    }
    [delegate saveContext];
    
}

- (NSArray*)jsonData
{
    NSMutableArray *arr = [NSMutableArray array];
    
    for (int i = 0; i < 20; i++) {
        NSMutableDictionary *dic=[[NSMutableDictionary alloc]init];
        [dic setObject:@"18610319663" forKey:@"mobilePhone"];
        [dic setObject:@"Darwin" forKey:@"nickname"];
        [dic setObject:[[NSNumber alloc] initWithInteger:i] forKey:@"userId"];
        FBMember *data = [FBMember data:dic];
        [arr addObject:data];
    }
    return arr;
}

- (NSManagedObject *)createEntityInContext:(NSManagedObjectContext *)context data:(FBMember *)data
{
    
    NSError *error = nil;
    
    NSManagedObject *object = [MTLManagedObjectAdapter managedObjectFromModel:data insertingIntoContext:context error:&error];
    
    NSAssert(error == nil, @"error-->%@",error);
    
    return object;
}
//查询
- (NSMutableArray*)selectData:(int)pageSize andOffset:(int)currentPage withContext:(NSManagedObjectContext *)context
{
    
    // 限定查询结果的数量
    //setFetchLimit
    // 查询的偏移量
    //setFetchOffset
    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    
    [fetchRequest setFetchLimit:pageSize];
    [fetchRequest setFetchOffset:currentPage];
    
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"FBMember" inManagedObjectContext:context];
    [fetchRequest setEntity:entity];
    NSError *error;
    NSArray *fetchedObjects = [context executeFetchRequest:fetchRequest error:&error];
    NSMutableArray *resultArray = [NSMutableArray array];
    
    for (FBMember *info in fetchedObjects) {
        NSLog(@"userId:%ld", info.userId.integerValue);
        [resultArray addObject:info];
    }
    return resultArray;
}
//删除数据
-(void)deleteAllOfData:(NSMutableArray *)data withManage:(NSManagedObjectContext *)context{
    
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"FBMember" inManagedObjectContext:context];
    
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    [request setIncludesPropertyValues:NO];
    [request setEntity:entity];
    NSError *error = nil;
    NSArray *datas = [context executeFetchRequest:request error:&error];
    if (!error && datas && [datas count])
    {
        for (NSManagedObject *obj in datas)
        {
            [context deleteObject:obj];
        }
        if (![context save:&error])
        {
            NSLog(@"error:%@",error);
        }
    }

}
//查询所有数据
- (NSArray *)queryAllOfData:(NSManagedObjectContext *)context
{
    NSError *error = nil;
    
    NSFetchRequest *fetchRequest = [self fetchRequest];
    
    NSArray *datas = [context executeFetchRequest:fetchRequest error:&error];
    NSMutableArray * arr = [NSMutableArray array];
    
    for (NSManagedObject *obj in datas) {
        FBMember *data = [MTLManagedObjectAdapter modelOfClass:[FBMember class] fromManagedObject:obj error:nil];
        [arr addObject:data];
    }
    
    NSAssert(error == nil, @"error-->%@",error);
    return arr;
}
//更新
- (void)updateData:(NSString*)newsId  withIsLook:(NSString*)islook withContext:(NSManagedObjectContext *)context
{
    
    NSPredicate *predicate = [NSPredicate
                              predicateWithFormat:@"userId like[cd] %@",newsId];
    //首先你需要建立一个request
    NSFetchRequest * request = [[NSFetchRequest alloc] init];
    [request setEntity:[NSEntityDescription entityForName:@"FBMember" inManagedObjectContext:context]];
    [request setPredicate:predicate];
    //这里相当于sqlite中的查询条件，具体格式参考苹果文档
    //https://developer.apple.com/library/mac/#documentation/Cocoa/Conceptual/Predicates/Articles/pCreating.html
    NSError *error = nil;
    NSArray *result = [context executeFetchRequest:request error:&error];//这里获取到的是一个数组，你需要取出你要更新的那个obj
    for (FBMember *info in result) {
        info.nickname=@"Meng";
    }
    //保存
    if ([context save:&error]) {
        //更新成功
        NSLog(@"更新成功");
    }
}
- (NSFetchRequest *)fetchRequest
{
    NSSortDescriptor *sortBySaveDate = [NSSortDescriptor sortDescriptorWithKey:@"userId" ascending:NO];
    NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:[FBMember managedObjectEntityName]];
    [fetchRequest setSortDescriptors:@[sortBySaveDate]];
    fetchRequest.fetchBatchSize = 5;
    return fetchRequest;
}
/*
// Implementing the above methods to update the table view in response to individual changes may have performance implications if a large number of changes are made simultaneously. If this proves to be an issue, you can instead just implement controllerDidChangeContent: which notifies the delegate that all section and object changes have been processed. 
 
 - (void)controllerDidChangeContent:(NSFetchedResultsController *)controller
{
    // In the simplest, most efficient, case, reload the table view.
    [self.tableView reloadData];
}
 */

@end
