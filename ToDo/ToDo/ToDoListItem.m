//
//  ToDoListItem.m
//  ToDo
//
//  Created by Ryan Hardt on 3/7/14.
//  Copyright (c) 2014 Ryan Hardt. All rights reserved.
//

#import "ToDoListItem.h"

@implementation ToDoListItem

-(id)init
{
    self = [super init];
    if(self) {
        _title = [NSMutableString stringWithString:@"New ToDo Item"];
        _isCompleted = NO;
    }
    return self;
}

@end
