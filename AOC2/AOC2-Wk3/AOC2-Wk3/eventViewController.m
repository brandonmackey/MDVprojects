//
//  eventViewController.m
//  AOC2-Wk3
//
//  Created by Brandon Mackey on 7/24/13.
//  Copyright (c) 2013 Brandon Mackey. All rights reserved.
//

#import "eventViewController.h"


@interface eventViewController ()

@end

@implementation eventViewController

@synthesize delegate;

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
    
    
    //    SHOW AND HIDE KEYBOARD //////////////////////////////////////////////////////////////
    
//    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
//    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
    
    
    
    
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

-(void)keyboradWillShow:(NSNotification *)notifcation
{
    
}

-(void)keyboradWillHide:(NSNotification *)notifcation
{
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//-(IBAction)onExit:(id)sender
//{
//    [self dismissViewControllerAnimated:TRUE completion:nil];
//}


-(IBAction)onClick2:(id)sender
{
    UIButton *button = (UIButton*)sender;
    if (button != nil)
    {
        if (button.tag== 0)
        {
            if (delegate) {
                if ([enterEvent.text isEqual: @""])
                {
                    alertView = [[UIAlertView alloc] initWithTitle:@"ERROR" message:@"Please Enter Event!" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil];
                    if (alertView) {
                        [alertView show];
                    }
                    
                }else if ([datePick.date timeIntervalSinceNow] < 0)
                {
                    alertView = [[UIAlertView alloc] initWithTitle:@"ERROR" message:@"Can't Select Dates from the Past!" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil];
                    if (alertView) {
                        [alertView show];
                    }
                
                
            
                }
                
            }
            
        
        }
        [self dismissViewControllerAnimated:TRUE completion:nil];
    }           
}

-(IBAction)changeDate:(id)sender
{
        dateFormat = [[NSDateFormatter alloc] init];
        [dateFormat setDateFormat:@"MM/d/yyyy  HH:mm a zz"];
        strDate = [[NSString alloc] initWithString:[dateFormat stringFromDate:datePick.date]];
        [delegate pageSaved:enterEvent.text date:strDate];
        NSLog(@"Set Date");
}

-(IBAction)onClose:(id)sender
{
    UIButton *button = (UIButton*)sender;
    if (button.tag == 0){
        
        [enterEvent resignFirstResponder];
        NSLog(@"keyborad closed!");
    }
}


@end
