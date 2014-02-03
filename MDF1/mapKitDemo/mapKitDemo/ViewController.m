//
//  ViewController.m
//  mapKitDemo
//
//  Created by Brandon Mackey on 8/21/13.
//  Copyright (c) 2013 Brandon Mackey. All rights reserved.
//

#import "ViewController.h"
#import "MyMapAnnotation.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    
    // CREATE A DEFAULT SPAN AND ZOOM LEVEL
    MKCoordinateSpan span;
    span.latitudeDelta = 40.0f;
    span.longitudeDelta = 40.0f;
    
    CLLocationCoordinate2D location;
    location.latitude = 40.0000f;
    location.longitude = -86.0000f;
    
    MKCoordinateRegion region;
    region.center = location;
    region.span = span;
    mapView.region = region;
    
    CLLocationCoordinate2D indyLocation;
    indyLocation.latitude = 39.79f;
    indyLocation.longitude = -86.14f;
    
    MyMapAnnotation *annotation = [[MyMapAnnotation alloc]initWithTitle:@"Indy" coord:indyLocation];
    if (annotation != nil)
    {
        [mapView addAnnotation:annotation];
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
