//
//  secondViewController.m
//  AOC2-Wk1
//
//  Created by Brandon Mackey on 7/16/13.
//  Copyright (c) 2013 Brandon Mackey. All rights reserved.
//

#import "secondViewController.h"

@interface secondViewController ()

@end

@implementation secondViewController

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
    self.view.backgroundColor = [UIColor lightGrayColor];
    
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(IBAction)onExit:(id)sender
{
    [self dismissViewControllerAnimated:TRUE completion:nil];
}

-(IBAction)onChange:(id)sender
{
    UISegmentedControl *segmentControl = (UISegmentedControl*)sender;
    if (segmentControl != nil)
    {        
        if (segmentControl.selectedSegmentIndex == 0){
            self.view.backgroundColor = [UIColor grayColor];
            
        }else if (segmentControl.selectedSegmentIndex == 1){
            self.view.backgroundColor = [UIColor orangeColor];
            
        }else if (segmentControl.selectedSegmentIndex == 2){
            self.view.backgroundColor = [UIColor blueColor];
            
        }else if (segmentControl.selectedSegmentIndex == 3){
            self.view.backgroundColor = [UIColor redColor];
        }
    }
    
}

@end
