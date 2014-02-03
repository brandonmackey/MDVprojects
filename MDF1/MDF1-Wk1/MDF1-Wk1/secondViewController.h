//
//  secondViewController.h
//  MDF1-Wk1
//
//  Created by Brandon Mackey on 8/7/13.
//  Copyright (c) 2013 Brandon Mackey. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewController.h"

@interface secondViewController : UIViewController
{
    IBOutlet UIButton *backButton;
}

-(IBAction)onClose:(id)sender;

@property (nonatomic, strong) UILabel *fav;
@property (nonatomic, strong) UILabel *price;

@end
