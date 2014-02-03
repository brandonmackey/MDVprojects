//
//  SecondNavController.m
//  MDF1-Wk2-2
//
//  Created by Brandon Mackey on 8/16/13.
//  Copyright (c) 2013 Brandon Mackey. All rights reserved.
//

#import "SecondNavController.h"
#import "ThirdNavController.h"

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
    
    self.title = @"Second View";
    
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"sb@2x.png"]];

    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

-(IBAction)onClick:(id)sender
{
    ThirdNavController *thirdView = [[ThirdNavController alloc]initWithNibName:@"ThirdNavController" bundle:nil];
    
    [self.navigationController pushViewController:thirdView animated:true];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
