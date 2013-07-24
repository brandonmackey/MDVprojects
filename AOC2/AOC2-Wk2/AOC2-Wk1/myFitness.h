//
//  myFitness.h
//  AOC2-Wk1
//
//  Created by Brandon Mackey on 6/27/13.
//  Copyright (c) 2013 Brandon Mackey. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "baseFitness.h"
#import "runFitness.h"
#import "pushupFitness.h"
#import "situpFitness.h"

@interface myFitness : NSObject

+(baseFitness *)createNewFitnessPlan: (int)fitnessType;

@end
