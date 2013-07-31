//
//  eventViewController.h
//  AOC2-Wk3
//
//  Created by Brandon Mackey on 7/24/13.
//  Copyright (c) 2013 Brandon Mackey. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol eventViewDelegate <NSObject>

@required
-(void)pageSaved:(NSString*)savedEvent date:(NSString*)date;

@end


@interface eventViewController : UIViewController <UITextFieldDelegate, UIPickerViewDelegate>

{
    IBOutlet UIButton *saveButton;
    IBOutlet UIButton *closeKeyButton;
    IBOutlet UITextField *enterEvent;
    IBOutlet UIDatePicker *datePick;
    UIAlertView *alertView;
    NSDateFormatter *dateFormat;
    NSString *strDate;
    
    id <eventViewDelegate> delegate;
}

-(IBAction)onClick2:(id)sender;
-(IBAction)onClose:(id)sender;
-(IBAction)changeDate:(id)sender;

@property (strong) id <eventViewDelegate> delegate;

@end
