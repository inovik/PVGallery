//
//  PVGNewCategoryViewController.m
//  PhotoVideoGallery
//
//  Created by Ivan Novikov on 23.09.14.
//  Copyright (c) 2014 inov. All rights reserved.
//

#import "PVGNewCategoryViewController.h"
#import "CoreDataManager.h"

@interface PVGNewCategoryViewController ()

@end

@implementation PVGNewCategoryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)save:(id)sender
{
    if ( ![self.categoryNameTextfield.text isEqualToString:@""] )
    {
        [CoreDataManagerInstance insertNewCategoryWithName:self.categoryNameTextfield.text];
    }
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)cancel:(id)sender
{
    self.categoryNameTextfield.text = @"";
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
