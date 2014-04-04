//
//  ToDoListItem.h
//  ToDo
//
//  Created by Ryan Hardt on 3/7/14.
//  Copyright (c) 2014 Ryan Hardt. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ToDoListItem : NSObject

@property(nonatomic, strong) NSMutableString* title;
@property(nonatomic, strong) NSMutableString* text;
@property(nonatomic) BOOL isCompleted;
@property(nonatomic, strong) NSDate* dueDate;

-(id)init;

@end
