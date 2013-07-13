//
//  baseFitness.m
//  AOC2-Wk1
//
//  Created by Brandon Mackey on 6/27/13.
//  Copyright (c) 2013 Brandon Mackey. All rights reserved.
//

#import "baseFitness.h"

@implementation baseFitness

// Getter and setter methods
@synthesize timeLimit, numberOfReps, dayOfTheWeek, weather;

-(id)init;
{
    self =[super init];
    if (self !=nil)
    {
        [self setTimeLimit:0];
        [self setNumberOfReps:0];
        [self setDayOfTheWeek:nil];
    }
    return self;
}


-(NSString *)calculateTimeLimit
{
    NSString *timeOfWorkout = [[NSString alloc] initWithFormat:@"You will workout for %i minutes", timeLimit];
    
    return timeOfWorkout;
    
}










@end
