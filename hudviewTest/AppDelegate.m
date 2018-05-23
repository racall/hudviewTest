//
//  AppDelegate.m
//  hudviewTest
//
//  Created by MiniCreo on 5/22/18.
//  Copyright (c) 2018 MiniCreo. All rights reserved.
//

#import "AppDelegate.h"
#import "testViewController.h"
//#import "HUDView.h"
#import "BGView.h"
#import "TipsView.h"
#import "XYTips.h"
@interface AppDelegate ()

@property (assign) IBOutlet NSWindow *window;
@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
    [_window setTitlebarAppearsTransparent:YES];
    [_window setMovableByWindowBackground:YES];
}

- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
    //    XYTips *tip=[[XYTips alloc] init];
    //[tip showTip:testVC FromView:_window.contentView];
    //[HUDView showViewController:testVC withFromView:_window.contentView];
}

- (IBAction)test:(NSButton *)sender {
    testViewController *testVC=[[testViewController alloc] init];

    NSView *view=_window.contentView;
    NSImage *img=[[NSImage alloc] initWithSize:NSMakeSize(NSWidth(view.frame), NSHeight(view.frame))];
    [img lockFocus];
    NSBezierPath *path=[NSBezierPath bezierPathWithRect:view.frame];
    [[[NSColor grayColor] colorWithAlphaComponent:0.4] set];
    [path fill];
    [img unlockFocus];
    
    BGView *bg=[[BGView alloc] init];
    [bg setFrame:view.frame];
    [bg setBgImage:img];
    [view addSubview:bg];
    
    TipsView *childView=(TipsView*)testVC.view;
    CGFloat x=(NSWidth(view.frame)-NSWidth(childView.frame))/2;
    CGFloat y=(NSHeight(view.frame)-NSHeight(childView.frame))/2;
    [childView setFrame:NSMakeRect(x, y, NSWidth(childView.frame), NSHeight(childView.frame))];
    [bg addSubview:childView];
}

@end
