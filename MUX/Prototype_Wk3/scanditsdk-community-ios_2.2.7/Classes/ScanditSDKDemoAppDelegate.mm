//
//  Copyright 2010 Mirasense AG
//
//  Licensed under the Apache License, Version 2.0 (the "License");
//  you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at
//
//  http://www.apache.org/licenses/LICENSE-2.0
//
//  Unless required by applicable law or agreed to in writing, software
//  distributed under the License is distributed on an "AS IS" BASIS,
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  See the License for the specific language governing permissions and
//  limitations under the License.
//


#import "ScanditSDKDemoAppDelegate.h"
#import "DemoViewController.h"
#import "Reachability.h"
#import "AutoRotatingViewController.h"

@implementation ScanditSDKDemoAppDelegate

@synthesize window;
@synthesize viewController;


- (void)applicationDidFinishLaunching:(UIApplication *)application {    
    // Setting up the tab and navigation controller.
    tabController = [[UITabBarController alloc] init];
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
        viewController = [[DemoViewController alloc] initWithNibName:@"DemoViewController_iPad" bundle:nil];
    } else {
        viewController = [[DemoViewController alloc] initWithNibName:@"DemoViewController" bundle:nil];
    }

    navController = [[UINavigationController alloc] initWithRootViewController:viewController];
    [[navController navigationBar] setBarStyle:UIBarStyleBlack];
    
    UITabBarItem *tabItem = [[UITabBarItem alloc] initWithTitle:@"Main" 
                                                          image:[UIImage imageNamed:@"icon_lists.png"]
                                                            tag:0];
    navController.tabBarItem = tabItem;
    [tabItem release];
    
    UIViewController *placeholder1 = [[AutoRotatingViewController alloc] init];
    UITabBarItem *tabItem1 = [[UITabBarItem alloc] initWithTitle:@"Dummy Tab" 
                                                          image:[UIImage imageNamed:@"icon_history.png"]
                                                            tag:1];
    placeholder1.tabBarItem = tabItem1;
    [tabItem1 release];
    
    UIViewController *placeholder2 = [[AutoRotatingViewController alloc] init];
    UITabBarItem *tabItem2 = [[UITabBarItem alloc] initWithTitle:@"Dummy Tab" 
                                                           image:[UIImage imageNamed:@"icon_history.png"]
                                                             tag:2];
    placeholder2.tabBarItem = tabItem2;
    [tabItem2 release];
    
    NSMutableArray *tabControllers = [[NSMutableArray alloc] init];
    [tabControllers addObject:navController];
    [tabControllers addObject:placeholder1];
    [tabControllers addObject:placeholder2];
    [tabController setViewControllers:tabControllers];
    tabController.delegate = viewController;
    [window setRootViewController:tabController];
    [window makeKeyAndVisible];
}


- (void)dealloc {
    [viewController release];
    [tabController release];
    [navController release];
    [window release];
    
    [super dealloc];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation {
    return YES;
}
#pragma mark -
#pragma mark Network Check

- (BOOL)isNetworkAvailable {	
	Reachability * reachability = [Reachability reachabilityForInternetConnection];
	if ([reachability currentReachabilityStatus] == NotReachable) {
		UIAlertView* alertView = [[UIAlertView alloc] initWithTitle:@"No Network" 
															message:@"The development version of Scandit requires network access. Connect and try again." 
														   delegate:nil 
												  cancelButtonTitle:@"OK" 
												  otherButtonTitles:nil];
		[alertView show];
		[alertView release];
		return NO;
	}
	return YES;
}

@end
