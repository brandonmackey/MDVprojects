//
//  CustomViewController.m
//  MDF-Wk3
//
//  Created by Brandon Mackey on 8/21/13.
//  Copyright (c) 2013 Brandon Mackey. All rights reserved.
//

#import "CustomViewController.h"
#import "MyMapAnnotation.h"

@interface CustomViewController ()

@end

@implementation CustomViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    // CREATE A DEFAULT SPAN AND ZOOM LEVEL
    MKCoordinateSpan span;
    span.latitudeDelta = 2.0f;
    span.longitudeDelta = 2.0f;
    
    CLLocationCoordinate2D location;
    location.latitude = 40.0000f;
    location.longitude = -86.0000f;
    
    MKCoordinateRegion region;
    region.center = location;
    region.span = span;
    mapView1.region = region;
    [super viewDidLoad];
    
    MyMapAnnotation *annotation = [[MyMapAnnotation alloc]initWithTitle:@"text" coord:location];
    if (annotation)
    {
        [mapView1 addAnnotation:annotation];
    }
    
    
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)onClose:(id)sender
{
    UIButton *button = (UIButton*)sender;
    if (button.tag == 0)
    {
        [self dismissViewControllerAnimated:true completion:nil];
    }
}

@end

//Done
