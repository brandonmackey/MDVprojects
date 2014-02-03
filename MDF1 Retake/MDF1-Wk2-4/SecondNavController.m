//
//  SecondNavController.m
//  MDF1-Wk2-4
//
//  Created by Brandon Mackey on 9/10/13.
//  Copyright (c) 2013 Brandon Mackey. All rights reserved.
//

#import "SecondNavController.h"

@interface SecondNavController ()

@end

@implementation SecondNavController

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
    
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"sb@2x.png"]];
    
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
