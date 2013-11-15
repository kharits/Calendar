//
//  NKScrollView.m
//  DateScrolling2
//
//  Created by Kharitonov Sergey on 11/14/13.
//  Copyright (c) 2013 NK. All rights reserved.
//
#import "NKDateView.h"
#import "NKScrollView.h"
#import "Text.h"

@implementation NKScrollView
@synthesize managedObjectContext;
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        CGFloat width = frame.size.width;
        CGFloat height = frame.size.height-[UIApplication sharedApplication].statusBarFrame.size.height;

        self.pagingEnabled = YES;
        self.contentSize = CGSizeMake(width*3,height);
        self.showsHorizontalScrollIndicator = NO;
        self.showsVerticalScrollIndicator = NO;
    
        NSDate *date = [NSDate dateWithTimeIntervalSinceNow:0];
        _currentDate = [self DateWithoutTimeFromDate:date];
        currentDateView = [[NKDateView alloc] initWithFrame:CGRectMake(width,0,width,height) date:_currentDate];
        NKDateView *lastDateView = [[NKDateView alloc] initWithFrame:CGRectMake(0,0,width,height ) date:[_currentDate dateByAddingTimeInterval:-86400]];
        NKDateView *nextDateView = [[NKDateView alloc] initWithFrame:CGRectMake(width*2,0,width,height) date:[_currentDate dateByAddingTimeInterval:86400]];
        [self addSubview:lastDateView];
        [self addSubview:currentDateView];
        [self addSubview:nextDateView];
        [self setContentOffset:CGPointMake(width,0) animated:NO];
        [self setDelegate:self];
    }
    return self;
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

- (NSDate *)DateWithoutTimeFromDate:(NSDate *)date{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSInteger comps = (NSDayCalendarUnit | NSMonthCalendarUnit | NSYearCalendarUnit);
    
    NSDateComponents *date1Components = [calendar components:comps
                                                    fromDate: date];
    return [calendar dateFromComponents:date1Components];
    
}

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    
    CGFloat height = self.frame.size.height -[UIApplication sharedApplication].statusBarFrame.size.height;
    CGFloat width = self.frame.size.width;

    [self saveText:currentDateView.textView.text date:_currentDate];

    CGPoint point = scrollView.contentOffset;
    if (point.x == 640) _currentDate = [_currentDate dateByAddingTimeInterval:86400];
    if (point.x == 0) _currentDate = [_currentDate dateByAddingTimeInterval:-86400];
    
    currentDateView = [[NKDateView alloc] initWithFrame:CGRectMake(width,0,width,height) date:_currentDate];
    NKDateView *lastDateView = [[NKDateView alloc] initWithFrame:CGRectMake(0,0,width,height ) date:[_currentDate dateByAddingTimeInterval:-86400]];
    NKDateView *nextDateView = [[NKDateView alloc] initWithFrame:CGRectMake(width*2,0,width,height) date:[_currentDate dateByAddingTimeInterval:86400]];
    
    currentDateView.textView.text = [self getText:(NSDate *)_currentDate];
    [self addSubview:lastDateView];
    [self addSubview:currentDateView];
    [self addSubview:nextDateView];
    [self setContentOffset:CGPointMake(width,0) animated:NO];
}

-(void)saveText:(NSString *)text date:(NSDate *)date{
    NSManagedObjectContext *context = [self managedObjectContext];
    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Text" inManagedObjectContext:context];
    [fetchRequest setEntity:entity];
    NSError *error;
    NSArray *fetchedObjects = [context executeFetchRequest:fetchRequest error:&error];
    
    for (Text *txt in fetchedObjects) {
        NSComparisonResult result = [date compare:txt.date];
        if (result == NSOrderedAscending){
        }else if (result == NSOrderedDescending){
        }else{
            [context deleteObject:txt];
        }
    }
    if (![text isEqualToString:@""]) {
        Text *txt = [NSEntityDescription insertNewObjectForEntityForName:@"Text" inManagedObjectContext:context];
        txt.date = date;
        txt.text = text;
        [self saveContext];
    }
}

-(NSString *)getText:(NSDate *)date{
    NSManagedObjectContext *context = [self managedObjectContext];
    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Text" inManagedObjectContext:context];
    [fetchRequest setEntity:entity];
    NSError *error;
    NSArray *fetchedObjects = [context executeFetchRequest:fetchRequest error:&error];
    for (Text *txt in fetchedObjects) {
        NSComparisonResult result = [date compare:txt.date];
        if (result == NSOrderedAscending){
        }else if (result == NSOrderedDescending){
        }else{
            return txt.text;
        }
    }
    return @"";
}

- (void)saveContext
{
    NSManagedObjectContext *context = [self managedObjectContext];
    NSError *error = nil;
    
    if(![context save:&error]){
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        abort();
    }
}

@end
