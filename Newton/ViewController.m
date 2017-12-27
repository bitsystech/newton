//
//  ViewController.m
//  Newton
//
//  Created by Laeeq Humam for H&M on 28/04/17.
//  Copyright (c) 2017 H&M. All rights reserved.
//

#import "ViewController.h"
#import "loginController.h"


@implementation ViewController

NSWindowController *myController;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSImage *sucess;
    NSImage *fail;
    NSImage *rollingGif;
    sucess = [NSImage imageNamed:@"checkmark.png"];
    fail = [NSImage imageNamed:@"cross.png"];
    rollingGif = [NSImage imageNamed:@"loader_large_blue.gif"];
    
    [self.result1 setImage:rollingGif];
    [self.result1 setAnimates: YES];
    
    
    
    // Do any additional setup after loading the view.
}


-(void)startProgressImage {
    
    NSImage *rollingGif;
    rollingGif = [NSImage imageNamed:@"loader_large_blue.gif"];
    
    [self.result1 setImage:rollingGif];
    [self.result1 setAnimates: YES];
    
    [self.result2 setImage:rollingGif];
    [self.result2 setAnimates: YES];
    
    [self.result3 setImage:rollingGif];
    [self.result3 setAnimates: YES];
    
    [self.result4 setImage:rollingGif];
    [self.result4 setAnimates: YES];
    
    [self.result5 setImage:rollingGif];
    [self.result5 setAnimates: YES];
    
    [self.result6 setImage:rollingGif];
    [self.result6 setAnimates: YES];
    
    [self.result7 setImage:rollingGif];
    [self.result7 setAnimates: YES];
    
    [self.result8 setImage:rollingGif];
    [self.result8 setAnimates: YES];
    
}

- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];
    
    // Update the view, if already loaded.
}

- (void)userNotificationCenter:(NSUserNotificationCenter *)center didActivateNotification:(NSUserNotification *)notification
{
    if (notification.activationType == NSUserNotificationActivationTypeContentsClicked) {
        [center removeDeliveredNotification:notification];
    }
}



- (BOOL) runProcessAsAdministrator:(NSString*)scriptPath
                     withArguments:(NSArray *)arguments
                            output:(NSString **)output
                  errorDescription:(NSString **)errorDescription {
    
    /*NSString * allArgs = [arguments componentsJoinedByString:@" "];
     NSString * fullScript = [NSString stringWithFormat:@"%@ %@", scriptPath, allArgs];
     
     NSDictionary *errorInfo = [NSDictionary new];
     NSString *script =  [NSString stringWithFormat:@"do shell script \"%@\" with administrator privileges", fullScript];
     
     NSAppleScript *appleScript = [[NSAppleScript new] initWithSource:script];
     NSAppleEventDescriptor * eventResult = [appleScript executeAndReturnError:&errorInfo];
     
     // Check errorInfo
     if (! eventResult)
     {
     // Describe common errors
     *errorDescription = nil;
     if ([errorInfo valueForKey:NSAppleScriptErrorNumber])
     {
     NSNumber * errorNumber = (NSNumber *)[errorInfo valueForKey:NSAppleScriptErrorNumber];
     if ([errorNumber intValue] == -128)
     *errorDescription = @"The administrator password is required to do this.";
     }
     
     // Set error message from provided message
     if (*errorDescription == nil)
     {
     if ([errorInfo valueForKey:NSAppleScriptErrorMessage])
     *errorDescription =  (NSString *)[errorInfo valueForKey:NSAppleScriptErrorMessage];
     }
     
     return NO;
     }
     else
     {
     // Set output to the AppleScript's output
     *output = [eventResult stringValue];
     
     return YES;
     } */
    
    return YES;
}

- (void)comboBoxSelectionDidChange:(NSNotification *)notification{
    int x = [[notification.object objectValueOfSelectedItem] intValue];
    NSLog(@"ComboBox Value Changed to --> %i", x);
}

