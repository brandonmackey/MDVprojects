//
//  ViewController.m
//  MDF1-Wk1
//
//  Created by Brandon Mackey on 8/7/13.
//  Copyright (c) 2013 Brandon Mackey. All rights reserved.
//

#import "ViewController.h"
#import "secondViewController.h"
#import "CustomTableCell.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize listData;

- (void)viewDidLoad
{
    // MUTABLE ARRAY FOR MAIN TABLE VIEW LIST
    
    stringArray = [[NSMutableArray alloc]initWithObjects:@"Audi",@"BMW",@"Buick",@"Chevrolet",@"Dodge",@"Fiat",@"Ford",@"GMC",@"Honda",@"Hummer",@"Jeep",@"Kia",@"Lexus",@"Mazda",@"MINI",@"Porsche",@"Scion",@"Smart",@"Toyota",@"Volvo", nil];
    
    
    
    // MUTABLE ARRAY FOR DETAILED VIEW
    
    myFav = [[NSMutableArray alloc] initWithObjects:@"R8",@"7 Series",@"Lacrosse",@"Camaro",@"Challenger",@"500 Abarth",@"Shelby 500",@"Yukon Denali",@"Ridgeline",@"H2 SUT",@"Grand Cherokee",@"Cadenza",@"LFA",@"Mazda6 Sport",@"John Cooper Works",@"911 GT3",@"FR-S",@"Pure Coupe",@"Land Cruiser",@"C70", nil];
            
            myPrice = [[NSMutableArray alloc] initWithObjects:@"114,900",@"74,000",@"33,135",@"23,345",@"25,995",@"22,000",@"55,595",@"56,685",@"29,450",@"44,995",@"28,795",@"35,100",@"375,000",@"20,990",@"32,300",@"130,400",@"25,255",@"12,490",@"78,555",@"41,200", nil];
    
                       
    doneButton.hidden = true;
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// EDIT BUTTON ON MAIN VIEW

-(IBAction)onEdit:(id)sender
{
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
    return [stringArray count];
}

// EDIT AND DELETE METHOD

 - (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return UITableViewCellEditingStyleDelete;
}



- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
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
    static NSString *CellIdentifier = @"Cell";
    
    cell =[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil)
    {
        cell = [[CustomTableCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
        // CREATE IMAGES 
    UIImage *Audi = [UIImage imageNamed:@"Audi.png"];
    UIImage *BMW = [UIImage imageNamed:@"BMW.png"];
    UIImage *Buick = [UIImage imageNamed:@"buick.png"];
    UIImage *Chevrolet = [UIImage imageNamed:@"chev.png"];
    UIImage *Dodge = [UIImage imageNamed:@"dodge.png"];
    UIImage *Fiat = [UIImage imageNamed:@"fiat.png"];
    UIImage *Ford = [UIImage imageNamed:@"ford.png"];
    UIImage *GMC = [UIImage imageNamed:@"GMC.png"];
    UIImage *Honda = [UIImage imageNamed:@"honda.png"];
    UIImage *Hummer = [UIImage imageNamed:@"hummer.png"];
    UIImage *Jeep = [UIImage imageNamed:@"jeep.png"];
    UIImage *Kia = [UIImage imageNamed:@"kia.png"];
    UIImage *Lexus = [UIImage imageNamed:@"lexus.png"];
    UIImage *Mazda = [UIImage imageNamed:@"mazda.png"];
    UIImage *MINI = [UIImage imageNamed:@"MINI.png"];
    UIImage *Porsche = [UIImage imageNamed:@"porsche.png"];
    UIImage *Scion = [UIImage imageNamed:@"scion.png"];
    UIImage *Smart = [UIImage imageNamed:@"smart.png"];
    UIImage *Toyota = [UIImage imageNamed:@"toyota.png"];
    UIImage *Volvo = [UIImage imageNamed:@"volvo.png"];
    
        // SET IMAGES IN ROW
    
    switch (indexPath.row) {
        case 0:
            cell.imageView.image = Audi;
            break;
            
        case 1:
            cell.imageView.image = BMW;
            break;
        
        case 2:
            cell.imageView.image = Buick;
            break;
        
        case 3:
            cell.imageView.image = Chevrolet;
            break;
            
        case 4:
            cell.imageView.image = Dodge;
            break;
        
        case 5:
            cell.imageView.image = Fiat;
            break;
        
        case 6:
            cell.imageView.image = Ford;
            break;
        
        case 7:
            cell.imageView.image = GMC;
            break;
        
        case 8:
            cell.imageView.image = Honda;
            break;
            
        case 9:
            cell.imageView.image = Hummer;
            break;

        case 10:
            cell.imageView.image = Jeep;
            break;

        case 11:
            cell.imageView.image = Kia;
            break;
        
        case 12:
            cell.imageView.image = Lexus;
            break;

        case 13:
            cell.imageView.image = Mazda;
            break;

        case 14:
            cell.imageView.image = MINI;
            break;

        case 15:
            cell.imageView.image = Porsche;
            break;

        case 16:
            cell.imageView.image = Scion;
            break;

        case 17:
            cell.imageView.image = Smart;
            break;

        case 18:
            cell.imageView.image = Toyota;
            break;

        case 19:
            cell.imageView.image = Volvo;
            break;
    }
        
        
        NSUInteger row = [indexPath row];
        cell.textLabel.text = [stringArray objectAtIndex:row];
    
    
        
    
//    NSArray* views = [[NSBundle mainBundle] loadNibNamed:@"CustomCellView" owner:nil options:nil];
//    
//        for (UIView *view in views)
//        {
//            if ([view isKindOfClass:[CustomTableCell class]])
//            {
//                cell = (CustomTableCell*)view;
//            
//                cell.textLabel.text = [stringArray objectAtIndex:indexPath.row];
//            }
//        }
    
    
    
    
//    static int count =0;
//    cell.textLabel.text = (NSString*)[stringArray objectAtIndex:indexPath.row];
    
//    count++;
    return cell;
}

// DETAILED VIEW METHOD

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    secondViewController *detailView = [[secondViewController alloc] initWithNibName:@"secondViewController" bundle:nil];
    if (detailView !=nil)
    {
        [self presentViewController:detailView animated:true completion:nil];
        
        detailView.fav.text = [myFav objectAtIndex:indexPath.row];
        detailView.price.text = [myPrice objectAtIndex:indexPath.row];
    }
    
    
    
}


@end
