//
//  testViewController.m
//  hudviewTest
//
//  Created by MiniCreo on 5/22/18.
//  Copyright (c) 2018 MiniCreo. All rights reserved.
//

#import "testViewController.h"

@interface testViewController ()

@end

@implementation testViewController
-(instancetype)init{
    if(self=[super initWithNibName:[self className] bundle:nil]){
        
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do view setup here.
}
- (IBAction)test:(NSButton *)sender {
    NSLog(@"test");
}

@end
