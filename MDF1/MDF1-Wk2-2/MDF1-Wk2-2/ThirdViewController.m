//
//  ThirdViewController.m
//  MDF1-Wk2-2
//
//  Created by Brandon Mackey on 8/14/13.
//  Copyright (c) 2013 Brandon Mackey. All rights reserved.
//

#import "ThirdViewController.h"

@interface ThirdViewController ()


@end

@implementation ThirdViewController


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"Third", @"Third");
        self.tabBarItem.image = [UIImage imageNamed:@"first"];
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    
    //FS_MD_Logo_640-1136.png
    
    self.view.backgroundColor = [UIColor colorWithPatternImage: [UIImage imageNamed: @"SnowboardingWallpaper.png"]];
    
    name.text = [name.text stringByAppendingString:@"Brandon Mackey"];
    className.text = [className.text stringByAppendingString:@"MDF1"];
    project.text = [project.text stringByAppendingString:@"Week 2"];
    term.text = [term.text stringByAppendingString:@"Term: 1309"];
    
//    self.view.backgroundColor = [UIColor colorWithPatternImage:image];
    
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
