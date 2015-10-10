//
//  PVGCategory.h
//  PhotoVideoGallery
//
//  Created by Ivan Novikov on 23.09.14.
//  Copyright (c) 2014 inov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface PVGCategory : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSManagedObject *childrensVideo;
@property (nonatomic, retain) NSManagedObject *childrensPhoto;

@end
