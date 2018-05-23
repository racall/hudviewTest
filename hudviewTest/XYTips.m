//
//  XYTips.m
//  hudviewTest
//
//  Created by MiniCreo on 5/22/18.
//  Copyright (c) 2018 MiniCreo. All rights reserved.
//

#import "XYTips.h"
#import "BGView.h"
#import "TipsView.h"
@implementation XYTips

-(void)showTip:(NSViewController*)aViewController FromView:(NSView*)view{
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
    
    
    TipsView *childView=(TipsView*)aViewController.view;
    CGFloat x=(NSWidth(view.frame)-NSWidth(childView.frame))/2;
    CGFloat y=(NSHeight(view.frame)-NSHeight(childView.frame))/2;
    [childView setFrame:NSMakeRect(x, y, NSWidth(childView.frame), NSHeight(childView.frame))];
    [bg addSubview:childView];
    
    [bg setHandleDown:^(NSEvent *event){
        NSPoint clickLocation = [bg convertPoint:[event locationInWindow] fromView:nil];
        if (!NSMouseInRect(clickLocation, childView.frame, bg.flipped)) {
            [bg removeFromSuperview];
            [childView removeFromSuperview];
        }
    }];
}

@end
