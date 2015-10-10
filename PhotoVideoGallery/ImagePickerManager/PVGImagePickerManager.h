//
//  PVGImagePickerManager.h
//  PhotoVideoGallery
//
//  Created by Ivan Novikov on 23.09.14.
//  Copyright (c) 2014 inov. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

#define ImagePickerInstance [PVGImagePickerManager sharedInstance]

@class PVGCategory;

@interface PVGImagePickerManager : NSObject <UIImagePickerControllerDelegate, UINavigationControllerDelegate>

@property (nonatomic, retain) UIViewController *currentCiewController;
@property (nonatomic, retain) PVGCategory *currentCategory;

//imagePicker settings

+(instancetype) sharedInstance;
// следующие объявления сгенерируют compile time ошибки при попытке их вызвать вручную.
// добавляем -copyWithZone: -allocWithZone: -copy по вкусу
+(instancetype) alloc __attribute__((unavailable("alloc not available, call sharedInstance instead")));
-(instancetype) init __attribute__((unavailable("init not available, call sharedInstance instead")));
+(instancetype) new __attribute__((unavailable("new not available, call sharedInstance instead")));

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info;
- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker;

- (void)newPhoto;
- (void)newVideo;

@end
