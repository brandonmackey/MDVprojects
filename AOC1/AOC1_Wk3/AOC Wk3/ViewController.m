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

/////  Function called Add with two parameters and return both numbers 5 + 6 = 11  //////////////////////////

-(int)Add:(NSInteger) myInt myInt2:(NSInteger)myInt2
{
    return (myInt + myInt2);
}

/////  BOOL Function compares the two integers from step 1 are they equal YES or NO  //////////////////////////

-(BOOL)compare:(NSInteger)myInt myInt2:(NSInteger)myInt2

{
    if (myInt == myInt2) {
        return YES;
    }else{
        return NO;
    }
}

/////  Append Function takes two NSStrings and returns a new string with a MutableString method //////////////////////////

- (NSString*)append:(NSString*)myStr myStr2:(NSString*)myStr2
{
    NSMutableString *myMutableStr = [[NSMutableString alloc]initWithFormat:myStr];
    [myMutableStr appendString:myStr2];
    return myMutableStr;
}




- (void)viewDidLoad
{
    
    int name = [self Add:5 myInt2:6];
    NSLog(@"The Add function is = to %d", name);
    [super viewDidLoad];
	
    
    // Do any additional setup after loading the view, typically from a nib.

    
    
    
    
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
