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
//
//  DemoViewController shows how to use the Mirasense Scandit SDK. 
//
//  Any view controller that triggers the ScanditSDK barcode scanning, needs to instantiate the
//  ScanditSDKBarcodePicker. The picker is a UIViewController and can therefor be used like any 
//  other view controller. It can be shown modally, directly as the starting view, in a tab bar
//  controller, pushed on a navigation controller etc. The class that wants to listen to the 
//  picker's events needs to implement the ScanditSDKOverlayControllerDelegate protocol. 
//  Examples for the most common usage scenarios are shown below.
//


#import "DemoViewController.h"
#import "ScanditSDKBarcodePicker.h"
#import "ScanditSDKDemoAppDelegate.h"
#import "ScanditSDKRotatingBarcodePicker.h"

// Enter your Scandit SDK App key here.
// Note: Your app key is available from your Scandit SDK web account.
#define kScanditSDKAppKey    @""


@implementation DemoViewController

- (void)viewDidLoad {
    
    releaseOnAppear = NO;
    scaledSubviewActive = NO;
}

- (void)viewWillAppear:(BOOL)animated {
	[[UIApplication sharedApplication] setStatusBarHidden:NO withAnimation:UIStatusBarAnimationNone];
    [self.navigationController setNavigationBarHidden:YES animated:NO];
    
    if (releaseOnAppear && scanditSDKBarcodePicker) {
        [scanditSDKBarcodePicker release];
        scanditSDKBarcodePicker = nil;
    }
    releaseOnAppear = NO;
    
    if (self.interfaceOrientation == UIInterfaceOrientationLandscapeLeft
        || self.interfaceOrientation == UIInterfaceOrientationLandscapeRight) {
        portraitButtons.hidden = YES;
        landscapeButtons.hidden = NO;
    } else {
        portraitButtons.hidden = NO;
        landscapeButtons.hidden = YES;
    }
	
    // location tracking
	// to demonstrate Scandit's Scanalytics feature (optional)
    locationManager = [[CLLocationManager alloc] init];
    locationManager.delegate = self;
    [locationManager startUpdatingLocation];
    
    [super viewWillAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated {
    [self.navigationController setNavigationBarHidden:NO animated:animated];
    [super viewWillDisappear:animated];
}

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
}

- (void)dealloc {
	
	if (scanditSDKBarcodePicker != nil) {
		[scanditSDKBarcodePicker release];
		scanditSDKBarcodePicker = nil;
	}
    [locationManager release];
    
	[super dealloc];
}


#pragma -
#pragma Methods for Auto Rotation
/**
 * The methods below are only needed to have the picker (when used as an overlay in a simple view)
 * rotate with the screen and change its dimensions accordingly. If the app
 * is solely used in portrait mode, these methods can be ignored.
 * If you use a tab layout, check out the 'tab' example. It shows how to make the ScanditSDKBarcodePicker
 * rotate itself.
 */

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation {
    // We allow rotation in any direction to be able to show how the overlayed picker acts.
    return YES;
}

- (void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation 
                                duration:(NSTimeInterval)duration {
    // Update the UI such that it fits the new dimension.
    [self adjustPickerToOrientation:toInterfaceOrientation];
}

/**
 * Makes different buttons visible for picker previews. Adjusts the overlaying picker's video 
 * preview orientation and changes its dimensions to fit the screen in it's current orientation.
 */
- (void)adjustPickerToOrientation:(UIInterfaceOrientation)orientation {
    // Different buttons are visible depending on the rotation (modal and navigation picker 
    // examples do not rotate, they can however be rotated by using the example class
    // ScanditSDKRotatingBarcodePicker from this project)
    if (orientation == UIInterfaceOrientationLandscapeLeft
        || orientation == UIInterfaceOrientationLandscapeRight) {
        portraitButtons.hidden = YES;
        landscapeButtons.hidden = NO;
    } else {
        portraitButtons.hidden = NO;
        landscapeButtons.hidden = YES;
    }
    
    if (pickerSubview != nil && pickerSubviewButton != nil && scanditSDKBarcodePicker != nil) {
        // Change the picker's preview orientation. If we're adding the picker as a subview itt is
        // necessary to call this whenever the picker is not in portrait mode.
        //scanditSDKBarcodePicker.cameraPreviewOrientation = orientation;
        [scanditSDKBarcodePicker willRotateToInterfaceOrientation:orientation duration:0];
        
        // Adjust the picker's frame, bounds and the offset of the info banner to fit the new dimensions. 
        CGRect screen = [[UIScreen mainScreen] bounds];
        CGRect subviewRect;
        if (orientation == UIInterfaceOrientationLandscapeLeft
            || orientation == UIInterfaceOrientationLandscapeRight) {
            if (scaledSubviewActive) {
                subviewRect = CGRectMake(0, 0, 2 * screen.size.height / 3, 2 * screen.size.width / 3);
                [scanditSDKBarcodePicker.overlayController setInfoBannerOffset:-3 * screen.size.width / 16];
                // Adjust the size to landscape mode.
                scanditSDKBarcodePicker.size = CGSizeMake(2 * screen.size.height / 3, 2 * screen.size.width / 3);
                
            } else {
                // Push the info banner up/down to make it visible.
                if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
                    [scanditSDKBarcodePicker.overlayController setInfoBannerOffset:screen.size.width / 8];
                } else {
                    [scanditSDKBarcodePicker.overlayController setInfoBannerOffset:0];
                }
                subviewRect = CGRectMake(40, screen.size.width / 12, screen.size.height - 80, 
                                         3 * screen.size.width / 4);
            }
            pickerSubviewButton.frame = CGRectMake(0, 0, screen.size.height, screen.size.width);
            
        } else {
            if (scaledSubviewActive) {
                subviewRect = CGRectMake(0, 0, 2 * screen.size.width / 3, 2 * screen.size.height / 3);
                [scanditSDKBarcodePicker.overlayController setInfoBannerOffset:-screen.size.height / 16];
                // Adjust the size to portrait mode.
                scanditSDKBarcodePicker.size = CGSizeMake(2 * screen.size.width / 3, 2 * screen.size.height / 3);
                
            } else {
                // Push the info banner up to make it visible.
                if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
                    [scanditSDKBarcodePicker.overlayController setInfoBannerOffset:screen.size.height / 8];
                } else {
                    [scanditSDKBarcodePicker.overlayController setInfoBannerOffset:screen.size.height / 16];
                }
                subviewRect = CGRectMake(0, screen.size.height / 6 + 20, screen.size.width, 
                                         2 * screen.size.height / 3);
            }
            pickerSubviewButton.frame = CGRectMake(0, 0, screen.size.width, screen.size.height);
        }
        pickerSubview.frame = subviewRect;
        if (scaledSubviewActive) {
            // If the status bar is visible we have to move the subviews content up 20 pixels because
            // the preview automatically gives the status bar room.
            pickerSubview.bounds = CGRectMake(0, 20, subviewRect.size.width, subviewRect.size.height);
        } else {
            pickerSubview.bounds = subviewRect;
        }
    }
}


