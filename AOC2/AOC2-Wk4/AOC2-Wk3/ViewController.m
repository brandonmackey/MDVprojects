//
//  ViewController.m
//  AOC2-Wk3
//
//  Created by Brandon Mackey on 7/24/13.
//  Copyright (c) 2013 Brandon Mackey. All rights reserved.
//

#import "ViewController.h"
#import "eventViewController.h"
#import "Singleton.h"


@interface ViewController ()

@end

@implementation ViewController



- (void)viewDidLoad
{
    //    MAIN BACKGROUND COLOR  //////////////////////////////////////////////////////////////
    self.view.backgroundColor = [UIColor lightGrayColor];
    
    defaults = [NSUserDefaults standardUserDefaults];
    
    if ([defaults objectForKey:@"eventText"] !=nil)
    {
        eventSaved.text = [defaults objectForKey:@"eventText"];
    }
    else
    {
        eventSaved.text =@"";
    }

     
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

-(void)viewWillAppear:(BOOL)animated
{
    eventSaved.text = [Singleton GetInstance].eventStr;
    
    rightSwipe = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(onSwipeRight:)];
    rightSwipe.direction =UISwipeGestureRecognizerDirectionRight;
    [swipeLabel addGestureRecognizer:rightSwipe];
    
    
}

// SWIPE RIGHT FUNCTION TO TAKE LOAD EVENT PAGE 

-(void)onSwipeRight:(UISwipeGestureRecognizer*)recognizer
{
    eventViewController *eventView = [[eventViewController alloc]initWithNibName:@"eventView" bundle:nil];
    if (eventView)
    {
        [self presentViewController: eventView animated:TRUE completion:nil];
        NSLog(@"ENTER Add Event Page!");
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)onSave:(id)sender
{
    if (saveAndClose) {
        if (saveAndClose.tag == 0) {
            defaults = [NSUserDefaults standardUserDefaults];
            if (defaults)
            {
                [defaults setObject:eventSaved forKey:@"eventText"];
                [defaults synchronize];
            
                alert = [[UIAlertView alloc] initWithTitle:@"Event Saved" message:@"Your event has been saved" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil];
                if (alert !=nil)
                {
                    [alert show];
                }
            }
        }
    }
}

@end
