//
//  Text.h
//  Notes
//
//  Created by Kharitonov Sergey on 11/14/13.
//  Copyright (c) 2013 NK. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Text : NSManagedObject

@property (nonatomic, retain) NSDate * date;
@property (nonatomic, retain) NSString * text;

@end
