//
//  situpFitness.m
//  AOC2-Wk1
//
//  Created by Brandon Mackey on 6/27/13.
//  Copyright (c) 2013 Brandon Mackey. All rights reserved.
//

#import "situpFitness.h"

@implementation situpFitness

@synthesize crunch, withTwist;

-(id)init
{
    self = [super init];
    if (self !=nil)
    {
        [self setCrunch:100];
        [self setWithTwist:50];
    }
    return self;
}


-(NSString*)calculateTimeLimit
{
    [self setCrunch:(crunch * withTwist)];
   
    
    NSString *timeOfWorkout = [[NSString alloc]initWithFormat:@"You did %i cruches in %d mintues", crunch, self.withTwist];
    
    return timeOfWorkout;
    
}


@end
