//
//  NKDateView.h
//  DateScrolling2
//
//  Created by ben on 29.10.13.
//  Copyright (c) 2013 NK. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NKDateView : UIView 
@property (weak, nonatomic) UILabel *dateLabel;
@property (weak, nonatomic) UITextView *textView;

- (id)initWithFrame:(CGRect)frame date:(NSDate *)date;
-(UITextView *)addToolbar:(UITextView *)textview;
@end