#pragma mark -
#pragma mark Showing the ScanditSDKBarcodePicker overlayed as a view

/**
 * A simple example of how the barcode picker can be used in a simple view of various dimensions
 * and how it can be added to any other view.
 */
- (IBAction)overlayAsView {
    if (!scanditSDKBarcodePicker) {
		// Instantiate the barcode picker.
		scanditSDKBarcodePicker = [[ScanditSDKBarcodePicker alloc] initWithAppKey:kScanditSDKAppKey];
	}
    
    pickerSubview = [[UIView alloc] init];
    [pickerSubview addSubview:scanditSDKBarcodePicker.view];
    [pickerSubview setClipsToBounds:YES];
    
    // Add a button behind the subview to close it.
    pickerSubviewButton = [[UIButton alloc] init];
    [pickerSubviewButton addTarget:self 
                            action:@selector(closePickerSubview) 
                  forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:pickerSubviewButton];
    [self.view addSubview:pickerSubview];
    
	// Set the center of the area where barcodes are detected successfully.
    // The default is the center of the screen (0.5, 0.5)
    [scanditSDKBarcodePicker setScanningHotSpotToX:0.5 andY:0.5];
    
    // adjust position of torch/LED icon
    [scanditSDKBarcodePicker.overlayController setTorchButtonRelativeX:0.02 relativeY:0.2 width:35 height:35];
    
    // Update the UI such that it fits the new dimension.
    [self adjustPickerToOrientation:self.interfaceOrientation];
    
	[scanditSDKBarcodePicker startScanning];
}

