//
//  CustomViewController.h
//  MDF-Wk3
//
//  Created by Brandon Mackey on 8/21/13.
//  Copyright (c) 2013 Brandon Mackey. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FirstViewController.h"
#import <MapKit/MapKit.h>

@interface CustomViewController : UIViewController
{
    IBOutlet UIButton *backButton;
    IBOutlet UILabel *bizInfo;
    IBOutlet MKMapView *mapView1;
}

-(IBAction)onClose:(id)sender;



@end



//Need @property for detailed view items