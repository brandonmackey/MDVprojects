//
//  eventViewController.h
//  AOC2-Wk3
//
//  Created by Brandon Mackey on 7/24/13.
//  Copyright (c) 2013 Brandon Mackey. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface eventViewController : UIViewController

{
    IBOutlet UILabel *swipeLabelLeft;
    IBOutlet UIButton *closeKeyButton;
    IBOutlet UITextField *enterEvent;
    IBOutlet UIDatePicker *datePick;
    
    
    UIAlertView *alertView;
    
    NSDateFormatter *dateFormat;
    
    NSString *strDate;
    
    UISwipeGestureRecognizer *leftSwipe;
    

}


-(IBAction)onClose:(id)sender;
//-(IBAction)changeDate:(id)sender;



@end
