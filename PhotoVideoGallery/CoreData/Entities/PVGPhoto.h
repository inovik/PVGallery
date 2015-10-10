//
//  PVGPhoto.h
//  PhotoVideoGallery
//
//  Created by Ivan Novikov on 23.09.14.
//  Copyright (c) 2014 inov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class PVGCategory;

@interface PVGPhoto : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSString * comment;
@property (nonatomic, retain) NSString * location;
@property (nonatomic, retain) NSString * link;
@property (nonatomic, retain) PVGCategory *category;

@end
