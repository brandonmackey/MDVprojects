//
//  DetailedViewController.m
//  MDF1-Wk2-2
//
//  Created by Brandon Mackey on 8/16/13.
//  Copyright (c) 2013 Brandon Mackey. All rights reserved.
//

#import "DetailedViewController.h"

@interface DetailedViewController ()

@end

@implementation DetailedViewController

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
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)onClose:(id)sender
{
    UIButton *button = (UIButton*)sender;
    if (button.tag == 0)
    {
        [self dismissViewControllerAnimated:true completion:nil];
    }
}
@end
