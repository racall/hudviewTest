//
//  TipsView.m
//  hudviewTest
//
//  Created by MiniCreo on 5/22/18.
//  Copyright (c) 2018 MiniCreo. All rights reserved.
//

#import "TipsView.h"

@implementation TipsView

- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
    [[NSColor whiteColor] set];
    NSRectFill(dirtyRect);
    // Drawing code here.
}

-(void)awakeFromNib{
    [super awakeFromNib];
    [self setWantsLayer:YES];
    [self.layer setBackgroundColor:[NSColor clearColor].CGColor];
    [self.layer setCornerRadius:4.0f];
}

-(BOOL)mouseDownCanMoveWindow{
    return YES;
}


@end