//Ok button pressed on login window
- (IBAction)handleButtonClick:(id)sender {
    
    NSString *flag;
    // Insert code here to initialize your application
    
    NSString *userid = [[NSUserDefaults standardUserDefaults]
                        stringForKey:@"userid"];
    NSString *pass = [[NSUserDefaults standardUserDefaults]
                      stringForKey:@"password"];
    
    NSLog(@"success!");
    NSStoryboard *storyBoard = [NSStoryboard storyboardWithName:@"Main" bundle:nil];
    // instantiate your window controller
    myController = [storyBoard instantiateControllerWithIdentifier:@"authenticationWindow"];
    if(userid == nil && pass == nil)
    {
        [[NSApplication sharedApplication] runModalForWindow:myController.window];
        
    }
    
    // show the window
    // [myController dismissController:nil];
    //[myController showWindow:nil];
    
    NSString *adminName = userid;
    NSString *adminPass = pass;
    NSString *comboValue;
    NSLog(@"proceed!");
    
    BOOL isAdmin = [self authenticatePassword:[adminPass cStringUsingEncoding:NSUTF8StringEncoding] adminName:[adminName cStringUsingEncoding:NSUTF8StringEncoding]];
    
    if(isAdmin)
        
    {
        //close login dialog if user is admin
        
        //NSAlert* alert = [NSAlert alertWithMessageText:@"Current user is Admin" defaultButton:nil alternateButton:nil otherButton:nil informativeTextWithFormat:@""];
        //[alert runModal];
        
        [self startProgressImage];
        
        //Text filed empty check
        comboValue = [self.comboBox objectValueOfSelectedItem];
        
        //[self.comboBox objectValue];
        if ( !(comboValue && comboValue.length > 0))
        {
            NSAlert* msgBox = [[NSAlert alloc] init] ;
            [msgBox setMessageText: @"Oops! Did you forget to select a Location from dropdown?"];
            [msgBox addButtonWithTitle: @"OK"];
            [msgBox runModal];
            
        }
        else if(!(self.machineName.stringValue && self.machineName.stringValue.length > 0))
        {
            [self.machineName becomeFirstResponder];
            NSAlert* msgBox = [[NSAlert alloc] init] ;
            [msgBox setMessageText: @"Machine name should not be blank."];
            [msgBox addButtonWithTitle: @"OK"];
            [msgBox runModal];
            
        }
        else{
            
            //Script :1 Execution starts
            /* [self.progress1 setIndeterminate:YES];
             [self.progress1 setUsesThreadedAnimation:YES];
             [self.progress1 startAnimation:nil]; */
            
            NSDictionary *error = [NSDictionary new];
            NSImage *fail;
            //input from text field
            
            NSString *machineName = self.machineName.stringValue;
            NSString * text = [NSString stringWithFormat:@"%@ %@", @"Machine Name is set to ", machineName];
            NSString * fullScript = [NSString stringWithFormat:@"%@ %@", @"/usr/local/EYM/EnrollmentScript.sh", machineName];
            
            NSString *script =  [NSString stringWithFormat:@"do shell script \"%@\" user name \"%@\" password \"%@\" with administrator privileges", fullScript,adminName,adminPass];
            //NSString *script =  [NSString stringWithFormat:@"do shell script \/bin/tcsh my-command-file-path""%@\" with administrator privileges", fullScript];
            
            
            NSAppleScript *appleScript = [[NSAppleScript new] initWithSource:script];
            
            if ([appleScript executeAndReturnError:&error]) {
                NSLog(@"success!");
                flag = @"1";
                NSImage *sucess = [NSImage imageNamed:@"checkmark.png"];
                [self.progress1 setHidden:YES];
                [self.result1 setImage:sucess];
                self.label1.stringValue = text;
                
            } else {
                NSLog(@"failure!");
                
                fail = [NSImage imageNamed:@"cross.png"];
                [self.progress1 setHidden:YES];
                [self.result1 setImage:fail];
                
            }
            
            //script: 1 execution stopping done
            
            
            //Script :2 Execution starting here
            /* [self.progress2 setIndeterminate:YES];
             [self.progress2 setUsesThreadedAnimation:YES];
             [self.progress2 startAnimation:nil]; */
            
            /**Script-2 Execution starts here */
            //NSString *comboValue = [self.comboBox objectValueOfSelectedItem];
            
            NSString * fullScript2 = [NSString stringWithFormat:@"%@ %@", @"/usr/local/EYM/step2.sh", comboValue];
            NSString *script2 =  [NSString stringWithFormat:@"do shell script \"%@\" user name \"%@\" password \"%@\" with administrator privileges", fullScript2,adminName,adminPass];
            
            NSAppleScript *appleScript2 = [[NSAppleScript new] initWithSource:script2];
            NSDictionary *error1 = [NSDictionary new];
            if ([appleScript2 executeAndReturnError:&error1]) {
                
                NSLog(@" Script 1 success!");
                NSImage *sucess;
                flag = [NSString stringWithFormat: @"02 %@", flag];
                [self.progress2 setHidden:YES];
                sucess = [NSImage imageNamed:@"checkmark.png"];
                [self.result2 setImage:sucess];
                
            } else {
                NSLog(@" Script 1 Fail!");
                NSImage *fail;
                fail = [NSImage imageNamed:@"cross.png"];
                [self.progress2 setHidden:YES];
                [self.result2 setImage:fail];
                
            }
            
            //Script :2 Execution ending here
            
            
            //Script :3 Execution starting here
            //[self.progress3 setIndeterminate:YES];
            //[self.progress3 setUsesThreadedAnimation:YES];
            //[self.progress3 startAnimation:nil];
            
            
            NSString * fullScript3 = [NSString stringWithFormat:@"%@", @"/usr/local/EYM/step3.sh"];
            NSString *script3 =  [NSString stringWithFormat:@"do shell script \"%@\" user name \"%@\" password \"%@\" with administrator privileges", fullScript3,adminName,adminPass];
            
            //appleScript = [[NSAppleScript new] initWithSource:script3];
            NSAppleScript *appleScript3 = [[NSAppleScript new] initWithSource:script3];
            NSDictionary *error2 = [NSDictionary new];
            if ([appleScript3 executeAndReturnError:&error2]) {
                
                NSLog(@" Script 3 success!");
                NSImage *sucess;
                flag = [NSString stringWithFormat: @"03 %@", flag];
                [self.progress3 setHidden:YES];
                sucess = [NSImage imageNamed:@"checkmark.png"];
                [self.result3 setImage:sucess];
                
                
            } else {
                NSLog(@" Script 3 Fail!");
                NSImage *fail;
                fail = [NSImage imageNamed:@"cross.png"];
                [self.progress3 setHidden:YES];
                [self.result3 setImage:fail];
                
            }
            
            //Script :3 Execution ending here
            
            
            //Script :4 Execution starting here
            //[self.progress4 setIndeterminate:YES];
            //[self.progress4 setUsesThreadedAnimation:YES];
            //[self.progress4 startAnimation:nil];
            
            
            
            NSString * fullScript4 = [NSString stringWithFormat:@"%@", @"/usr/local/EYM/step4.sh"];
            
            NSString *script4 =  [NSString stringWithFormat:@"do shell script \"%@\" user name \"%@\" password \"%@\" with administrator privileges", fullScript4,adminName,adminPass];
            
            NSAppleScript *appleScript4 = [[NSAppleScript new] initWithSource:script4];
            //appleScript = [[NSAppleScript new] initWithSource:script4];
            NSDictionary *error3 = [NSDictionary new];
            if ([appleScript4 executeAndReturnError:&error3]) {
                
                NSLog(@" Script 4 success!");
                NSImage *sucess;
                flag = [NSString stringWithFormat: @"04 %@", flag];
                [self.progress4 setHidden:YES];
                sucess = [NSImage imageNamed:@"checkmark.png"];
                [self.result4 setImage:sucess];
                
                
            } else {
                NSLog(@" Script 4 Fail!");
                NSImage *fail;
                fail = [NSImage imageNamed:@"cross.png"];
                [self.progress4 setHidden:YES];
                [self.result4 setImage:fail];
                
            }
            
            //Script :4 Execution ending here
            
            
            
            //@Script :5 Execution starting here
            //[self.progress5 setIndeterminate:YES];
            //[self.progress5 setUsesThreadedAnimation:YES];
            //[self.progress5 startAnimation:nil];
            
            
            
            NSString * fullScript5 = [NSString stringWithFormat:@"%@", @"/usr/local/EYM/step5.sh"];
            NSString *script5 =  [NSString stringWithFormat:@"do shell script \"%@\" user name \"%@\" password \"%@\" with administrator privileges", fullScript5,adminName,adminPass];;
            
            NSAppleScript *appleScript5 = [[NSAppleScript new] initWithSource:script5];
            //appleScript = [[NSAppleScript new] initWithSource:script5];
            NSDictionary *error4 = [NSDictionary new];
            if ([appleScript5 executeAndReturnError:&error4]) {
                
                NSLog(@" Script 5 success!");
                NSImage *sucess;
                flag = [NSString stringWithFormat: @"05 %@", flag];
                [self.progress5 setHidden:YES];
                sucess = [NSImage imageNamed:@"checkmark.png"];
                [self.result5 setImage:sucess];
                
                
            } else {
                NSLog(@" Script 5 Fail!");
                NSImage *fail;
                fail = [NSImage imageNamed:@"cross.png"];
                [self.progress5 setHidden:YES];
                [self.result5 setImage:fail];
                
            }
            
            //Script :5 Execution ending here
            
            
            //@Script :6 Execution starting here
            //[self.progress6 setIndeterminate:YES];
            //[self.progress6 setUsesThreadedAnimation:YES];
            //[self.progress6 startAnimation:nil];
            
            
            
            NSString * fullScript6 = [NSString stringWithFormat:@"%@", @"/usr/local/EYM/step6.sh"];
            NSString *script6 =  [NSString stringWithFormat:@"do shell script \"%@\" user name \"%@\" password \"%@\" with administrator privileges", fullScript6,adminName,adminPass];;
            
            NSAppleScript *appleScript6 = [[NSAppleScript new] initWithSource:script6];
            //appleScript = [[NSAppleScript new] initWithSource:script6];
            NSDictionary *error5 = [NSDictionary new];
            if ([appleScript6 executeAndReturnError:&error5]) {
                
                NSLog(@" Script 6 success!");
                NSImage *sucess;
                flag = [NSString stringWithFormat: @"06 %@", flag];
                [self.progress6 setHidden:YES];
                sucess = [NSImage imageNamed:@"checkmark.png"];
                [self.result6 setImage:sucess];
                
                
            } else {
                NSLog(@" Script 6 Fail!");
                NSImage *fail;
                fail = [NSImage imageNamed:@"cross.png"];
                [self.progress6 setHidden:YES];
                [self.result6 setImage:fail];
                
            }
            
            //Script :6 Execution ending here
            
            //@Script :7 Execution starting here
            //[self.progress7 setIndeterminate:YES];
            //[self.progress7 setUsesThreadedAnimation:YES];
            //[self.progress7 startAnimation:nil];
            
            
            
            NSString * fullScript7 = [NSString stringWithFormat:@"%@", @"/usr/local/EYM/step7.sh"];
            NSString *script7 =  [NSString stringWithFormat:@"do shell script \"%@\" user name \"%@\" password \"%@\" with administrator privileges", fullScript7,adminName,adminPass];
            
            NSAppleScript *appleScript7 = [[NSAppleScript new] initWithSource:script7];
            //appleScript = [[NSAppleScript new] initWithSource:script7];
            NSDictionary *error6 = [NSDictionary new];
            if ([appleScript7 executeAndReturnError:&error6]) {
                
                NSLog(@" Script 7 success!");
                NSImage *sucess;
                flag = [NSString stringWithFormat: @"07 %@", flag];
                [self.progress7 setHidden:YES];
                sucess = [NSImage imageNamed:@"checkmark.png"];
                [self.result7 setImage:sucess];
                
                
            } else {
                NSLog(@" Script 7 Fail!");
                NSImage *fail;
                fail = [NSImage imageNamed:@"cross.png"];
                [self.progress7 setHidden:YES];
                [self.result7 setImage:fail];
                
            }
            
            //Script :7 Execution ending here
            
            
            //@Script :8 Execution starting here
            //[self.progress8 setIndeterminate:YES];
            // [self.progress8 setUsesThreadedAnimation:YES];
            //[self.progress8 startAnimation:nil];
            
            
            NSString * fullScript8 = [NSString stringWithFormat:@"%@", @"/usr/local/EYM/step8.sh"];
            NSString *script8 =  [NSString stringWithFormat:@"do shell script \"%@\" user name \"%@\" password \"%@\" with administrator privileges", fullScript8,adminName,adminPass];;
            
            NSAppleScript *appleScript8 = [[NSAppleScript new] initWithSource:script8];
            //appleScript = [[NSAppleScript new] initWithSource:script8];
            NSDictionary *error7 = [NSDictionary new];
            if ([appleScript8 executeAndReturnError:&error7]) {
                
                NSLog(@" Script 8 success!");
                NSImage *sucess;
                flag = [NSString stringWithFormat: @"08 %@", flag];
                [self.progress8 setHidden:YES];
                sucess = [NSImage imageNamed:@"checkmark.png"];
                [self.result8 setImage:sucess];
                
                
            } else {
                NSLog(@" Script 8 Fail!");
                NSImage *fail;
                fail = [NSImage imageNamed:@"cross.png"];
                [self.progress8 setHidden:YES];
                [self.result8 setImage:fail];
            }
            
            //Script :8 Execution ending here
            
            if ([flag isEqualToString:@"08 07 06 05 04 03 02 01"]){
                //Show the NSUserNotification as popup
                NSUserNotification *notification = [[NSUserNotification alloc] init];
                [notification setTitle: @"Message"];
                [notification setSubtitle: @""];
                [notification setInformativeText: @"Enrollment Done"];
                
                [notification setHasActionButton: YES];
                //[notification setActionButtonTitle: @"Action Button"];
                //[notification setOtherButtonTitle: @"Other Button"];
                
                [notification setSoundName: NSUserNotificationDefaultSoundName];
                
                [notification setDeliveryDate: [NSDate dateWithTimeIntervalSinceNow: 1]];
                //[[NSUserNotificationCenter defaultUserNotificationCenter] scheduleNotification: notification];
                [[NSUserNotificationCenter defaultUserNotificationCenter] deliverNotification:notification];
                //[self.loginView setHidden:true];
                
                
            }
            
        }
        
    }
    
    else
        
    {
        
        NSAlert* alert = [NSAlert alertWithMessageText:@"Current user is not Admin or credentials are not correct" defaultButton:nil alternateButton:nil otherButton:nil informativeTextWithFormat:@""];
        
        
        [[NSUserDefaults standardUserDefaults] setObject:nil forKey:@"userid"];
        [[NSUserDefaults standardUserDefaults] synchronize];
        
        [[NSUserDefaults standardUserDefaults] setObject:nil forKey:@"password"];
        [[NSUserDefaults standardUserDefaults] synchronize];
        
        
        
        [alert runModal];
        
    }
    
    
    /*
     
     [self startProgressImage];
     
     //Text filed empty check
     NSString *comboValue = [self.comboBox objectValueOfSelectedItem];
     if (!(self.machineName.stringValue && self.machineName.stringValue.length > 0))
     {
     [self.machineName becomeFirstResponder];
     NSAlert* msgBox = [[NSAlert alloc] init] ;
     [msgBox setMessageText: @"Machine name should not be blank."];
     [msgBox addButtonWithTitle: @"OK"];
     [msgBox runModal];
     
     
     }
     else if( !(comboValue && comboValue.length > 0))
     {
     NSAlert* msgBox = [[NSAlert alloc] init] ;
     [msgBox setMessageText: @"Oops! Did you forget to select a Location from dropdown?"];
     [msgBox addButtonWithTitle: @"OK"];
     [msgBox runModal];
     
     }
     else{
     
     //prompt input window for admin id /password
     /*NSAlert *alert = [[NSAlert alloc] init];
     [alert setMessageText:@"Please enter Admin ID. For brand new Macs, the very first account is always Admin."];
     [alert addButtonWithTitle:@"OK"];
     [alert addButtonWithTitle:@"Cancel"];
     
     NSTextField *inputId = [[NSTextField alloc] initWithFrame:NSMakeRect(0, 0, 200, 24)];
     [inputId setStringValue:@""];
     [alert setAccessoryView:inputId]; */
    
    
    
    /* NSInteger button = [alert runModal];
     if (button == NSAlertFirstButtonReturn) { */
    if (true) {
        /*adminName = [inputId stringValue];
         NSLog(@"OK pressed!");
         
         NSAlert *alert1 = [[NSAlert alloc] init];
         [alert1 setMessageText:@"Please enter Admin Password."];
         [alert1 addButtonWithTitle:@"OK"];
         [alert1 addButtonWithTitle:@"Cancel"];
         
         NSSecureTextField *inputPass = [[NSSecureTextField alloc] initWithFrame:NSMakeRect(0, 0, 200, 24)];
         [inputPass setStringValue:@""];
         [alert1 setAccessoryView:inputPass];
         
         NSInteger button1 = [alert1 runModal];
         if (button1 == NSAlertFirstButtonReturn) {
         if (true) {
         adminPass = self.password;
         adminName = self.userid;
         
         
         //Script :1 Execution starts
         /* [self.progress1 setIndeterminate:YES];
         [self.progress1 setUsesThreadedAnimation:YES];
         [self.progress1 startAnimation:nil]; */
        
        /*    NSDictionary *error = [NSDictionary new];
         NSImage *fail;
         //input from text field
         NSString *machineName = self.machineName.stringValue;
         NSString * text = [NSString stringWithFormat:@"%@ %@", @"Machine Name is set to ", machineName];
         NSString * fullScript = [NSString stringWithFormat:@"%@ %@", @"/usr/local/EYM/EnrollmentScript.sh", machineName];
         
         NSString *script =  [NSString stringWithFormat:@"do shell script \"%@\" user name \"%@\" password \"%@\" with administrator privileges", fullScript,adminName,adminPass];
         //NSString *script =  [NSString stringWithFormat:@"do shell script \/bin/tcsh my-command-file-path""%@\" with administrator privileges", fullScript];
         
         
         NSAppleScript *appleScript = [[NSAppleScript new] initWithSource:script];
         
         
         if ([appleScript executeAndReturnError:&error]) {
         NSLog(@"success!");
         
         NSImage *sucess = [NSImage imageNamed:@"checkmark.png"];
         [self.progress1 setHidden:YES];
         [self.result1 setImage:sucess];
         self.label1.stringValue = text;
         
         
         } else {
         NSLog(@"failure!");
         
         fail = [NSImage imageNamed:@"cross.png"];
         [self.progress1 setHidden:YES];
         [self.result1 setImage:fail];
         
         }
         
         //script: 1 execution stopping done
         
         
         //Script :2 Execution starting here
         /* [self.progress2 setIndeterminate:YES];
         [self.progress2 setUsesThreadedAnimation:YES];
         [self.progress2 startAnimation:nil]; */
        
        /**Script-2 Execution starts here */
        /*         NSString *comboValue = [self.comboBox objectValueOfSelectedItem];
         
         NSString * fullScript2 = [NSString stringWithFormat:@"%@ %@", @"/usr/local/EYM/step2.sh", comboValue];
         NSString *script2 =  [NSString stringWithFormat:@"do shell script \"%@\" user name \"%@\" password \"%@\" with administrator privileges", fullScript2,adminName,adminPass];
         
         NSAppleScript *appleScript2 = [[NSAppleScript new] initWithSource:script2];
         NSDictionary *error1 = [NSDictionary new];
         if ([appleScript2 executeAndReturnError:&error1]) {
         
         NSLog(@" Script 1 success!");
         NSImage *sucess;
         [self.progress2 setHidden:YES];
         sucess = [NSImage imageNamed:@"checkmark.png"];
         [self.result2 setImage:sucess];
         
         
         } else {
         NSLog(@" Script 1 Fail!");
         NSImage *fail;
         fail = [NSImage imageNamed:@"cross.png"];
         [self.progress2 setHidden:YES];
         [self.result2 setImage:fail];
         
         }
         
         //Script :2 Execution ending here
         
         
         //Script :3 Execution starting here
         //[self.progress3 setIndeterminate:YES];
         //[self.progress3 setUsesThreadedAnimation:YES];
         //[self.progress3 startAnimation:nil];
         
         
         NSString * fullScript3 = [NSString stringWithFormat:@"%@", @"/usr/local/EYM/step3.sh"];
         NSString *script3 =  [NSString stringWithFormat:@"do shell script \"%@\" user name \"%@\" password \"%@\" with administrator privileges", fullScript3,adminName,adminPass];
         
         //appleScript = [[NSAppleScript new] initWithSource:script3];
         NSAppleScript *appleScript3 = [[NSAppleScript new] initWithSource:script3];
         NSDictionary *error2 = [NSDictionary new];
         if ([appleScript3 executeAndReturnError:&error2]) {
         
         NSLog(@" Script 3 success!");
         NSImage *sucess;
         [self.progress3 setHidden:YES];
         sucess = [NSImage imageNamed:@"checkmark.png"];
         [self.result3 setImage:sucess];
         
         
         } else {
         NSLog(@" Script 3 Fail!");
         NSImage *fail;
         fail = [NSImage imageNamed:@"cross.png"];
         [self.progress3 setHidden:YES];
         [self.result3 setImage:fail];
         
         }
         
         //Script :3 Execution ending here
         
         
         //Script :4 Execution starting here
         //[self.progress4 setIndeterminate:YES];
         //[self.progress4 setUsesThreadedAnimation:YES];
         //[self.progress4 startAnimation:nil];
         
         
         
         NSString * fullScript4 = [NSString stringWithFormat:@"%@", @"/usr/local/EYM/step4.sh"];
         
         NSString *script4 =  [NSString stringWithFormat:@"do shell script \"%@\" user name \"%@\" password \"%@\" with administrator privileges", fullScript4,adminName,adminPass];
         
         NSAppleScript *appleScript4 = [[NSAppleScript new] initWithSource:script4];
         //appleScript = [[NSAppleScript new] initWithSource:script4];
         NSDictionary *error3 = [NSDictionary new];
         if ([appleScript4 executeAndReturnError:&error3]) {
         
         NSLog(@" Script 4 success!");
         NSImage *sucess;
         [self.progress4 setHidden:YES];
         sucess = [NSImage imageNamed:@"checkmark.png"];
         [self.result4 setImage:sucess];
         
         
         } else {
         NSLog(@" Script 4 Fail!");
         NSImage *fail;
         fail = [NSImage imageNamed:@"cross.png"];
         [self.progress4 setHidden:YES];
         [self.result4 setImage:fail];
         
         }
         
         //Script :4 Execution ending here
         
         
         
         //@Script :5 Execution starting here
         //[self.progress5 setIndeterminate:YES];
         //[self.progress5 setUsesThreadedAnimation:YES];
         //[self.progress5 startAnimation:nil];
         
         
         
         NSString * fullScript5 = [NSString stringWithFormat:@"%@", @"/usr/local/EYM/step5.sh"];
         NSString *script5 =  [NSString stringWithFormat:@"do shell script \"%@\" user name \"%@\" password \"%@\" with administrator privileges", fullScript5,adminName,adminPass];;
         
         NSAppleScript *appleScript5 = [[NSAppleScript new] initWithSource:script5];
         //appleScript = [[NSAppleScript new] initWithSource:script5];
         NSDictionary *error4 = [NSDictionary new];
         if ([appleScript5 executeAndReturnError:&error4]) {
         
         NSLog(@" Script 5 success!");
         NSImage *sucess;
         [self.progress5 setHidden:YES];
         sucess = [NSImage imageNamed:@"checkmark.png"];
         [self.result5 setImage:sucess];
         
         
         } else {
         NSLog(@" Script 5 Fail!");
         NSImage *fail;
         fail = [NSImage imageNamed:@"cross.png"];
         [self.progress5 setHidden:YES];
         [self.result5 setImage:fail];
         
         }
         
         //Script :5 Execution ending here
         
         
         //@Script :6 Execution starting here
         //[self.progress6 setIndeterminate:YES];
         //[self.progress6 setUsesThreadedAnimation:YES];
         //[self.progress6 startAnimation:nil];
         
         
         
         NSString * fullScript6 = [NSString stringWithFormat:@"%@", @"/usr/local/EYM/step6.sh"];
         NSString *script6 =  [NSString stringWithFormat:@"do shell script \"%@\" user name \"%@\" password \"%@\" with administrator privileges", fullScript6,adminName,adminPass];;
         
         NSAppleScript *appleScript6 = [[NSAppleScript new] initWithSource:script6];
         //appleScript = [[NSAppleScript new] initWithSource:script6];
         NSDictionary *error5 = [NSDictionary new];
         if ([appleScript6 executeAndReturnError:&error5]) {
         
         NSLog(@" Script 6 success!");
         NSImage *sucess;
         [self.progress6 setHidden:YES];
         sucess = [NSImage imageNamed:@"checkmark.png"];
         [self.result6 setImage:sucess];
         
         
         } else {
         NSLog(@" Script 6 Fail!");
         NSImage *fail;
         fail = [NSImage imageNamed:@"cross.png"];
         [self.progress6 setHidden:YES];
         [self.result6 setImage:fail];
         
         }
         
         //Script :6 Execution ending here
         
         //@Script :7 Execution starting here
         //[self.progress7 setIndeterminate:YES];
         //[self.progress7 setUsesThreadedAnimation:YES];
         //[self.progress7 startAnimation:nil];
         
         
         
         NSString * fullScript7 = [NSString stringWithFormat:@"%@", @"/usr/local/EYM/step7.sh"];
         NSString *script7 =  [NSString stringWithFormat:@"do shell script \"%@\" user name \"%@\" password \"%@\" with administrator privileges", fullScript7,adminName,adminPass];
         
         NSAppleScript *appleScript7 = [[NSAppleScript new] initWithSource:script7];
         //appleScript = [[NSAppleScript new] initWithSource:script7];
         NSDictionary *error6 = [NSDictionary new];
         if ([appleScript7 executeAndReturnError:&error6]) {
         
         NSLog(@" Script 7 success!");
         NSImage *sucess;
         [self.progress7 setHidden:YES];
         sucess = [NSImage imageNamed:@"checkmark.png"];
         [self.result7 setImage:sucess];
         
         
         } else {
         NSLog(@" Script 7 Fail!");
         NSImage *fail;
         fail = [NSImage imageNamed:@"cross.png"];
         [self.progress7 setHidden:YES];
         [self.result7 setImage:fail];
         
         }
         
         //Script :7 Execution ending here
         
         
         //@Script :8 Execution starting here
         //[self.progress8 setIndeterminate:YES];
         // [self.progress8 setUsesThreadedAnimation:YES];
         //[self.progress8 startAnimation:nil];
         
         
         NSString * fullScript8 = [NSString stringWithFormat:@"%@", @"/usr/local/EYM/step8.sh"];
         NSString *script8 =  [NSString stringWithFormat:@"do shell script \"%@\" user name \"%@\" password \"%@\" with administrator privileges", fullScript8,adminName,adminPass];;
         
         NSAppleScript *appleScript8 = [[NSAppleScript new] initWithSource:script8];
         //appleScript = [[NSAppleScript new] initWithSource:script8];
         NSDictionary *error7 = [NSDictionary new];
         if ([appleScript8 executeAndReturnError:&error7]) {
         
         NSLog(@" Script 8 success!");
         NSImage *sucess;
         [self.progress8 setHidden:YES];
         sucess = [NSImage imageNamed:@"checkmark.png"];
         [self.result8 setImage:sucess];
         
         
         } else {
         NSLog(@" Script 8 Fail!");
         NSImage *fail;
         fail = [NSImage imageNamed:@"cross.png"];
         [self.progress8 setHidden:YES];
         [self.result8 setImage:fail];
         
         }
         
         //Script :8 Execution ending here
         
         
         }
         
         
         } else {
         
         NSLog(@"Cancel!");
         
         } */
        
    }
}

