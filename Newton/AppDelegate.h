//
//  AppDelegate.h
//  Newton
//
//  Created by Laeeq Humam for H&M on 28/04/17.
//  Copyright (c) 2017 H&M. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "newtonMenuController.h"

@interface AppDelegate : NSObject <NSApplicationDelegate, NSUserNotificationCenterDelegate>

@property newtonMenuController *newtonconroller;
@property NSWindowController *myController;

-(IBAction)logmenuSelect:(id)sender;

@end

