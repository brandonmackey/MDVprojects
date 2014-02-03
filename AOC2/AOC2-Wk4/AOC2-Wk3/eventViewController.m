//
//  eventViewController.m
//  AOC2-Wk3
//
//  Created by Brandon Mackey on 7/24/13.
//  Copyright (c) 2013 Brandon Mackey. All rights reserved.
//

#import "eventViewController.h"
#import "Singleton.h"


@interface eventViewController ()

@end

@implementation eventViewController



- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    
    //    MAIN BACKGROUND COLOR  //////////////////////////////////////////////////////////////
    self.view.backgroundColor = [UIColor lightGrayColor];
    

    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

-(void)onSwipeLeft:(UISwipeGestureRecognizer*)recognizer
{
    // ## CHECKS FOR LEFT SWIPE ## //
    if (recognizer.direction == UISwipeGestureRecognizerDirectionLeft) {
        
    }
    // ## LOOKS FOR ENTERED TEXT ## // 
    if ([enterEvent.text isEqual: @""])
    {
        alertView = [[UIAlertView alloc] initWithTitle:@"ERROR" message:@"Please Enter Event!" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil];
        if (alertView)
        {
            [alertView show];
        }
        
    }else if ([datePick.date timeIntervalSinceNow] < 0)
    {
        alertView = [[UIAlertView alloc] initWithTitle:@"ERROR" message:@"Can't Select Dates from the Past!" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil];
        if (alertView)
        {
            [alertView show];
        }
    }else{
        dateFormat = [[NSDateFormatter alloc] init];
        [dateFormat setDateFormat:@"MM/d/yyyy  HH:mm a zz"];
        strDate = [[NSString alloc] initWithString:[dateFormat stringFromDate:datePick.date]];
        
        [[Singleton GetInstance] pageSavedStr:enterEvent.text date:strDate];
        
        [self dismissViewControllerAnimated:TRUE completion:nil];
    }
    
}

-(void)viewWillAppear:(BOOL)animated
{
    leftSwipe = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(onSwipeLeft:)];
    leftSwipe.direction =UISwipeGestureRecognizerDirectionLeft;
    [swipeLabelLeft addGestureRecognizer:leftSwipe];
    
    NSDate *noBackDate = [NSDate date];
    [datePick setMinimumDate:noBackDate];
    
    NSLog(@"Set Date");
    
}


//-(void)keyboradWillShow:(NSNotification *)notifcation
//{
//    
//}
//
//-(void)keyboradWillHide:(NSNotification *)notifcation
//{
//    
//}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(IBAction)changeDate:(id)sender
{

}

// ## CLOSE KEYBOARD FUNCTION ## //
-(IBAction)onClose:(id)sender
{
    UIButton *button = (UIButton*)sender;
    if (button.tag == 0){
        
        [enterEvent resignFirstResponder];
        NSLog(@"keyborad closed!");
    }
}


@end
