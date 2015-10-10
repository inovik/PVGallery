//
//  PVGNewPhotoVideoViewController.m
//  PhotoVideoGallery
//
//  Created by Ivan Novikov on 23.09.14.
//  Copyright (c) 2014 inov. All rights reserved.
//

#import "PVGNewPhotoVideoViewController.h"
#import <MobileCoreServices/MobileCoreServices.h>
#import "PVGImagePickerManager.h"

#import "PVGDetailPhotoVideoViewController.h"

@interface PVGNewPhotoVideoViewController ()

@end

@implementation PVGNewPhotoVideoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    ImagePickerInstance.currentCiewController = self;
    self.images = [@[] mutableCopy];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    self.parentViewController.navigationItem.rightBarButtonItem = nil;
    self.parentViewController.navigationController.navigationBar.topItem.title = @"Новое";
}

- (IBAction)newPhotoButton:(id)sender
{
    [ImagePickerInstance newPhoto];
}

- (IBAction)newVideoButton:(id)sender
{
    [ImagePickerInstance newVideo];
}
@end
