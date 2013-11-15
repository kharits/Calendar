//
//  NKViewController.m
//  DateScrolling2
//
//  Created by ben on 29.10.13.
//  Copyright (c) 2013 NK. All rights reserved.
//
#import "NKDateView.h"
#import "NKViewController.h"

@implementation NKViewController
@synthesize scrollView = _scrollView;
- (void)viewDidLoad
{
    [super viewDidLoad];

    NKScrollView *scrollView = [[NKScrollView alloc] initWithFrame:[[UIScreen mainScreen] applicationFrame]];
    //[scrollView setDelegate:self];
    [self.view addSubview:scrollView];
    scrollView.managedObjectContext = self.managedObjectContext;
    _scrollView = scrollView;
  
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end