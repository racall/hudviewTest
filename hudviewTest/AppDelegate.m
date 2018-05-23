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
    /** 使用 lockFocus 的方式进行图片绘制渲染(通常时离屏的),有可能会产生模糊或者2x的效果 , 这里在上下文中是以像素为绘制单位的 */
    NSImage *img=[[NSImage alloc] initWithSize:NSMakeSize(NSWidth(view.frame), NSHeight(view.frame))];
    [img lockFocus];
    NSBezierPath *path=[NSBezierPath bezierPathWithRect:view.frame];
    [[[NSColor grayColor] colorWithAlphaComponent:0.4] set];
    [path fill];
    [img unlockFocus];
    
    /** Apple 推荐使用 imageWithSize:flipped:drawingHandler: , block中的绘制代码会根据不同屏幕解析度时会重新调用, 这里的绘制单位是point, 
     使用这个方法不会产生清晰度问题
     仅需要注意block的执行线程: [NSImage imageWithSize...]在哪个线程,block被调用时,就在哪个线程运行
     * block的代码是延时调用的,仅当图片被绘制的显示的时候才会调用block中的代码.
     
     NSImage *img = [NSImage imageWithSize:NSMakeSize(NSWidth(view.frame), NSHeight(view.frame)) flipped:YES drawingHandler:^BOOL(NSRect dstRect) {
        NSBezierPath *path=[NSBezierPath bezierPathWithRect:dstRect];
        [[[NSColor grayColor] colorWithAlphaComponent:0.4] set];
        [path fill];
        return YES;   // yes表示绘制完成
    }];
    */
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
