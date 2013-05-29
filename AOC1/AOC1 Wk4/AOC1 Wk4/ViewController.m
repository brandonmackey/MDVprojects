//
//  ViewController.m
//  AOC1 Wk4
//
//  Created by Brandon Mackey on 5/29/13.
//  Copyright (c) 2013 Brandon Mackey. All rights reserved.
//

#import "ViewController.h"

#define LOGIN 0

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    
    // ADDED A UILabel Username:
    
    userName = [[UILabel alloc] initWithFrame:CGRectMake(10.0f, 15.0f, 85.0f, 18.0f)];
    if (userName != nil)
    {
        userName.text = @"Username:";
        userName.backgroundColor = [UIColor clearColor];
        [self.view addSubview:userName];
        
    }
    
    // ADDED A UITextField to take a username
    
    usernameField = [[UITextField alloc] initWithFrame:CGRectMake(100.0f, 9.0f, 210.0f, 30.0f)];
    
    if (usernameField != nil)
    {
        usernameField.borderStyle = UITextBorderStyleRoundedRect;
        usernameField.placeholder = @"Enter Username";
        [self.view addSubview:usernameField];
    }
    
    // Created a (Login) UIButton for the TextField userName
    
    login = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    
    if (login != nil)
    {
        login.tag = LOGIN;
        login.frame = CGRectMake(220.0f, 45.0f, 90.0f, 30.0f);
        [login setTitle:@"Login" forState:UIControlStateNormal];
        [login addTarget:self action:@selector(onClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:login];
    }
    
    // Created another UILabel beneath with the default text "Please Enter Username"
    
    enterUserMsg = [[UILabel alloc] initWithFrame:CGRectMake(0.0f, 80.0f, 320.0f, 80.0f)];
    
    if (enterUserMsg != nil)
    {
        enterUserMsg.text = @"Please Enter Username!";
        enterUserMsg.backgroundColor = [UIColor grayColor];
        enterUserMsg.textColor = [UIColor blueColor];
        enterUserMsg.textAlignment = NSTextAlignmentCenter;
        [self.view addSubview:enterUserMsg];
        
    }
    
    //
    
    
    
    
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}


-(void) onClick: (UIButton*)button
{
    // Added a target to the UIButton to call a function called onClick when the user presses the Login button. If the user has not entered any text into the UITextField, display in the UILabel, "Username Cannot be Empty". Otherwise, display "User: username has been logged in".
    
    if (button.tag == LOGIN)
    {
        NSString *username = usernameField.text;
        if (username.length == 0)
        {
            enterUserMsg.text = @"Username Cannot be Emtpy";
        }
        else
        {
            NSString *loggedIn = [[NSString alloc] initWithFormat:@"User: %@ has been logged in", username];
            enterUserMsg.text = loggedIn;
        }
    
    
    }
    
    
    
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
