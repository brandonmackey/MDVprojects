//
//  AppDelegate.m
//  AOC1
//
//  Created by Brandon Mackey on 5/8/13.
//  Copyright (c) 2013 Brandon Mackey. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

- (void)dealloc
{
    [_window release];
    [super dealloc];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    
    NSLog(@"Hello my name is Brandon Mackey");
    
    float age = 30.9f;
    
    BOOL travel = YES;
    
    NSLog(@"age=%.0f", age);
    
    NSLog(@"I am in the Mobile Dev Program at Full Sail");
   
    int aocGrade = 70;
    
    // if & else if & else function
    
    if (aocGrade > 69)
    {
        NSLog(@"You are passing the class!");
    }
    else if (aocGrade < 70)
    {
        NSLog(@"You are going to fail and retake the class.");
    }
    else
    {
        NSLog(@"What class is this???");
    }
    
    // nested loop
    
    int avf = 3;
    int avfRetake = 4;
    for (int avfA = 0;  avfA<= 3; avfA++) {
        NSLog(@"I went through week %d in AVF then Withdraw Pass", avf);
        avf++;
        for (int avfRetakeB = 0; avfRetakeB <= 4; avfRetakeB++) {
            NSLog(@"I went through all %d weeks of AVF and passed with a B+", avfRetake);
            avfRetake++;
        }
        break;
    }
    
    
    // for loop with Concatenating strings. End first string with %@ 
    for (int x=18; x > 0; x--)
    {
        NSLog(@"I graduate school in %d %@", x , @"months!");
    }
    
    
    // while loop
    
    int weeksLeft = 4;
    while (weeksLeft > 0) {
        NSLog(@"I have %d weeks left", weeksLeft);
        weeksLeft--;
    }
    
    
    
    
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