// This function will return YES only if the user is Admin and the Username and Password are correct.

//Correspondingly, the function will return NO if either

//1. user is not Admin or

//2. Password is not matching Username and vice-versa

-(BOOL)authenticatePassword:(char *)password adminName:(char *)userName

{
    
    BOOL retValue = NO;
    
    AuthorizationRef authorization;
    
    OSStatus status,status1;
    
    AuthorizationFlags flag;
    
    AuthorizationItem items[2];
    
    items[0].name = kAuthorizationEnvironmentPassword;
    
    items[0].value = password;
    
    items[0].valueLength = strlen(password);
    
    items[0].flags = 0;
    
    items[1].name = kAuthorizationEnvironmentUsername;
    
    items[1].value = userName;
    
    items[1].valueLength = strlen(userName);
    
    items[1].flags = 0;
    
    
    
    AuthorizationItemSet itemSet = {2,items};
    
    status = AuthorizationCreate(NULL, &itemSet, kAuthorizationFlagDefaults, &authorization);
    
    if(status == errAuthorizationSuccess)
        
    {
        
        AuthorizationRights rights = {2,&items};
        
        AuthorizationEnvironment kEnviroment = {2, items};
        
        flag = kAuthorizationFlagDefaults| kAuthorizationFlagExtendRights;
        
        status1 = AuthorizationCopyRights(authorization, &rights, &kEnviroment, flag, NULL);
        
        if(status1 == errAuthorizationSuccess)
            
            retValue = YES;
        
    }
    
    return retValue;
    
}

-(IBAction)check:(id)sender

{
    
    
    
}

@end





