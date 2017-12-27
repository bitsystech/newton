//
//  loginController.h
//  Newton
//
//  Created by Laeeq Humam for H&M on 28/04/17.
//  Copyright (c) 2017 H&M. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface loginController : NSViewController

@property (nonatomic, strong) IBOutlet NSTextField *userName;
@property (nonatomic, strong) IBOutlet NSTextField *password;

@property (nonatomic, weak) IBOutlet NSButton *cancel;
@property (nonatomic, weak) IBOutlet NSButton *submit;

@property (nonatomic, strong) IBOutlet NSTextField *machine;
@property (weak) IBOutlet NSView *loginView;

@end