/**
  * A simple example of how the barcode picker can be used in a simple view of various dimensions
  * and how it can be added to any other view. This example scales the view instead of cropping it.
  */
- (IBAction)overlayAsScaledView {
    if (!scanditSDKBarcodePicker) {
		// Instantiate the barcode picker.
		scanditSDKBarcodePicker = [[ScanditSDKBarcodePicker alloc] 
                                   initWithAppKey:kScanditSDKAppKey];
	}
    
    pickerSubview = [[UIView alloc] init];
    [pickerSubview addSubview:scanditSDKBarcodePicker.view];
    [pickerSubview setClipsToBounds:YES];
    
    // Add a button behind the subview to close it.
    pickerSubviewButton = [[UIButton alloc] init];
    [pickerSubviewButton addTarget:self 
                            action:@selector(closePickerSubview) 
                  forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:pickerSubviewButton];
    [self.view addSubview:pickerSubview];
    
	// Set the center of the area where barcodes are detected successfully.
    // The default is the center of the screen (0.5, 0.5)
    [scanditSDKBarcodePicker setScanningHotSpotToX:0.5 andY:0.5];
    
    scaledSubviewActive = YES;
    
    // Update the UI such that it fits the new dimension.
    [self adjustPickerToOrientation:self.interfaceOrientation];
    
	[scanditSDKBarcodePicker startScanning];
}

- (void)closePickerSubview {
    [scanditSDKBarcodePicker.view removeFromSuperview];
    [scanditSDKBarcodePicker release];
    scanditSDKBarcodePicker = nil;
    [pickerSubview removeFromSuperview];
    [pickerSubview release];
    [pickerSubviewButton removeFromSuperview];
    [pickerSubviewButton release];
    pickerSubview = nil;
    
    scaledSubviewActive = NO;
}


#pragma mark -
#pragma mark Showing the ScanditSDKBarcodePicker as a modal UIViewController

/**
 * Configures and triggers ScanditSDK Scan View
 */
- (IBAction)modallyShowScanView {
    // Hide the status bar to get a bigger area of the video feed. We have to set this before we add
    // UI elements to the scan screen such that the views are aware of the fact that there is no
    // status bar visible.
	[[UIApplication sharedApplication] setStatusBarHidden:YES withAnimation:UIStatusBarAnimationNone];
    
	if (!scanditSDKBarcodePicker) {
		// Instantiate the barcode picker. If it should be available for other orientations than
        // just portrait, subclass it and define which orientations are allowed. Check out the
        // ScanditSDKRotatingBarcodePicker class for an example of this.
		scanditSDKBarcodePicker = [[ScanditSDKRotatingBarcodePicker alloc] initWithAppKey:kScanditSDKAppKey];
	}
	
    // Developers can instantiate a custom overlay controller that inherits from 
    // ScanditSDKOverlayController. It allows developers to add their own UI elements and logic. 
    // Set the custom overlay as the barcode picker's overlay controller as shown below.
    
	/*
	DemoScanViewController *customOverlayController;
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
        customOverlayController = 
		[[DemoScanViewController alloc] initWithNibName:@"DemoScanViewController_iPad" bundle:nil];
    } else {
        customOverlayController = 
		[[DemoScanViewController alloc] initWithNibName:@"DemoScanViewController" bundle:nil];
    }
    scanditSDKBarcodePicker.overlayController = customOverlayController;
    [customOverlayController release];
	*/
	
	// Show the search bar for manual entry of a barcode.
    [scanditSDKBarcodePicker.overlayController showSearchBar:NO];
	
	// Show the tool bar with cancel button.
    [scanditSDKBarcodePicker.overlayController showToolBar:YES];
	
    // Set this class as the delegate for the overlay controller. It will now receive events when
    // a barcode was successfully scanned, manually entered or the cancel button was pressed.
	scanditSDKBarcodePicker.overlayController.delegate = self;
    
	// Set the center of the area where barcodes are detected successfully.
    // The default is the center of the screen (0.5, 0.5)
    [scanditSDKBarcodePicker setScanningHotSpotToX:0.5 andY:0.5];
    
	// present the barcode picker modally and start scanning
	[self presentModalViewController:scanditSDKBarcodePicker animated:YES];
	[scanditSDKBarcodePicker startScanning];
}


