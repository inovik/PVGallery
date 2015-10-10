//
//  PVGNewCategoryViewController.h
//  PhotoVideoGallery
//
//  Created by Ivan Novikov on 23.09.14.
//  Copyright (c) 2014 inov. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PVGNewCategoryViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *categoryNameTextfield;
- (IBAction)save:(id)sender;
- (IBAction)cancel:(id)sender;

@end
