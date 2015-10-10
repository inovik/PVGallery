//
//  PVGImagePickerManager.m
//  PhotoVideoGallery
//
//  Created by Ivan Novikov on 23.09.14.
//  Copyright (c) 2014 inov. All rights reserved.
//

#import "PVGImagePickerManager.h"
#import <MobileCoreServices/MobileCoreServices.h>

#import "PVGDetailPhotoVideoViewController.h"

#import "PVGPhoto.h"
#import "PVGVideo.h"


@implementation PVGImagePickerManager
{
    UIImagePickerController *imagePicker;
}


+(instancetype) sharedInstance {
    static dispatch_once_t pred;
    static id shared = nil;
    dispatch_once(&pred, ^{
        shared = [[super alloc] initUniqueInstance];
    });
    return shared;
}

-(instancetype) initUniqueInstance
{
    imagePicker = [[UIImagePickerController alloc] init];
    imagePicker.delegate = self;
    return [super init];
}

- (void)setCurrentCategory:(PVGCategory *)currentCategory
{
    _currentCategory = currentCategory;
    NSLog(@"added category");
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    
    PVGDetailPhotoVideoViewController *detailViewController = [self.currentCiewController.storyboard instantiateViewControllerWithIdentifier:@"PVGDetailPhotoVideoViewController"];
    
    UIImage *pickedImage = [info objectForKey:@"UIImagePickerControllerOriginalImage"];
    
    if (pickedImage) {
        detailViewController.object = pickedImage;
    }
    
    NSURL *videoURL = [info objectForKey:@"UIImagePickerControllerMediaURL"];
    if (videoURL) {
        detailViewController.object = videoURL;
    }
    
    [picker dismissViewControllerAnimated:NO completion:^{
        [self.currentCiewController presentViewController:detailViewController animated:YES completion:nil];
    }];
    
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [picker dismissViewControllerAnimated:YES completion:nil];
}

- (void)newPhoto
{
    imagePicker.sourceType = UIImagePickerControllerSourceTypeCamera;
    imagePicker.cameraCaptureMode = UIImagePickerControllerCameraCaptureModePhoto;
   
    [self.currentCiewController presentViewController:imagePicker animated:YES completion:nil];
}

- (void)newVideo
{
    imagePicker.sourceType = UIImagePickerControllerSourceTypeCamera;
    imagePicker.showsCameraControls = YES;
    imagePicker.mediaTypes = @[(NSString *)kUTTypeMovie];
    
    imagePicker.cameraCaptureMode = UIImagePickerControllerCameraCaptureModeVideo;
    
    [self.currentCiewController presentViewController:imagePicker animated:YES completion:nil];
}

@end
