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
    
    title = [[UILabel alloc] initWithFrame:(CGRectMake(0.0f, 0.0f, 320.0f, 30.0f))];
    
    if (title != nil){
        title.backgroundColor = [UIColor grayColor];
        title.text =@"Of Mice and Men";
        title.textAlignment = NSTextAlignmentCenter;
        title.textColor = [UIColor whiteColor];
    }
    
    [self.view addSubview:title];
    
    
    // THE AUTHOR
    
    aurthorLabel = [[UILabel alloc] initWithFrame:(CGRectMake(0.0f, 35.0f, 160.0f, 30.0f))];
    
    if (aurthorLabel != nil){
        aurthorLabel.backgroundColor = [UIColor redColor];
        aurthorLabel.text =@"Author:";
        aurthorLabel.textAlignment = NSTextAlignmentRight;
        aurthorLabel.textColor = [UIColor blackColor];
    }
    
    [self.view addSubview:aurthorLabel];
    
    
    // AUTHOR NAME
    
    authorName = [[UILabel alloc] initWithFrame:(CGRectMake(160.0f, 35.0f, 160.0f, 30.0f))];
    
    if (authorName != nil){
        authorName.backgroundColor = [UIColor yellowColor];
        authorName.text =@"John Steinbeck";
        authorName.textAlignment = NSTextAlignmentLeft;
        authorName.textColor = [UIColor darkGrayColor];
    }
    
    [self.view addSubview:authorName];
    
    
    // PUBLISHED
    
    publish = [[UILabel alloc] initWithFrame:(CGRectMake(0.0f, 70.0f, 160.0f, 30.0f))];
    
    if (publish != nil){
        publish.backgroundColor = [UIColor greenColor];
        publish.text =@"Published:";
        publish.textAlignment = NSTextAlignmentRight;
        publish.textColor = [UIColor brownColor];
    }
    
    [self.view addSubview:publish];
    
    
    // PUBLISHED DATE
    
    publishDate = [[UILabel alloc] initWithFrame:(CGRectMake(160.0f, 70.0f, 160.0f, 30.0f))];
    
    if (publishDate != nil){
        publishDate.backgroundColor = [UIColor blueColor];
        publishDate.text =@"1937";
        publishDate.textAlignment = NSTextAlignmentLeft;
        publishDate.textColor = [UIColor magentaColor];
    }
    
    [self.view addSubview:publishDate];
    
    
    // SUMMARY
    
    summary = [[UILabel alloc] initWithFrame:(CGRectMake(0.0f, 105.0f, 160.0f, 30.0f))];
    
    if (summary != nil){
        summary.backgroundColor = [UIColor cyanColor];
        summary.text =@"Summary:";
        summary.textAlignment = NSTextAlignmentLeft;
        summary.textColor = [UIColor purpleColor];
    }
    
    [self.view addSubview:summary];
    
    
    // SUMMARY TEXT
    
    sumText = [[UILabel alloc] initWithFrame:(CGRectMake(0.0f, 140.0f, 320.0f, 230.0f))];
    
    if (sumText != nil){
        sumText.backgroundColor = [UIColor lightGrayColor];
        sumText.text =@"They are an unlikely pair: George is 'small and quick and dark of face'; Lennie a man of tremendous size, has the mind of a young child. They have formed a 'family' clinging togeher in the face of loneliness and alienation. They hope to attain their dream of settling down on their own piece of land. It soon becomes clear that the two are close friends and George is Lennie's protector. The theme of friendship is constant throughout the story.";
        sumText.textAlignment = NSTextAlignmentCenter;
        sumText.textColor = [UIColor orangeColor];
        sumText.numberOfLines = 12;
    }
    
    [self.view addSubview:sumText];
    
    
    // LIST 
    
    list = [[UILabel alloc] initWithFrame:(CGRectMake(0.0f, 375.0f, 160.0f, 30.0f))];
    
    if (list != nil){
        list.backgroundColor = [UIColor colorWithRed:0.949 green:0.059 blue:0.416 alpha:1] /*#f20f6a*/ /*PINK*/;
        list.text =@"List of Items:";
        list.textAlignment = NSTextAlignmentLeft;
        list.textColor = [UIColor colorWithRed:0.439 green:0.812 blue:0.29 alpha:1] /*#70cf4a*/ /*LIME*/;
    }
    
    [self.view addSubview:list];
    
    
    // NSArray & MutableString for Items Array
    
    NSString *person1 = @"George",
             *person2 = @" Lennie",
             *person3 = @" SLim",
             *person4 = @" Crooks",
             *person5 = @" and Curley";
    
    NSArray *names = [[NSArray alloc] initWithObjects:person1, person2, person3, person4, person5, nil];
    
    NSMutableString *mutItems = [[NSMutableString alloc] initWithCapacity:0];
    
    for (int i=0; i < names.count; i++) {
        [mutItems appendString:[names objectAtIndex: i]];
        
        if ( i < names.count -1) {
        [mutItems appendString:@","];
        }
    }
    
    // LIST OF ITEMS ARRAY
    
    listItems = [[UILabel alloc] initWithFrame:(CGRectMake(0.0f, 410.0f, 320.0f, 50.0f))];
    
    if (listItems != nil){
        listItems.backgroundColor = [UIColor colorWithRed:0.390 green:0.588 blue:0.431 alpha:1] /*#96966e*/ /*GREENISH*/;
        listItems.text = mutItems;
        listItems.textAlignment = NSTextAlignmentCenter;
        listItems.textColor = [UIColor colorWithRed:0.23 green:0.804 blue:0.990 alpha:1] /*#9eb4f0*/ /*BABYBLUE*/;
        listItems.numberOfLines = 2;
    }
    
    [self.view addSubview:listItems];
    
    
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
