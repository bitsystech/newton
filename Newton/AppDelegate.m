//
//  AppDelegate.m
//  Newton
//
//  Created by Laeeq Humam for H&M on 28/04/17.
//  Copyright (c) 2017 H&M. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    [[NSUserNotificationCenter defaultUserNotificationCenter] setDelegate:self];
}

- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}

- (BOOL)userNotificationCenter:(NSUserNotificationCenter *)center
     shouldPresentNotification:(NSUserNotification *)notification
{
    return YES;
}



-(IBAction)logmenuSelect:(id)sender{


      NSLog(@" Log menu clicked");
    
    NSTextView *textView; //your NSTextView object
    NSError *err = nil;
    NSString *path = [[NSBundle mainBundle] pathForResource:@"/usr/local/EYM/logs.txt" ofType:@"txt"];
    NSString *contents = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:&err];
    if(!contents) {
        //handle error
    }
    [textView setString:contents];
    
}

@end
