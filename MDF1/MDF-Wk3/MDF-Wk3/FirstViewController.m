//
//  FirstViewController.m
//  MDF-Wk3
//
//  Created by Brandon Mackey on 8/21/13.
//  Copyright (c) 2013 Brandon Mackey. All rights reserved.
//

#import "FirstViewController.h"
#import "MyMapAnnotation.h"
#import "CustomViewController.h"
#import "CustomTableCell.h"
#import "Singleton.h"

@interface FirstViewController ()

@end

@implementation FirstViewController


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"First", @"First");
        self.tabBarItem.image = [UIImage imageNamed:@"first"];
    }
    return self;
}
							
- (void)viewDidLoad
{

    [Singleton GetInstance];
    
    
    doneButton.hidden = true;
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

-(IBAction)onEdit:(id)sender
{
    [Singleton GetInstance];
    
    UIButton *button = (UIButton*)sender;
    if (button !=nil)
    {
        if (button.tag == 0)
        {
            [tableView setEditing:true];
            doneButton.hidden = false;
        }
        else if (button.tag == 1)
        {
            [tableView setEditing:false];
            doneButton.hidden = true;
        }
    }
}

#pragma mark - TableView Methods
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    [Singleton GetInstance];
    
    // No Matter how many Cells I have this will count them
    return [[Singleton GetInstance].stringArray count];
}

// EDIT AND DELETE METHOD

- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
    [Singleton GetInstance];
    
    return UITableViewCellEditingStyleDelete;
}



- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    [Singleton GetInstance];
    
    // DELETE MODE
    if (editingStyle == UITableViewCellEditingStyleDelete)
    {
        NSLog(@"WE WANT TO DELETE ROW=%d", indexPath.row);
        
        // REMOVES OBJECT FROM THE LIST
        [stringArray removeObjectAtIndex:indexPath.row];
        
        [tableView deleteRowsAtIndexPaths:[NSMutableArray arrayWithObject:indexPath] withRowAnimation:true];
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView2 cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    [Singleton GetInstance];
    
    static NSString *CellIdentifier = @"Cell";
    
    cell =[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil)
    {
        cell = [[CustomTableCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    

    NSArray* views = [[NSBundle mainBundle] loadNibNamed:@"CustomCellView" owner:nil options:nil];
    
        for (UIView *view in views)
        {
            if ([view isKindOfClass:[CustomTableCell class]])
            {
                cell = (CustomTableCell*)view;

                cell.textLabel.text = [stringArray objectAtIndex:indexPath.row];
            }
        }
    
    
    
    
        static int count =0;
        cell.textLabel.text = (NSString*)[stringArray objectAtIndex:indexPath.row];
    
        count++;
    return cell;
}

// DETAILED VIEW METHOD

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [Singleton GetInstance];
    
    
    CustomViewController *detailView = [[CustomViewController alloc] initWithNibName:@"CustomViewController" bundle:nil];
    if (detailView !=nil)
    {
        [self presentViewController:detailView animated:true completion:nil];
      
        
        //detailView.biz.text = [myBiz objectAtIndex:indexPath.row];
        //detailView.price.text = [myPrice objectAtIndex:indexPath.row];
    }
   
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
