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
#define DISMISS 3


@interface ViewController ()

@end

@implementation ViewController


- (void)viewDidLoad
{
    // Added a full screen custom button hidden and when clicked outside the keyborad or text field the keyboard retracts
    
////////// DISMISS the Keyborad  ////////////////////////////////////////////////////////////////////////////////////////////////////
    
    dismissBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    if (dismissBtn != nil)
    {
        dismissBtn.tag = DISMISS;
        
        // iPad Width & Height
        dismissBtn.frame = CGRectMake(0.0f, 0.0f, 1024.0f, 768.0f);   // comment out for iPhone

        
        // iPhone Width & Height
//        dismissBtn.frame = CGRectMake(0.0f, 0.0f, 320.0f, 460.0f);
        [dismissBtn addTarget:self action:@selector(onClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:dismissBtn];
    }
    
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////    
   
    
    
///////// ADDED A UILabel Username:  /////////////////////////////////////////////////////////////////////////////////////////////////
    
    //iPad
    userName = [[UILabel alloc] initWithFrame:CGRectMake(20.0f, 26.0f, 170.0f, 30.0f)];   // comment out for iPhone
    
    // iPhone
//  userName = [[UILabel alloc] initWithFrame:CGRectMake(10.0f, 15.0f, 85.0f, 18.0f)];
    if (userName != nil)
    {
      //iPad Font Size
        userName.font = [UIFont systemFontOfSize:30.0f];    // comment out for iPhone
        
        userName.text = @"Username:";
        userName.backgroundColor = [UIColor clearColor];
        [self.view addSubview:userName];
        
        
    }
    
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    
    
    
////// ADDED A UITextField to take a username  //////////////////////////////////////////////////////////////////////////////////////////
    
    // iPad
    usernameField = [[UITextField alloc] initWithFrame:CGRectMake(175.0f, 20.0f, 570.0f, 50.0f)];   // comment out for iPhone
    
    //iPhone
//    usernameField = [[UITextField alloc] initWithFrame:CGRectMake(100.0f, 9.0f, 210.0f, 30.0f)];
    
    if (usernameField != nil)
    {
        usernameField.borderStyle = UITextBorderStyleRoundedRect;
        usernameField.placeholder = @"Enter Username";
        [self.view addSubview:usernameField];
        
    }
    
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    
    
    
////// Created a (Login) UIButton for the TextField userName   /////////////////////////////////////////////////////////////////////////
    
    login = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    
    if (login != nil)
    {
        login.tag = LOGIN;
        
        // iPad
        login.frame = CGRectMake(655.0f, 80.0f, 90.0f, 40.0f);      // comment out for iPhone
        
        // iPhone
//        login.frame = CGRectMake(220.0f, 45.0f, 90.0f, 30.0f);
        [login setTitle:@"Login" forState:UIControlStateNormal];
        [login addTarget:self action:@selector(onClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:login];
    }
    
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    
   
    
/////// Created another UILabel beneath with the default text "Please Enter Username"   ///////////////////////////////////////////////
    
        //iPad
        enterUserMsg = [[UILabel alloc] initWithFrame:CGRectMake(0.0f, 140.0f, 768.0f, 100.0f)];        // comment out for iPhone
    

        // iPhone
//    enterUserMsg = [[UILabel alloc] initWithFrame:CGRectMake(0.0f, 80.0f, 320.0f, 80.0f)];
    
    if (enterUserMsg != nil)
    {
        enterUserMsg.text = @"Please Enter Username!";
        
        // iPad
        enterUserMsg.font = [UIFont systemFontOfSize:30.0f];     // comment out for iPhone

        enterUserMsg.backgroundColor = [UIColor grayColor];
        enterUserMsg.textColor = [UIColor blueColor];
        enterUserMsg.textAlignment = NSTextAlignmentCenter;
        [self.view addSubview:enterUserMsg];
        
    }
    
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    
    
    
////// Created a UIButton for Show Date  //////////////////////////////////////////////////////////////////////////////////////////////
    
    dateBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    
    if (dateBtn != nil)
    {
        dateBtn.tag = DATE;
        
        // iPad
        dateBtn.frame = CGRectMake(337.0f, 380.0f, 90.0f, 50.0f);     // comment out for iPhone

        
        // iPhone
//        dateBtn.frame = CGRectMake(10.0f, 175.0f, 90.0f, 50.0f);
        [dateBtn setTitle:@"Show Date" forState:UIControlStateNormal];
        [dateBtn addTarget:self action:@selector(onClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:dateBtn];
                                                                        
    }
    
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    
    
    
////// Created a UIButton for INFO  //////////////////////////////////////////////////////////////////////////////////////////////////
    
    //iPad
    info = [UIButton buttonWithType:UIButtonTypeInfoDark];
    
    // iPhone
//    info = [UIButton buttonWithType:UIButtonTypeInfoLight];
    
    if (info != nil)
    {
        info.tag = INFO;
        
        // iPad
        info.frame = CGRectMake(10.0f, 630.0f, 25.0f, 30.0f);    // comment out for iPhone
        
        // iPhone
//        info.frame = CGRectMake(10.0f, 300.0f, 25.0f, 30.0f);
        [info addTarget:self action:@selector(onClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:info];
        
    }
    
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    
    
    
////// Created a INFO Label  //////////////////////////////////////////////////////////////////////////////////////////////////////////
    
    // iPad
    infoLabel = [[UILabel alloc] initWithFrame:CGRectMake(45.0f, 750.0f, 753.0f, 80.0f)];
    
    // iPhone
//    infoLabel = [[UILabel alloc] initWithFrame:CGRectMake(10.0f, 350.0f, 305.0f, 80.0f)];
    
    if (infoLabel != nil)
    {
        infoLabel.textColor = [UIColor redColor];
        
        // iPad
        infoLabel.font = [UIFont systemFontOfSize:30.0f];
        
        infoLabel.backgroundColor = [UIColor clearColor];
        infoLabel.numberOfLines = 2;
        [self.view addSubview:infoLabel];
    }
    
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////



-(void) onClick: (UIButton*)button          ////// onClick Function //////////////////////////////////////////////////////////////////
{

////// Added a target to the UIButton to call a function called onClick when the user presses the Login button. If the user has not entered any text into the UITextField, display in the UILabel, "Username Cannot be Empty". Otherwise, display "User: username has been logged in".
    
/////// Login Button   /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    
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
    
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    
    
    
////// DISMISS KEYBORAD  //////////////////////////////////////////////////////////////////////////////////////////////////////////////
    
    else if (button.tag == DISMISS)
    {
        [usernameField resignFirstResponder];
    }
    
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    


/////// Added an action to the Date button that when clicked, it will call the same onClick handler already defined
    
/////// Date Button  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////// 
    
    else if (button.tag == DATE)
    {
        NSDate *date = [NSDate date];
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        
        if (dateFormatter != nil)
        {
            [dateFormatter setDateFormat:@"MMMM d, yyyy | h:mm a zzz"];
            NSString *dateStr = [dateFormatter stringFromDate:date];
            
            UIAlertView *dateAlert = [[UIAlertView alloc] initWithTitle:@"Today's Date" message:dateStr delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
            if (dateAlert != nil)
            {
                [dateAlert show];
            }
        }
     }
    
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    
    
    
/////// Added when the INFO button is pressed, the text (This application was created by Brandon Mackey) appear in the info UILabel
    
////// INFO Button   ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    
    else if (button.tag == INFO)
    {
        infoLabel.text = @"This application was created by Brandon Mackey";
    }
}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
