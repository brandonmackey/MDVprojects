//
//  ViewController.m
//  AOC1 WK2
//
//  Created by Brandon Mackey on 5/16/13.
//  Copyright (c) 2013 Brandon Mackey. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    // TITLE OF BOOK 
    
    title = [[UILabel alloc] initWithFrame:(CGRectMake(0.0f, 0.0f, 450.0f, 30.0f))];
    
    if (title != nil){
        title.backgroundColor = [UIColor grayColor];
        title.text =@"Of Mice and Men";
        title.textAlignment = NSTextAlignmentCenter;
        title.textColor = [UIColor whiteColor];
    }
    
    [self.view addSubview:title];
    
    
    // THE AUTHOR
    
    aurthorLabel = [[UILabel alloc] initWithFrame:(CGRectMake(0.0f, 35.0f, 170.0f, 30.0f))];
    
    if (aurthorLabel != nil){
        aurthorLabel.backgroundColor = [UIColor redColor];
        aurthorLabel.text =@"Author:";
        aurthorLabel.textAlignment = NSTextAlignmentRight;
        aurthorLabel.textColor = [UIColor blackColor];
    }
    
    [self.view addSubview:aurthorLabel];
    
    
    
    
    //authorName = [[UILabel alloc] initWithFrame:(CGRectMake(<#CGFloat x#>, <#CGFloat y#>, <#CGFloat width#>, <#CGFloat height#>))];
    
    
    
    
    //publish = [[UILabel alloc] initWithFrame:(CGRectMake(<#CGFloat x#>, <#CGFloat y#>, <#CGFloat width#>, <#CGFloat height#>))];
    
    
    //publishDate = [[UILabel alloc] initWithFrame:(CGRectMake(<#CGFloat x#>, <#CGFloat y#>, <#CGFloat width#>, <#CGFloat height#>))];
    
    
    //summary = [[UILabel alloc] initWithFrame:(CGRectMake(<#CGFloat x#>, <#CGFloat y#>, <#CGFloat width#>, <#CGFloat height#>))];
    
    
    //sumText = [[UILabel alloc] initWithFrame:(CGRectMake(<#CGFloat x#>, <#CGFloat y#>, <#CGFloat width#>, <#CGFloat height#>))];
    
    //list = [[UILabel alloc] initWithFrame:(CGRectMake(<#CGFloat x#>, <#CGFloat y#>, <#CGFloat width#>, <#CGFloat height#>))];
    
    //listItems = [[UILabel alloc] initWithFrame:(CGRectMake(<#CGFloat x#>, <#CGFloat y#>, <#CGFloat width#>, <#CGFloat height#>))];
    
    
    
    
    
    
    
    
    
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