#pragma mark -
#pragma mark Showing the ScanditSDKBarcodePicker in a UITabBarController

/**
 * This is a simple example of how one can start the ScanditSDKBarcodePicker in its own tab.
 */
- (IBAction)showScanViewInTab {
    if (!scanditSDKBarcodePicker) {
		// Instantiate the barcode picker. We are using the ScanditSDKRotatingBarcodePicker which
        // inherits from the ScanditSDKBarcodePicker to be able to adjust the position of the
        // UI elements depending on the orientation of the picker.
        // To change the allowed orientations you will have to set those in the TabBarController
        // which contains the picker as a tab.
		scanditSDKBarcodePicker = [[ScanditSDKRotatingBarcodePicker alloc] initWithAppKey:kScanditSDKAppKey];
        
    }
    
    // Developers can instantiate a custom overlay controller that inherits from 
    // ScanditSDKOverlayController. It allows developers to add their own GUI elements and logic. 
    // Set the custom overlay as the barcode picker's overlay controller.
    /*
	DemoScanViewController *customOverlayController;
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
        customOverlayController = 
                [[DemoScanViewController alloc] initWithNibName:@"DemoScanViewController_iPad" bundle:nil];
    } else {
        customOverlayController = 
                [[DemoScanViewController alloc] initWithNibName:@"DemoScanViewController" bundle:nil];
    }

    scanditSDKBarcodePicker.overlayController = customOverlayController;
    [customOverlayController release];
	*/
	
    // Show the search bar for manual entry of a barcode.
    [scanditSDKBarcodePicker.overlayController showSearchBar:YES];
    
    // Don't vibrate when a code is recognized.
    [scanditSDKBarcodePicker.overlayController setVibrateEnabled:NO];
    
	// Set the center of the area where barcodes are detected successfully.
    // The default is the center of the screen (0.5, 0.5)
    [scanditSDKBarcodePicker setScanningHotSpotToX:0.5 andY:0.5];
	
	// We are not setting the delegate in the tab view to allow for continous scanning in the demo
	scanditSDKBarcodePicker.overlayController.delegate = self;
    
    // Create a tab item for the picker, possibly with an icon.
    UITabBarItem *tabItem = [[UITabBarItem alloc] initWithTitle:@"Scan" 
                                                          image:[UIImage imageNamed:@"icon_barcode.png"]
                                                            tag:3];
    scanditSDKBarcodePicker.tabBarItem = tabItem;
    [tabItem release];
    
    // Add the picker to the array of view controllers that make up the tabs.
    NSMutableArray *tabControllers = (NSMutableArray *) [[self tabBarController] viewControllers];
    [tabControllers addObject:scanditSDKBarcodePicker];
    // And set the array as the tab bar controllers source of tabs again.
    [[self tabBarController] setViewControllers:tabControllers];
    
    // Hide the status bar to get a bigger area of the video feed.
	[[UIApplication sharedApplication] setStatusBarHidden:YES withAnimation:UIStatusBarAnimationNone];
    
    // Switch to the second tab, where the picker is located and start scanning.
    [[self tabBarController] setSelectedIndex:3];
	[scanditSDKBarcodePicker startScanning];
}

