//
//  myFitness.m
//  AOC2-Wk1
//
//  Created by Brandon Mackey on 6/27/13.
//  Copyright (c) 2013 Brandon Mackey. All rights reserved.
//

#import "myFitness.h"

@implementation myFitness

+(baseFitness *)createNewFitnessPlan: (int)fitnessType;
{
    if (fitnessType == RUN) {
        return [[runFitness alloc]init];
    }else if (fitnessType == PUSHUP){
        return [[pushupFitness alloc]init];
    }else if (fitnessType == SITUP){
        return [[situpFitness alloc]init];
    }else {
        return nil;
    }
    
}

@end
