//
//  PVGNewPhotoVideoViewController.h
//  PhotoVideoGallery
//
//  Created by Ivan Novikov on 23.09.14.
//  Copyright (c) 2014 inov. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PVGNewPhotoVideoViewController : UIViewController 
@property (strong, nonatomic) NSMutableArray *images;

- (IBAction)newPhotoButton:(id)sender;
- (IBAction)newVideoButton:(id)sender;

@end
