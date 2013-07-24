//
//  runFitness.m
//  AOC2-Wk1
//
//  Created by Brandon Mackey on 6/27/13.
//  Copyright (c) 2013 Brandon Mackey. All rights reserved.
//
#import "runFitness.h"

@implementation runFitness

@synthesize miles, timeLimit;

-(id)init
{
    self = [super init];
    if (self !=nil)
    {
        [self setMiles:2.0];
        [self setTimeLimit:15];
        [self setWeather:nil];
    }
    return self;
}

-(NSString*)calculateTimeLimit
{
    [self setMiles:((miles * 2) * (self.timeLimit * 10))];
    
    NSString*timeOfWorkout = [[NSString alloc]initWithFormat:@"You ran for %i mintues", self.miles];
    
    return timeOfWorkout;
    
    
    
}


@end
