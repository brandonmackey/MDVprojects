//
//  ViewController.m
//  AOC2-Wk1
//
//  Created by Brandon Mackey on 6/26/13.
//  Copyright (c) 2013 Brandon Mackey. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    
//    MAIN BACKGROUND COLOR //////////////////////////////////////////////////////////////
    self.view.backgroundColor = [UIColor lightGrayColor];
    
    
//    RUN FITNESS OBJECT //////////////////////////////////////////////////////////////
    
    runFitness *longDistanceRun = (runFitness*)[myFitness createNewFitnessPlan:RUN];
    if (longDistanceRun !=nil) {
        [longDistanceRun setMiles:5];
        [longDistanceRun setTimeLimit:25];
        [longDistanceRun setWeather:@[@"sunny"]];
    }
    

    run = [[UILabel alloc]initWithFrame:CGRectMake(0.0, 0.0, 320.0, 40.0)];
    if (run && longDistanceRun){
         run.backgroundColor = [UIColor whiteColor];
         run.text = [NSString stringWithFormat:@"You ran %i miles in %i minutes on a %@ day.",[longDistanceRun miles], [longDistanceRun timeLimit], [longDistanceRun.weather componentsJoinedByString:@""]];
         run.numberOfLines = 2;
         run.textAlignment = NSTextAlignmentCenter;
    
         [self.view addSubview:run];
    }
    
    
    
    run2 = [[UILabel alloc]initWithFrame:CGRectMake(0.0, 45.0, 320.0, 30.0)];
    if (run2 && longDistanceRun) {
        run2.backgroundColor = [UIColor whiteColor];
        run2.text = [longDistanceRun calculateTimeLimit];
        run2.textAlignment = NSTextAlignmentCenter;
    
        [self.view addSubview:run2];
    
     }
    
//    PUSHUP FITNESS OBJECT //////////////////////////////////////////////////////////////
    
    pushupFitness *pushupKing = (pushupFitness*)[myFitness createNewFitnessPlan:PUSHUP];
    if (pushupKing !=nil) {
        [pushupKing setSets:5];
        [pushupKing setReps:21];
    }
    
    
    push = [[UILabel alloc]initWithFrame:CGRectMake(0.0, 80.0, 320.0, 40.0)];
    if (push && pushupKing){
        push.backgroundColor = [UIColor redColor];
        push.text = [NSString stringWithFormat:@"I did %i sets and %i reps in this workout",[pushupKing sets], [pushupKing reps]];
        push.numberOfLines = 2;
        push.textAlignment = NSTextAlignmentCenter;
        
        [self.view addSubview:push];
    }
    
    
    
    push2 = [[UILabel alloc]initWithFrame:CGRectMake(0.0, 125.0, 320.0, 30.0)];
    if (push2 && pushupKing) {
        push2.backgroundColor = [UIColor redColor];
        push2.text = [pushupKing calculateTimeLimit];
        push2.textAlignment = NSTextAlignmentCenter;
        
        [self.view addSubview:push2];
        
    }
    
//    SITUP FITNESS OBJECT //////////////////////////////////////////////////////////////
    
    situpFitness *situpChamp = (situpFitness*)[myFitness createNewFitnessPlan:SITUP];
    if (situpChamp !=nil) {
        [situpChamp setCrunch:50];
        [situpChamp setWithTwist:25];
    }
    
    
    sit = [[UILabel alloc]initWithFrame:CGRectMake(0.0, 160.0, 320.0, 40.0)];
    if (sit && situpChamp){
        sit.backgroundColor = [UIColor orangeColor];
        sit.text = [NSString stringWithFormat:@"I did %i sets and %i reps in this workout",[situpChamp crunch], [situpChamp withTwist]];
        sit.numberOfLines = 2;
        sit.textAlignment = NSTextAlignmentCenter;
        
        [self.view addSubview:sit];
    }
    
    
    
    sit2 = [[UILabel alloc]initWithFrame:CGRectMake(0.0, 205.0, 320.0, 30.0)];
    if (sit2 && situpChamp) {
        sit2.backgroundColor = [UIColor orangeColor];
        sit2.text = [situpChamp calculateTimeLimit];
        sit2.textAlignment = NSTextAlignmentCenter;
        
        [self.view addSubview:sit2];
        
    }
    
    
    
    
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
