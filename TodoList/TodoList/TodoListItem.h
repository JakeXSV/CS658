//
//  TodoListItem.h
//  TodoList
//
//  Created by Jake on 3/18/14.
//  Copyright (c) 2014 Jake. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TodoListItem : NSObject

@property(nonatomic, strong) NSMutableString* title;
@property(nonatomic, strong) NSMutableString* text;
@property(nonatomic, assign) BOOL isCompleted;

-(id)init;

@end
