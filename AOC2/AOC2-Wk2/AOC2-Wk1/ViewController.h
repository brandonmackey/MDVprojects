//
//  ViewController.h
//  AOC2-Wk1
//
//  Created by Brandon Mackey on 6/26/13.
//  Copyright (c) 2013 Brandon Mackey. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "myFitness.h"

@interface ViewController : UIViewController <UITextFieldDelegate>

{
//    UILabel *run;
//    UILabel *run2;
//    UILabel *push;
//    UILabel *push2;
//    UILabel *sit;
//    UILabel *sit2;
    
    // button calls //
    
    IBOutlet UITextField *textfield;
    IBOutlet UIButton *runButton;
    IBOutlet UIButton *pushupButton;
    IBOutlet UIButton *situpButton;
    IBOutlet UIButton *infoButton;
    IBOutlet UIButton *calButton;
    IBOutlet UIStepper *stepper;
    IBOutlet UILabel *label;

    int currentValue;

}

    

// All button clicks/////////

-(IBAction)onclick:(id)sender;


// Segmented Controller/ Background Colors /////////

-(IBAction)onChange:(id)sender;


// Stepper /////////

-(IBAction)onStep:(id)sender;

// calculate button /////////

-(IBAction)onCalculate:(id)sender;



@end
