//
//  TodoListItem.m
//  TodoList
//
//  Created by Jake on 3/18/14.
//  Copyright (c) 2014 Jake. All rights reserved.
//

#import "TodoListItem.h"

@implementation TodoListItem

-(id)init{
    self = [super init];
    if(self){
        _title = [NSMutableString stringWithString:(@"New Todo Item")];
        _dueDateDateLabelText = @"None";
        _isCompleted = NO;
    }
    return self;
}

@end
