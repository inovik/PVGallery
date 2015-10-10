//
//  CoreDataManager.h
//  PhotoVideoGallery
//
//  Created by Ivan Novikov on 23.09.14.
//  Copyright (c) 2014 inov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class PVGCategory;

#define CoreDataManagerInstance [CoreDataManager sharedInstance]

@interface CoreDataManager : NSObject <NSFetchedResultsControllerDelegate>


@property (nonatomic, retain) CoreDataManager *appDelegate;
@property (nonatomic, strong) NSFetchedResultsController *fetchedResultsController;
@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

+(instancetype) sharedInstance;

+(instancetype) alloc __attribute__((unavailable("alloc not available, call sharedInstance instead")));
-(instancetype) init __attribute__((unavailable("init not available, call sharedInstance instead")));
+(instancetype) new __attribute__((unavailable("new not available, call sharedInstance instead")));

- (NSArray *)loadCategoriesFromDB;

- (void)deleteCategory:(PVGCategory *)category;
- (void)insertNewCategoryWithName:(NSString *)name;
- (void)insertNewObjectWithCategory:(PVGCategory *)category;

- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;

@end
