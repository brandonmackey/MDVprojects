//
//  ViewController.m
//  AOC2-Wk3
//
//  Created by Brandon Mackey on 7/24/13.
//  Copyright (c) 2013 Brandon Mackey. All rights reserved.
//

#import "ViewController.h"
#import "eventViewController.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    //    MAIN BACKGROUND COLOR  //////////////////////////////////////////////////////////////
    self.view.backgroundColor = [UIColor lightGrayColor];
    
    
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}




- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)onClick:(id)sender
{
    eventViewController *viewController = [[eventViewController alloc]initWithNibName:@"eventView" bundle:nil];
    
    UIButton *button = (UIButton*)sender;
    if (viewController !=nil)
    {
        if (button.tag == 0)
        {
            [self presentViewController: viewController animated:TRUE completion:nil];
        }
    }
}

@end
