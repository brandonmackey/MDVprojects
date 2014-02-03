//
//  MyMapAnnotation.h
//  MDF-Wk3
//
//  Created by Brandon Mackey on 8/21/13.
//  Copyright (c) 2013 Brandon Mackey. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface MyMapAnnotation : NSObject <MKAnnotation>
{
    NSString *title;
    CLLocationCoordinate2D coordinate;
    
    NSInteger storeOrder ;
    
}
-(id)initWithTitle:(NSString*)text coord:(CLLocationCoordinate2D)coord;

@property (nonatomic, copy) NSString *title;
@property (nonatomic, readonly) CLLocationCoordinate2D coordinate;
@property NSInteger storeOrder;
@end
