//
//  ViewController.h
//  Newton
//
//  Created by Laeeq Humam for H&M on 28/04/17.
//  Copyright (c) 2017 H&M. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <Foundation/Foundation.h>



@interface ViewController : NSViewController 
@property (nonatomic, strong) IBOutlet NSProgressIndicator *progress1;
@property (nonatomic, strong) IBOutlet NSProgressIndicator *progress2;
@property (nonatomic, strong) IBOutlet NSProgressIndicator *progress3;
@property (nonatomic, strong) IBOutlet NSProgressIndicator *progress4;
@property (nonatomic, strong) IBOutlet NSProgressIndicator *progress5;
@property (nonatomic, strong) IBOutlet NSProgressIndicator *progress6;
@property (nonatomic, strong) IBOutlet NSProgressIndicator *progress7;
@property (nonatomic, strong) IBOutlet NSProgressIndicator *progress8;
@property (nonatomic, weak) IBOutlet NSButton *start;
@property (nonatomic, strong) IBOutlet NSImageView *result1;
@property (nonatomic, weak) IBOutlet NSImageView *result2;
@property (nonatomic, weak) IBOutlet NSImageView *result3;
@property (nonatomic, weak) IBOutlet NSImageView *result4;
@property (nonatomic, weak) IBOutlet NSImageView *result5;
@property (nonatomic, weak) IBOutlet NSImageView *result6;
@property (nonatomic, weak) IBOutlet NSImageView *result7;
@property (nonatomic, weak) IBOutlet NSImageView *result8;

@property (nonatomic, weak) IBOutlet NSTextField *machineName;
//@property (assign) NSMenuItem *menu;

@property (nonatomic, strong) IBOutlet NSTextField *label1;
@property (nonatomic, weak) IBOutlet NSComboBox *comboBox;

@property (strong, nonatomic) NSString *userid;
@property (strong, nonatomic) NSString *password;

@property (nonatomic, strong) IBOutlet NSTextField *userName;
@property (nonatomic, strong) IBOutlet NSTextField *pass;

@property (nonatomic, weak) IBOutlet NSButton *cancel;
@property (nonatomic, weak) IBOutlet NSButton *submit;

@property (nonatomic, weak) IBOutlet NSWindowController *windowControl;
@property (weak) IBOutlet NSView *loginView;


@end


