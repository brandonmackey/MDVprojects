//
//  FirstViewController.m
//  MDF1-Wk2-2
//
//  Created by Brandon Mackey on 8/14/13.
//  Copyright (c) 2013 Brandon Mackey. All rights reserved.
//

#import "FirstViewController.h"
#import "SecondNavController.h"


@interface FirstViewController ()

@end

@implementation FirstViewController


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"First", @"First");
        self.tabBarItem.image = [UIImage imageNamed:@"first"];
    }
    return self;
}
							
- (void)viewDidLoad
{
    
    self.title = @"First View";
    
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"snowboardingBackground.png"]];
    
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

-(IBAction)onClick:(id)sender
{
    SecondNavController *secondView = [[SecondNavController alloc]initWithNibName:@"SecondNavController" bundle:nil];
    if (secondView !=nil)
    {
        [self.navigationController pushViewController:secondView animated:true];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}






@end
