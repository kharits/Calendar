//
//  NKViewController.h
//  DateScrolling2
//
//  Created by ben on 29.10.13.
//  Copyright (c) 2013 NK. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>
#import "NKScrollView.h"

@interface NKViewController : UIViewController //<UIScrollViewDelegate>

@property (nonatomic, strong) NSManagedObjectContext *managedObjectContext;
@property (strong, nonatomic) NKScrollView *scrollView;
@end
