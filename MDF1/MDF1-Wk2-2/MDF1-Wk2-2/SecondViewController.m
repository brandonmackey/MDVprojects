//
//  SecondViewController.m
//  MDF1-Wk2-2
//
//  Created by Brandon Mackey on 8/14/13.
//  Copyright (c) 2013 Brandon Mackey. All rights reserved.
//

#import "SecondViewController.h"
#import "DetailedViewController.h"

@interface SecondViewController ()

@end

@implementation SecondViewController
@synthesize listData;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"Second", @"Second");
        self.tabBarItem.image = [UIImage imageNamed:@"second"];
    }
    return self;
}



- (void)viewDidLoad
{
    stringArray = [[NSMutableArray alloc]initWithObjects:@"Art 1",@"Art 2",@"Art 3", nil];
    
    myArticle= [[NSMutableArray alloc] initWithObjects:@"R8",@"7 Series",@"3 Series", nil];
    
    myUrl = [[NSMutableArray alloc] initWithObjects:@"114,900",@"74,000",@"76,000", nil];
    
    
    
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

#pragma mark - TableView Methods
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [stringArray count];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    cell =[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    cell.textLabel.text = [stringArray objectAtIndex:indexPath.row];
//    NSArray* views = [[NSBundle mainBundle] loadNibNamed:@"DetailedViewController" owner:nil options:nil];
//
//        for (UIView *view in views)
//        {
//            if ([view isKindOfClass:[DetailedViewController class]])
//            {
//                cell = (UITableViewCell*)view;
//
//                cell.textLabel.text = [stringArray objectAtIndex:indexPath.row];
//            }
//        }
//    
//    
//    
//    
//    static int count =0;
//    cell.textLabel.text = (NSString*)[stringArray objectAtIndex:indexPath.row];
//    
//    count++;
    return cell;

}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    DetailedViewController *detailView = [[DetailedViewController alloc] initWithNibName:@"DetailedViewController" bundle:nil];
    if (detailView !=nil)
    {
        [self presentViewController:detailView animated:true completion:nil];
        
        detailView.art.text = [myArticle objectAtIndex:indexPath.row];
        detailView.url.text = [myUrl objectAtIndex:indexPath.row];
    }
    
    
    
}

@end
