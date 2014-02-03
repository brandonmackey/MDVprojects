//
//  Singleton.m
//  MDF-Wk3
//
//  Created by Brandon Mackey on 8/22/13.
//  Copyright (c) 2013 Brandon Mackey. All rights reserved.
//

#import "Singleton.h"
#import "MyMapAnnotation.h"
#import "SecondViewController.h"

@implementation Singleton

static Singleton *_instance = nil;

+(Singleton*)GetInstance
{
    if (_instance == nil)
    {
        [[self alloc]init];
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
       self.stringArray = [[NSMutableArray alloc]initWithObjects:
                           @{@"Taco Bell":@"Westfield", @"Location":@[@40.04,@-86.13]},
                           @{@"Taco Bell":@"Carmel", @"Location":@[@39.96,@-86.11]},
                           @{@"Taco Bell":@"Noblesville, Westfield Rd", @"Location":@[@40.04,@-86.13]},
                           @{@"Taco Bell":@"Noblesville, Clover Rd", @"Location":@[@40.03,@-85.99]},
                           @{@"Taco Bell":@"Fishers", @"Location":@[@39.98,@-85.92]},
                           @{@"McDonalds":@"Noblesville, Conner St", @"Location":@[@40.04,@-86.00]},
                           @{@"McDonalds":@"Noblesville, Village Center Dr", @"Location":@[@40.04,@-86.07]},
                           @{@"McDonalds":@"Noblesville, Hazel Dell Crossing", @"Location":@[@40.00,@-86.06]},
                           @{@"McDonalds":@"Fishers", @"Location":@[@39.97,@-86.00]},
                           @{@"McDonalds":@"Cicero", @"Location":@[@40.12,@-86.01]},
                           nil];

    }
    return self;
}

@end
