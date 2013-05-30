//
//  ViewController.m
//  AOC1 Wk4
//
//  Created by Brandon Mackey on 5/29/13.
//  Copyright (c) 2013 Brandon Mackey. All rights reserved.
//

#import "ViewController.h"

#define LOGIN 0
#define DATE 1
#define INFO 2


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
    
    // Created a UIButton for Show Date
    
    dateBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    
    if (dateBtn != nil)
    {
        dateBtn.tag = DATE;
        dateBtn.frame = CGRectMake(10.0f, 175.0f, 90.0f, 50.0f);
        [dateBtn setTitle:@"Show Date" forState:UIControlStateNormal];
        [dateBtn addTarget:self action:@selector(onClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:dateBtn];
                                                                        
    }
    
    // Created a UIButton for INFO
    
    info = [UIButton buttonWithType:UIButtonTypeInfoLight];
    
    if (info != nil)
    {
        info.tag = INFO;
        info.frame = CGRectMake(10.0f, 300.0f, 25.0f, 30.0f);
        [info addTarget:self action:@selector(onClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:info];
        
    }
    
    // Created a INFO Label
    
    infoLabel = [[UILabel alloc] initWithFrame:CGRectMake(10.0f, 350.0f, 305.0f, 80.0f)];
    
    if (infoLabel != nil)
    {
        infoLabel.textColor = [UIColor redColor];
        infoLabel.backgroundColor = [UIColor clearColor];
        infoLabel.numberOfLines = 2;
        [self.view addSubview:infoLabel];
    }
    
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}


-(void) onClick: (UIButton*)button
{
    // Added a target to the UIButton to call a function called onClick when the user presses the Login button. If the user has not entered any text into the UITextField, display in the UILabel, "Username Cannot be Empty". Otherwise, display "User: username has been logged in".
    
    // Login Button
    
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
    
    // Added an action to the Date button that when clicked, it will call the same onClick handler already defined
    
    // Date Button
    
    else if (button.tag == DATE)
    {
        NSDate *date = [NSDate date];
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        
        if (dateFormatter != nil)
        {
            [dateFormatter setDateFormat:@"MMMM d, yyyy [h:mm a] zzz"];
            NSString *dateStr = [dateFormatter stringFromDate:date];
            
            UIAlertView *dateAlert = [[UIAlertView alloc] initWithTitle:@"Today's Date" message:dateStr delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
            if (dateAlert != nil)
            {
                [dateAlert show];
            }
        }
     }
    
    // Added when the INFO button is pressed, the text (This application was created by Brandon Mackey) appear in the info UILabel
    
    // INFO Button
    
    else if (button.tag == INFO)
    {
        infoLabel.text = @"This application was created by Brandon Mackey";
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
