//
//  baseFitness.h
//  AOC2-Wk1
//
//  Created by Brandon Mackey on 6/27/13.
//  Copyright (c) 2013 Brandon Mackey. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface baseFitness : NSObject

{
    int fitnessEnum;
}

typedef enum{
    
    RUN = 0,
    PUSHUP,
    SITUP,
}fitnessEnum;


@property int timeLimit;
@property int numberOfReps;
@property NSString *dayOfTheWeek;
@property NSArray *weather;


-(id)init;

-(NSString*)calculateTimeLimit;
    


@end
