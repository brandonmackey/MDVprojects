//
//  DetailedViewController.h
//  MDF1-Wk2-2
//
//  Created by Brandon Mackey on 8/16/13.
//  Copyright (c) 2013 Brandon Mackey. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SecondViewController.h"
@interface DetailedViewController : UIViewController
{
    IBOutlet UIButton *backButton;


}

-(IBAction)onClose:(id)sender;

@property (nonatomic, strong) UILabel *art;
@property (nonatomic, strong) UILabel *url;

@end
