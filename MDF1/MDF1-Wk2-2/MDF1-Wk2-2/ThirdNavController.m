//
//  ThirdNavController.m
//  MDF1-Wk2-2
//
//  Created by Brandon Mackey on 8/16/13.
//  Copyright (c) 2013 Brandon Mackey. All rights reserved.
//

#import "ThirdNavController.h"

@interface ThirdNavController ()

@end

@implementation ThirdNavController

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
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"rail@2x.png"]];
    
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

-(IBAction)onClick:(id)sender
{
    [self.navigationController popViewControllerAnimated:true];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
