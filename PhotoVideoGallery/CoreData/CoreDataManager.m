//
//  CoreDataManager.m
//  PhotoVideoGallery
//
//  Created by Ivan Novikov on 23.09.14.
//  Copyright (c) 2014 inov. All rights reserved.
//

#import "CoreDataManager.h"
#import "AppDelegate.h"

@implementation CoreDataManager

+(instancetype) sharedInstance
{
    static dispatch_once_t pred;
    static id shared = nil;
    dispatch_once(&pred, ^{
        shared = [[super alloc] initUniqueInstance];
    });
    return shared;
}

-(instancetype) initUniqueInstance
{
    return [super init];
}

- (CoreDataManager *)appDelegate
{
    CoreDataManager *appDelegate = (CoreDataManager *)[[UIApplication sharedApplication] delegate];
    return appDelegate;
}

- (NSManagedObjectModel *)managedObjectModel
{
    return self.appDelegate.managedObjectModel;
}

- (NSPersistentStoreCoordinator *)persistentStoreCoordinator
{
    return self.appDelegate.persistentStoreCoordinator;
}

- (NSManagedObjectContext *)managedObjectContext
{
    CoreDataManager *appDelegate = (CoreDataManager *)[[UIApplication sharedApplication] delegate];
    return appDelegate.managedObjectContext;
}

- (void)saveContext
{
    [self.appDelegate saveContext];
}

- (NSURL *)applicationDocumentsDirectory
{
   return [self.appDelegate applicationDocumentsDirectory];
}

- (NSArray *)loadCategoriesFromDB
{
    NSManagedObjectContext *context = [self managedObjectContext];
    NSEntityDescription *teamEntity = [NSEntityDescription entityForName:@"PVGCategory" inManagedObjectContext:context];
    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    [fetchRequest setEntity:teamEntity];
    
    NSArray *categories = [context executeFetchRequest:fetchRequest error:nil];

    return categories;
}

- (void)deleteCategory:(PVGCategory *)category
{
    NSManagedObject *object = (NSManagedObject *)category;
    [self.managedObjectContext deleteObject:object];
    [self saveContext];
}

- (void)insertNewCategoryWithName:(NSString *)name
{
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"PVGCategory" inManagedObjectContext:self.managedObjectContext];
    
    NSManagedObject *newManagedObject = [NSEntityDescription insertNewObjectForEntityForName:[entity name] inManagedObjectContext:self.managedObjectContext];
    
    // If appropriate, configure the new managed object.
    // Normally you should use accessor methods, but using KVC here avoids the need to add a custom class to the template.
    [newManagedObject setValue:name forKey:@"name"];
    
    // Save the context.
    NSError *error = nil;
    if (![self.managedObjectContext save:&error]) {
        // Replace this implementation with code to handle the error appropriately.
        // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        abort();
    }
}


- (void)insertNewObjectWithCategory: (PVGCategory *)category;
{
}

#pragma mark - Fetched results controller
- (NSFetchedResultsController *)fetchedResultsController
{
    if (_fetchedResultsController != nil) {
        return _fetchedResultsController;
    }
    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    // Edit the entity name as appropriate.
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"PVGCategory" inManagedObjectContext:self.managedObjectContext];
    
    [fetchRequest setEntity:entity];
    
    // Set the batch size to a suitable number.
    [fetchRequest setFetchBatchSize:20];
    
    // Edit the sort key as appropriate.
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"name" ascending:NO];
    NSArray *sortDescriptors = @[sortDescriptor];
    
    [fetchRequest setSortDescriptors:sortDescriptors];
    
    // Edit the section name key path and cache name if appropriate.
    // nil for section name key path means "no sections".
    NSFetchedResultsController *aFetchedResultsController = [[NSFetchedResultsController alloc] initWithFetchRequest:fetchRequest managedObjectContext:self.managedObjectContext sectionNameKeyPath:nil cacheName:@"Master"];
    aFetchedResultsController.delegate = self;
    self.fetchedResultsController = aFetchedResultsController;
    
    NSError *error = nil;
    if (![self.fetchedResultsController performFetch:&error]) {
        // Replace this implementation with code to handle the error appropriately.
        // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        abort();
    }
    
    return _fetchedResultsController;
}

@end
