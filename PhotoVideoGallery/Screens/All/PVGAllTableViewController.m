//
//  PVGAllTableViewController.m
//  PhotoVideoGallery
//
//  Created by Ivan Novikov on 23.09.14.
//  Copyright (c) 2014 inov. All rights reserved.
//

#import "PVGAllTableViewController.h"
#import "CoreDataManager.h"
#import "PVGNewCategoryViewController.h"
#import "PVGAllCollectionViewController.h"

@interface PVGAllTableViewController ()

@end

@implementation PVGAllTableViewController
@synthesize categories = _categories;

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addNewCategory)];
    self.parentViewController.navigationItem.leftBarButtonItem = self.editButtonItem;
    self.parentViewController.navigationItem.rightBarButtonItem = addButton;
    self.parentViewController.navigationController.navigationBar.topItem.title = @"Все";
    
    NSArray *result = [CoreDataManagerInstance loadCategoriesFromDB];
    
    _categories = [NSMutableArray arrayWithArray:result];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return _categories.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"categoryCell" forIndexPath:indexPath];
    cell.textLabel.text = [[_categories objectAtIndex:indexPath.row] valueForKey:@"name"];
    // Configure the cell...
    
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        NSArray *array = [NSArray arrayWithObject:indexPath];
        [CoreDataManagerInstance deleteCategory:[_categories objectAtIndex:indexPath.row]];
        [_categories removeObjectAtIndex:indexPath.row];
        [self.tableView deleteRowsAtIndexPaths:array withRowAnimation:UITableViewAutomaticDimension];
    }
}

#pragma mark Add new category

- (void)addNewCategory
{
    PVGNewCategoryViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"NewCategoryViewController"];
    [self presentViewController:vc animated:YES completion:nil];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
    ((PVGAllCollectionViewController *)[segue destinationViewController]).category = [_categories objectAtIndex:indexPath.row];
}

@end
