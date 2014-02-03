//
//  SecondViewController.h
//  MDF1-Wk2-2
//
//  Created by Brandon Mackey on 8/14/13.
//  Copyright (c) 2013 Brandon Mackey. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SecondViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>
{
    IBOutlet UITableView *tableView;

    NSMutableArray *stringArray;
    NSMutableArray *myArticle;
    NSMutableArray *myUrl;
    UITableViewCell *cell;
}

@property(strong, nonatomic) NSMutableArray *listData;
@end
