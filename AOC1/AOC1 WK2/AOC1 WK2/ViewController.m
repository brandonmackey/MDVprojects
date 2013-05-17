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
    
    
    // AUTHOR NAME
    
    authorName = [[UILabel alloc] initWithFrame:(CGRectMake(170.0f, 35.0f, 280.0f, 30.0f))];
    
    if (authorName != nil){
        authorName.backgroundColor = [UIColor yellowColor];
        authorName.text =@"John Steinbeck";
        authorName.textAlignment = NSTextAlignmentLeft;
        authorName.textColor = [UIColor darkGrayColor];
    }
    
    [self.view addSubview:authorName];
    
    
    // PUBLISHED
    
    publish = [[UILabel alloc] initWithFrame:(CGRectMake(0.0f, 70.0f, 170.0f, 30.0f))];
    
    if (publish != nil){
        publish.backgroundColor = [UIColor greenColor];
        publish.text =@"Published:";
        publish.textAlignment = NSTextAlignmentRight;
        publish.textColor = [UIColor brownColor];
    }
    
    [self.view addSubview:publish];
    
    
    // PUBLISHED DATE
    
    publishDate = [[UILabel alloc] initWithFrame:(CGRectMake(170.0f, 70.0f, 280.0f, 30.0f))];
    
    if (publishDate != nil){
        publishDate.backgroundColor = [UIColor blueColor];
        publishDate.text =@"1937";
        publishDate.textAlignment = NSTextAlignmentLeft;
        publishDate.textColor = [UIColor magentaColor];
    }
    
    [self.view addSubview:publishDate];
    
    
    // SUMMARY
    
    summary = [[UILabel alloc] initWithFrame:(CGRectMake(0.0f, 105.0f, 170.0f, 30.0f))];
    
    if (summary != nil){
        summary.backgroundColor = [UIColor cyanColor];
        summary.text =@"Summary:";
        summary.textAlignment = NSTextAlignmentLeft;
        summary.textColor = [UIColor purpleColor];
    }
    
    [self.view addSubview:summary];
    
    
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
