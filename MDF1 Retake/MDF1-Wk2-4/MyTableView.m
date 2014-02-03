//
//  MyTableView.m
//  MDF1-Wk2-4
//
//  Created by Brandon Mackey on 9/10/13.
//  Copyright (c) 2013 Brandon Mackey. All rights reserved.
//

#import "MyTableView.h"

@implementation MyTableView

@synthesize big = _big;
@synthesize gravity = _gravity;
@synthesize powder = _powder;

-(id)init
{
    self = [super init];
    
    if (self) {
        self.big = _big;
        self.gravity = _gravity;
        self.powder = _powder;
    }
    return self;
}

@end
