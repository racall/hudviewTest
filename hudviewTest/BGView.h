//
//  BGView.h
//  hudviewTest
//
//  Created by MiniCreo on 5/22/18.
//  Copyright (c) 2018 MiniCreo. All rights reserved.
//

#import <Cocoa/Cocoa.h>
typedef void(^HandleDown)(NSEvent *);
@interface BGView : NSView

@property (nonatomic,readwrite,retain) NSImage *bgImage;
@property (nonatomic,readwrite,copy) HandleDown handleDown;
@end
