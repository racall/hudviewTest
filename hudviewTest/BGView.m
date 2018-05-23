//
//  BGView.m
//  hudviewTest
//
//  Created by MiniCreo on 5/22/18.
//  Copyright (c) 2018 MiniCreo. All rights reserved.
//

#import "BGView.h"

@implementation BGView

- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
    if (_bgImage) {
        NSRect imageRect = NSZeroRect;
        imageRect.size=_bgImage.size;
        [_bgImage drawInRect:dirtyRect fromRect:imageRect operation:NSCompositeSourceOver fraction:1.0 respectFlipped:YES hints:nil];
    }
    // Drawing code here.
}

-(void)setBgImage:(NSImage *)bgImage{
    if (_bgImage!=bgImage) {
#if !__has_feature(objc_arc)
        if(_bgImage){[_bgImage release];}
        if(bgImage){[bgImage retain];}
#endif
        _bgImage=bgImage;
        [self setNeedsDisplay:YES];
    }
}

-(void)mouseDown:(NSEvent *)theEvent{
    if (self.handleDown) {
        self.handleDown(theEvent);
    }
}

@end
