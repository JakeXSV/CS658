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

-(id)initWithCoder:(NSCoder *)aDecoder{
    self = [super init];
    if(self) {
        _title = [aDecoder decodeObjectForKey:(@"title")];
        _text = [aDecoder decodeObjectForKey:(@"text")];
        _dueDate = [aDecoder decodeObjectForKey:(@"dueDate")];
        _isCompleted = [aDecoder decodeBoolForKey:(@"isCompleted")];
    }
    return self;
}

-(void)encodeWithCoder:(NSCoder *)aCoder{
    [aCoder encodeObject:self.title forKey:@"title"];
    [aCoder encodeObject:self.text forKey:@"text"];
    [aCoder encodeObject:self.dueDate forKey:@"dueDate"];
    [aCoder encodeBool:self.isCompleted forKey:@"isCompleted"];
}

@end
