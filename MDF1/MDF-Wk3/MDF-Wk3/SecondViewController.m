//
//  SecondViewController.m
//  MDF-Wk3
//
//  Created by Brandon Mackey on 8/21/13.
//  Copyright (c) 2013 Brandon Mackey. All rights reserved.
//

#import "SecondViewController.h"
#import "MyMapAnnotation.h"

@interface SecondViewController ()

@end

@implementation SecondViewController


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"Second", @"Second");
        self.tabBarItem.image = [UIImage imageNamed:@"second"];
    }
    return self;
}

-(MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id <MKAnnotation>)annotation
{
     
    
    MKPinAnnotationView *annView = [[MKPinAnnotationView alloc]initWithAnnotation:annotation reuseIdentifier:@"CustomPin"];
    
    annView.animatesDrop = true;
    annView.canShowCallout = true;
    annView.pinColor = MKPinAnnotationColorGreen;
    
    return annView;
    
    MyMapAnnotation *anno = (MyMapAnnotation*)annotation;
    if ((anno = 0))
    {
        annView.pinColor = MKPinAnnotationColorGreen;
    }
    else if ((anno > 0))
    {
        annView.pinColor = MKPinAnnotationColorRed;
    }
    return annView;
}

- (void)viewDidLoad
{
    
    
//    // CREATE A DEFAULT SPAN AND ZOOM LEVEL
//    MKCoordinateSpan span;
//    span.latitudeDelta = 2.0f;
//    span.longitudeDelta = 2.0f;
//    
//    CLLocationCoordinate2D location;
//    location.latitude = 40.0000f;
//    location.longitude = -86.0000f;
//    
//    MKCoordinateRegion region;
//    region.center = location;
//    region.span = span;
//    mapView.region = region;
//    
//    CLLocationCoordinate2D tacoLocation; // westfield
//    tacoLocation.latitude = 40.04f;
//    tacoLocation.longitude = -86.13f;
//    
//    CLLocationCoordinate2D tacoLocation2; // Carmel
//    tacoLocation2.latitude = 39.96f;
//    tacoLocation2.longitude = -86.11f;
//
//    CLLocationCoordinate2D tacoLocation3; // noblesville,westfield Rd
//    tacoLocation3.latitude = 40.04f;
//    tacoLocation3.longitude = -86.02f;
//
//    CLLocationCoordinate2D tacoLocation4; // Noblesville, Clover Rd 
//    tacoLocation4.latitude = 40.03f;
//    tacoLocation4.longitude = -85.99f;
//
//    CLLocationCoordinate2D tacoLocation5; // Fishers
//    tacoLocation5.latitude = 39.98f;
//    tacoLocation5.longitude = -85.92f;
//    
//    CLLocationCoordinate2D macLocation6; // noblesville, Conner St
//    macLocation6.latitude = 40.04f;
//    macLocation6.longitude = -86.00f;
//    
//    CLLocationCoordinate2D macLocation7; // noblesville, village center dr
//    macLocation7.latitude = 40.04f;
//    macLocation7.longitude = -86.07f;
//    
//    CLLocationCoordinate2D macLocation8; // noblesville, HAZEL DELL CROSSING 
//    macLocation8.latitude = 40.00f;
//    macLocation8.longitude = -86.06f;
//    
//    CLLocationCoordinate2D macLocation9; // Fishers
//    macLocation9.latitude = 39.97f;
//    macLocation9.longitude = -86.00f;
//    
//    CLLocationCoordinate2D macLocation10; // cicero
//    macLocation10.latitude = 40.12f;
//    macLocation10.longitude = -86.01f;
//
//    MyMapAnnotation *annotation = [[MyMapAnnotation alloc]initWithTitle:@"Taco Bell" coord:tacoLocation];
//
//    MyMapAnnotation *annotation2 = [[MyMapAnnotation alloc]initWithTitle:@"Taco Bell" coord:tacoLocation2];
//    
//    MyMapAnnotation *annotation3 = [[MyMapAnnotation alloc]initWithTitle:@"Taco Bell" coord:tacoLocation3];
//    
//    MyMapAnnotation *annotation4 = [[MyMapAnnotation alloc]initWithTitle:@"Taco Bell" coord:tacoLocation4];
//    
//    MyMapAnnotation *annotation5 = [[MyMapAnnotation alloc]initWithTitle:@"Taco Bell" coord:tacoLocation5];
//    
//    MyMapAnnotation *annotation6 = [[MyMapAnnotation alloc]initWithTitle:@"McDonalds" coord:macLocation6];
//    
//    MyMapAnnotation *annotation7 = [[MyMapAnnotation alloc]initWithTitle:@"McDonalds" coord:macLocation7];
//    
//    MyMapAnnotation *annotation8 = [[MyMapAnnotation alloc]initWithTitle:@"McDonalds" coord:macLocation8];
//    
//    MyMapAnnotation *annotation9 = [[MyMapAnnotation alloc]initWithTitle:@"McDonalds" coord:macLocation9];
//    
//    MyMapAnnotation *annotation10 = [[MyMapAnnotation alloc]initWithTitle:@"McDonalds" coord:macLocation10];
//    
//    
//        [mapView addAnnotations:[NSArray arrayWithObjects:annotation, annotation2, annotation3, annotation4, annotation5, annotation6, annotation7, annotation8, annotation9, annotation10, nil]];
//    
    
        
    
    
    
    
    
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
