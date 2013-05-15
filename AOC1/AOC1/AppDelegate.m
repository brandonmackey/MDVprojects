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
    
    
    NSLog(@"My name is Brandon Mackey and I'm Mexico bound!");
    
    float daysTill = 50.2f;
    
    NSLog(@"I have %.0f days till I leave.", daysTill);
    
    // while loop
    
    int weeks = 7;
    while (weeks > 0) {
        NSLog(@"I have %d weeks left till we go south of the border", weeks);
        weeks--;
    }
    
    NSLog(@"July 1 is the day!");
    
    // if & else if & else function
    
    int travelMiles = 2700;
    
    if (travelMiles > 2699)
    {
        NSLog(@"Thats way to many miles to drive, lets fly!");
    }
    else if (travelMiles < 2700)
    {
        NSLog(@"I might want to drive and see the scenery.");
    }
    else
    {
        NSLog(@"Forget this lets go to Florida.");
    }
    
    // for loop. 
    
    for (int x=47; x > 0; x--)
    {
        NSLog(@"%d day until we leave", x);
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
