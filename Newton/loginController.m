//
//  loginViewController.m
//  Newton
//
//  Created by Laeeq Humam for H&M on 28/04/17.
//  Copyright (c) 2017 H&M. All rights reserved.
//

#import "loginController.h"
#import "ViewController.h"

@interface loginController ()

@end

@implementation loginController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

//Ok button pressed on login window
- (IBAction)handleButtonClick:(id)sender {    
    
    
    NSString *user = self.userName.stringValue;
    [[NSUserDefaults standardUserDefaults] setObject:user forKey:@"userid"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
    NSString *password = self.password.stringValue;
    [[NSUserDefaults standardUserDefaults] setObject:password forKey:@"password"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
    
    [[self.loginView window] close];
    [[NSApplication sharedApplication] stopModal];
}


//cancel button pressed on login window
- (IBAction)handleCancelButtonClick:(id)sender {
    
}


@end
