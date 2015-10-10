//
//  PVGDetailPhotoVideoViewController.h
//  PhotoVideoGallery
//
//  Created by Ivan Novikov on 24.09.14.
//  Copyright (c) 2014 inov. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PVGDetailPhotoVideoViewController : UIViewController

@property (nonatomic, retain) id object;


@property (weak, nonatomic) IBOutlet UIView *objectView;
@property (weak, nonatomic) IBOutlet UIButton *isFavoriteButton;
@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
@property (weak, nonatomic) IBOutlet UITextView *comentTextView;

- (IBAction)saveButtonAction:(id)sender;
- (IBAction)cancelButtonAction:(id)sender;

@end
