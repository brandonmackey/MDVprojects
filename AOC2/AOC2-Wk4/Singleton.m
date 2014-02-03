//
//  Singleton.m
//  AOC2-Wk3
//
//  Created by Brandon Mackey on 8/1/13.
//  Copyright (c) 2013 Brandon Mackey. All rights reserved.
//

#import "Singleton.h"

@implementation Singleton

@synthesize eventStr;

static Singleton *_instance = nil;

+(Singleton*)GetInstance
{
    if (_instance == nil)
    {
        [[self alloc] init];
    }
    return _instance;
}

+(id)alloc
{
    _instance = [super alloc];
    
    return _instance;
}

-(id)init
{
    if (self = [super init])
    {
        defaults = [NSUserDefaults standardUserDefaults];
        if ([defaults objectForKey:@"eventText"] !=nil)
        {
            self.eventStr = [defaults objectForKey:@"eventText"];
        }
        else
        {
            self.eventStr = @"";
        }
    }
    
    return self;
}

// ## METHOD OF SAVING AND APPENDING TO THE MAIN VIEW ## //
-(void)pageSavedStr:(NSString*)savedEvent date:(NSString*)date
{
    
    saveStr = self.eventStr;
    if ([saveStr isEqual:@""]) {
        enterStr = [saveStr stringByAppendingFormat:@"%@\n%@", savedEvent, date];
        self.eventStr = enterStr;
        
    }else{
        enterStr = [saveStr stringByAppendingFormat:@"\n\n%@\n%@", savedEvent, date];
        self.eventStr = enterStr;
    }
    NSLog(@"%@", self.eventStr);
}


@end
