//
//  ViewController.h
//  AOC2-Wk3
//
//  Created by Brandon Mackey on 7/24/13.
//  Copyright (c) 2013 Brandon Mackey. All rights reserved.
//

#import <UIKit/UIKit.h>
//#import "eventViewController.h"
//#import "Singleton.h"

@interface ViewController : UIViewController 

{
    IBOutlet UILabel *swipeLabel;
    IBOutlet UITextView *eventSaved;
    IBOutlet UIButton *saveAndClose;
    
    UIAlertView *alert;
    
    NSUserDefaults *defaults;
   
    UISwipeGestureRecognizer *rightSwipe;
    
}



//-(IBAction)onClick:(id)sender;
-(IBAction)onSave:(id)sender;


@end
