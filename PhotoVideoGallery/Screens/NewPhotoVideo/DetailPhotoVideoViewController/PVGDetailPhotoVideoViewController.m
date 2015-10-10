//
//  PVGDetailPhotoVideoViewController.m
//  PhotoVideoGallery
//
//  Created by Ivan Novikov on 24.09.14.
//  Copyright (c) 2014 inov. All rights reserved.
//

#import "PVGDetailPhotoVideoViewController.h"

@interface PVGDetailPhotoVideoViewController ()

@end

@implementation PVGDetailPhotoVideoViewController

@synthesize object = _object;

- (void)setObject:(id)object
{
    _object = object;
     NSLog(@"%@", NSStringFromClass([_object class]));
}

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

- (IBAction)saveButtonAction:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)cancelButtonAction:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}


@end
