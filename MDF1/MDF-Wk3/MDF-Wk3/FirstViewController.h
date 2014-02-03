//
//  FirstViewController.h
//  MDF-Wk3
//
//  Created by Brandon Mackey on 8/21/13.
//  Copyright (c) 2013 Brandon Mackey. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import "CustomViewController.h"
#import "CustomTableCell.h"
#import "Singleton.h"
@interface FirstViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>
{
    IBOutlet UITableView *tableView;
    IBOutlet UIButton *editButton;
    IBOutlet UIButton *doneButton;

    NSMutableArray *stringArray;
    //Need NSMutable for detailed view
    NSMutableArray *myBiz;
    
    CustomTableCell *cell;
}
-(IBAction)onEdit:(id)sender;



@end
