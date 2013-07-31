//
//  ViewController.h
//  AOC2-Wk3
//
//  Created by Brandon Mackey on 7/24/13.
//  Copyright (c) 2013 Brandon Mackey. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "eventViewController.h"

@interface ViewController : UIViewController <eventViewDelegate>

{
    IBOutlet UIButton *addEventButton;
    IBOutlet UITextView *eventSaved;
    id <eventViewDelegate> delegate;
    NSString *enterStr;
    NSString *saveStr;
}

@property (strong) id <eventViewDelegate> delegate;

-(IBAction)onClick:(id)sender;

@end
