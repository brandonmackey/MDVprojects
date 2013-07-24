//
//  pushupFitness.m
//  AOC2-Wk1
//
//  Created by Brandon Mackey on 6/27/13.
//  Copyright (c) 2013 Brandon Mackey. All rights reserved.
//

#import "pushupFitness.h"

@implementation pushupFitness

@synthesize sets, reps;

-(id)init
{
    self = [super init];
    if (self !=nil)
    {
        [self setSets:4];
        [self setReps:25];
    }
    return self;
}


-(NSString*)calculateTimeLimit
{
    [self setSets: (self.sets * self.reps)];
    
    NSString *timeOfWorkOut = [[NSString alloc]initWithFormat:@"I did %i pushups in this workout", self.sets];
    
    return timeOfWorkOut;

}

@end
