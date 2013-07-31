//
//  ViewController.m
//  AOC2-Wk3
//
//  Created by Brandon Mackey on 7/24/13.
//  Copyright (c) 2013 Brandon Mackey. All rights reserved.
//

#import "ViewController.h"
#import "eventViewController.h"


@interface ViewController ()

@end

@implementation ViewController
@synthesize delegate;


- (void)viewDidLoad
{
    //    MAIN BACKGROUND COLOR  //////////////////////////////////////////////////////////////
    self.view.backgroundColor = [UIColor lightGrayColor];
    

    
    
    
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)pageSaved:(NSString*)savedEvent date:(NSString*)date
{
    
    saveStr = eventSaved.text;
    if ([saveStr isEqual:@""]) {
        enterStr = [saveStr stringByAppendingFormat:@"%@\n%@", savedEvent, date];
        eventSaved.text = enterStr;
        
    }else{
        enterStr = [saveStr stringByAppendingFormat:@"\n\n%@\n%@", savedEvent, date];
        eventSaved.text = enterStr;
    }
}

-(IBAction)onClick:(id)sender
{
    UIButton *button = (UIButton*)sender;
    if (button !=nil)
    {
        if (button.tag == 0)
        {
            eventViewController *viewController = [[eventViewController alloc]initWithNibName:@"eventView" bundle:nil];
            if (viewController)
            {
                viewController.delegate = (id)self;
                [self presentViewController: viewController animated:TRUE completion:nil];
                NSLog(@"ENTER Add Event Page!");
            }
            
        }
    }
}

@end
