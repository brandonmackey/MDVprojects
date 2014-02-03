//
//  SecondViewController.h
//  MDF-Wk3
//
//  Created by Brandon Mackey on 8/21/13.
//  Copyright (c) 2013 Brandon Mackey. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
@interface SecondViewController : UIViewController <MKMapViewDelegate>
{
    IBOutlet MKMapView *mapView;

}

@end
