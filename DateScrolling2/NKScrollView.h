//
//  NKScrollView.h
//  DateScrolling2
//
//  Created by Kharitonov Sergey on 11/14/13.
//  Copyright (c) 2013 NK. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>
#import "NKDateView.h"

@interface NKScrollView : UIScrollView<UIScrollViewDelegate,NSFetchedResultsControllerDelegate>{
    NSDate *_currentDate;
    NKDateView *currentDateView;
}
@property (nonatomic,strong) NSManagedObjectContext *managedObjectContext;


-(NSDate *)DateWithoutTimeFromDate:(NSDate *) date;
-(void)saveText:(NSString *)Text date:(NSDate *)date;
- (void)saveContext;
@end