- (void)tabBarController:(UITabBarController *)tabBarController 
 didSelectViewController:(UIViewController *)viewController {
    if (tabBarController.selectedIndex == 0) {
        // We close the scan tab whenever the user goes back to the initial tab because we present 
        // the barcode picker also modally and in a navigation view in this demo app and want to avoid 
		// multiple instances of the barcode picker running. 
        // In your own app you can keep this tab running and just stop the recognition in 
        // onViewWillDisappear or a tabBarControllerDelegate method (just as it is done here for 
        // the other two tabs).
        NSMutableArray *tabControllers = (NSMutableArray *) tabBarController.viewControllers;
        if ([tabControllers count] > 3) {
            [tabControllers removeLastObject];
            [scanditSDKBarcodePicker release];
            scanditSDKBarcodePicker = nil;
            tabBarController.viewControllers = tabControllers;
        } 
    } else if (tabBarController.selectedIndex == 3) {
        // Start the recognition back up when the user switches to the scan tab.
        if (scanditSDKBarcodePicker) {
            [scanditSDKBarcodePicker startScanning];
        }
    } else if (scanditSDKBarcodePicker) {
        // The scan tab is not visible, stop scanning to not waste resources and get unexpected 
        // callbacks.
        [scanditSDKBarcodePicker stopScanning];
    }
}


#pragma mark -
#pragma mark Showing the ScanditSDKBarcodePicker in a UINavigationController

/**
 * This is a simple example of how one can push the ScanditSDKBarcodePicker in a navigation controller.
 */
- (IBAction)showScanViewInNav {
    if (!scanditSDKBarcodePicker) {
		// Instantiate the barcode picker. We are not using the ScanditSDKRotatingBarcodePicker
        // here but the picker will still be able to rotate if the TabBarController that contains
        // the current tab is set to allow all orientations.
        // To change the allowed orientations you will have to set those in the TabBarController.
		scanditSDKBarcodePicker = [[ScanditSDKBarcodePicker alloc] initWithAppKey:kScanditSDKAppKey];
    }
	
	// Developers can instantiate a custom overlay controller that inherits from 
    // ScanditSDKOverlayController. It allows developers to add their own GUI elements and logic. 
    // Set the custom overlay as the barcode picker's overlay controller.
    /*
	DemoScanViewController *customOverlayController;
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
        customOverlayController = 
		[[DemoScanViewController alloc] initWithNibName:@"DemoScanViewController_iPad" bundle:nil];
    } else {
        customOverlayController = 
		[[DemoScanViewController alloc] initWithNibName:@"DemoScanViewController" bundle:nil];
    }
	
    scanditSDKBarcodePicker.overlayController = customOverlayController;
    [customOverlayController release];
	*/
	 
	// Set the center of the area where barcodes are detected successfully.
    // The default is the center of the screen (0.5, 0.5)
    [scanditSDKBarcodePicker setScanningHotSpotToX:0.5 andY:0.5];	
    
    // Show the bar for manual entry of a barcode.
    [scanditSDKBarcodePicker.overlayController showSearchBar:YES];
    
    // Don't beep on recognizing a code.
    [scanditSDKBarcodePicker.overlayController setBeepEnabled:NO];
    
    // We are not setting the delegate in the tab view to allow for continous scanning in the demo
	scanditSDKBarcodePicker.overlayController.delegate = self;
    
    // Push the info banner up a bit since the navigation bar shifts the whole view down.
    [scanditSDKBarcodePicker.overlayController setInfoBannerOffset:30];
    
	// Hide the status bar to get a bigger area of the video feed.
	[[UIApplication sharedApplication] setStatusBarHidden:YES withAnimation:UIStatusBarAnimationNone];
    
    // Push the picker on the navigation stack and start scanning.
    [[self navigationController] pushViewController:scanditSDKBarcodePicker animated:YES];
	[scanditSDKBarcodePicker startScanning];
    
    // Make sure that we release the picker when it gets poped from the controller.
    releaseOnAppear = YES;
}
	

#pragma mark -
#pragma mark ScanditSDKOverlayControllerDelegate methods

/**
 * This delegate method of the ScanditSDKOverlayController protocol needs to be implemented by 
 * every app that uses the ScanditSDK and this is where the custom application logic goes.
 * In the example below, we are just showing an alert view that asks the user whether he 
 * wants to continue scanning.
 */
