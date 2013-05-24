//
//  ViewController.m
//  AOC Wk3
//
//  Created by Brandon Mackey on 5/21/13.
//  Copyright (c) 2013 Brandon Mackey. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

//////////////////////////////////////// FUNCTIONS GO HERE!!  ///////////////////////////////////////////////


/////  Function called Add with two parameters and return both numbers 5 + 6 = 11  //////////////////////////

-(int)Add:(NSInteger) myInt myInt2:(NSInteger)myInt2      // added to ViewController.h
{
    return myInt + myInt2;
}

/////  BOOL Function compares the two integers from step 1 are they equal YES or NO  //////////////////////////

-(BOOL)compare:(NSInteger)myInt myInt2:(NSInteger)myInt2    // added to ViewController.h

{
    if (myInt == myInt2) {
        return YES;
    }else{
        return NO;
    }
}

/////  Append Function takes two NSStrings and returns a new string with a MutableString method //////////////////////////

- (NSString*)append:(NSString*)myStr myStr2:(NSString*)myStr2     // added to ViewController.h
{
    NSMutableString *myMutableStr = [[NSMutableString alloc]initWithFormat:myStr];
    [myMutableStr appendString:myStr2];
    return myMutableStr;
}

///// DisplayAlertWithString Function will take a parameter an NSString  //////////////////////////

-(void) displayAlertWithString:(NSString*) myMsg
{
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Loading" message:myMsg delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil];
    
    if (alertView != nil) {
        [alertView show];
    }
}


- (void)viewDidLoad
{
 
//////////////////////////////////////// CALL FUNCTIONS GO HERE!!  ///////////////////////////////////////////////    
    
    // Add Function and log to debugger
    
    NSInteger addFunct = [self Add:5 myInt2:6];   // step 6
    NSLog(@"The Add function is = to %d", addFunct);
    
    NSNumber *comboInt = [[NSNumber alloc] initWithInt:addFunct];  // combine the addFunct number VALUE
    
    NSString *convertStr = [NSString stringWithFormat:@"The number is %@", comboInt]; // add to alert msg
    
    [self displayAlertWithString:convertStr]; // display to alert box
    
    
    
    
    // Call append Function Display UIAlertView w/ appended string using displayAlertWithString
    
    NSString *myAlert = [self append:@"Why is the sky blue?" myStr2:@" Because I said so."];
    [self displayAlertWithString: myAlert];
    
    
    
    
    
    
    [super viewDidLoad];
	
    
    // Do any additional setup after loading the view, typically from a nib.

    
    
    
    
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
