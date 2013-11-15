//
//  NKDateView.m
//  DateScrolling2
//
//  Created by ben on 29.10.13.
//  Copyright (c) 2013 NK. All rights reserved.
//

#import "NKDateView.h"
#import "NKAppDelegate.h"
#import "Text.h"
@implementation NKDateView

@synthesize dateLabel = _dateLabel;
@synthesize textView = _textView;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    
        
        UILabel *dateLabel = [[UILabel alloc]initWithFrame:CGRectMake(0,0,frame.size.width,20)];
        dateLabel.backgroundColor = [UIColor yellowColor];
        dateLabel.textColor = [UIColor blackColor];
        dateLabel.textAlignment = NSTextAlignmentCenter;
        
        UITextView *textView = [[UITextView alloc] initWithFrame:CGRectMake(0,21,frame.size.width,frame.size.height - 20)];
        textView.backgroundColor = [UIColor whiteColor];
        
        textView = [self addToolbar:textView];
        
        [self addSubview:dateLabel];
        [self addSubview:textView];
        _dateLabel = dateLabel;
        _textView = textView;
    }
    return self;
}

-(UITextView *)addToolbar:(UITextView *)textView{
    UIToolbar* numberToolbar = [[UIToolbar alloc]initWithFrame:CGRectMake(0,0, 320, 50)];
    numberToolbar.barStyle = UIBarStyleBlack;
    [numberToolbar setBackgroundImage:[UIImage imageNamed:@"12_greyplane-1.png"] forToolbarPosition:UIToolbarPositionAny barMetrics:UIBarMetricsDefault];
    numberToolbar.items = [NSArray arrayWithObjects:
                           [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil],
                           [[UIBarButtonItem alloc]initWithTitle:@"Done" style:UIBarButtonItemStyleDone target:self action:@selector(doneWithNumberPad)],
                           nil];
    [numberToolbar sizeToFit];
    textView.inputAccessoryView = numberToolbar;
    return textView;
}
- (void)doneWithNumberPad {
    [_textView resignFirstResponder];
    
}

-(id) initWithFrame:(CGRect)frame date:(NSDate *)date{
    self = [self initWithFrame:frame];
    _dateLabel.text = [self dateFromString:date];
    return self;

}

-(NSString *)dateFromString:(NSDate *)date
{
    NSDateFormatter * date_format = [[NSDateFormatter alloc] init];
    [date_format setDateStyle: NSDateFormatterShortStyle];
    return [date_format stringFromDate: date];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
