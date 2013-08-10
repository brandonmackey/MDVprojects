//
//  ViewController.h
//  MDF1-Wk1
//
//  Created by Brandon Mackey on 8/7/13.
//  Copyright (c) 2013 Brandon Mackey. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CustomTableCell.h"

@interface ViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>
{
    IBOutlet UITableView *tableView;
    IBOutlet UIButton *editButton;
    IBOutlet UIButton *doneButton;
    
    NSMutableArray *stringArray;
    NSMutableArray *myFav;
    NSMutableArray *myPrice;
    
    CustomTableCell *cell;
}

-(IBAction)onEdit:(id)sender;

@property(strong, nonatomic) NSMutableArray *listData;
@end