- (void)scanditSDKOverlayController:(ScanditSDKOverlayController *)scanditSDKOverlayController1 
                     didScanBarcode:(NSDictionary *)barcodeResult {

	
	[scanditSDKBarcodePicker stopScanning];

	if (barcodeResult == nil) return;
	
    NSString *symbology = [barcodeResult objectForKey:@"symbology"];
	NSString *barcode = [barcodeResult objectForKey:@"barcode"];
	NSString *title = [NSString stringWithFormat:@"Scanned %@ code: %@", symbology, barcode];
    
	UIActionSheet *decodedBarcodeActionSheet = [[UIActionSheet alloc] initWithTitle:title
																		   delegate:self 
                                                                  cancelButtonTitle:@"OK" 
															 destructiveButtonTitle:nil 
																  otherButtonTitles:nil];
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
        [decodedBarcodeActionSheet showInView:scanditSDKBarcodePicker.view];
    } else {
        [decodedBarcodeActionSheet showFromTabBar:[[self tabBarController] tabBar]];
	}
    
	[decodedBarcodeActionSheet release];
}
/**
 * This delegate method of the ScanditSDKOverlayController protocol needs to be implemented by 
 * every app that uses the ScanditSDK and this is where the custom application logic goes.
 * In the example below, we are just showing an alert view that asks the user whether he 
 * wants to continue scanning.
 */
- (void)scanditSDKOverlayController:(ScanditSDKOverlayController *)scanditSDKOverlayController1 
                didCancelWithStatus:(NSDictionary *)status {
	
	// Stop the scanning process:
	[scanditSDKBarcodePicker stopScanning];
	
	[[self tabBarController] dismissModalViewControllerAnimated:YES];
	
	[scanditSDKBarcodePicker release];
	scanditSDKBarcodePicker = nil;
	[[UIApplication sharedApplication] setStatusBarHidden:NO withAnimation:UIStatusBarAnimationNone];
}

/**
 * This delegate method of the ScanditSDKOverlayController protocol needs to be implemented by 
 * every app that uses the ScanditSDK and this is where the custom application logic goes.
 * In the example below, we are just showing an alert view that asks the user whether he 
 * wants to continue scanning.
 */
- (void)scanditSDKOverlayController:(ScanditSDKOverlayController *)scanditSDKOverlayController 
                    didManualSearch:(NSString *)input {
	
    [scanditSDKBarcodePicker.overlayController resetUI];
	// Stop the scanning process:
	[scanditSDKBarcodePicker stopScanning];
	
	NSString *title = [NSString stringWithFormat:@"User entered: %@", input];
	UIActionSheet *cancelBarcodeActionSheet = [[UIActionSheet alloc] initWithTitle:title
																		  delegate:self 
                                                                 cancelButtonTitle:@"OK" 
															destructiveButtonTitle:nil 
																 otherButtonTitles:nil];
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
        [cancelBarcodeActionSheet showInView:scanditSDKBarcodePicker.view];
    } else {
        [cancelBarcodeActionSheet showFromTabBar:[[self tabBarController] tabBar]];
    }
    [cancelBarcodeActionSheet release]; 
}


#pragma mark -
#pragma mark UIActionSheetDelegate methods

/**
 * Delegate method of the actionsheet implemented above
 */
- (void)actionSheet:(UIActionSheet *)actionSheet 
        didDismissWithButtonIndex:(NSInteger)buttonIndex {	
	switch (buttonIndex) {
		default: {
			// Reset recognition engine, to be able to recognize the same code again,
			// even without first moving away from it:
			[scanditSDKBarcodePicker reset];
            
            // Manually reset UI, in case we scanned already something before, to
            // make sure no information from the last scan is displayed until the
            // camera has been initialized:
            //[scanditSDKBarcodePicker.overlayController resetUI];
			
			// Start the recognition again:
			[scanditSDKBarcodePicker startScanning];
		}
	}
}

#pragma mark -
#pragma mark CLLocationManagerDelegate

- (void)locationManager:(CLLocationManager *)manager 
    didUpdateToLocation:(CLLocation *)newLocation 
           fromLocation:(CLLocation *)oldLocation {
	[manager stopUpdatingLocation];
}

@end
