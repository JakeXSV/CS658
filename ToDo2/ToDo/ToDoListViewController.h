//
//  ToDoViewController.h
//  ToDo
//
//  Created by Ryan Hardt on 3/7/14.
//  Copyright (c) 2014 Ryan Hardt. All rights reserved.
//

#import <UIKit/UIKit.h>
#define DeleteOnCompleteKey @"DeleteOnCompleteKey"

@interface ToDoListViewController : UITableViewController

@property(nonatomic, strong) NSMutableString* deleteOnComplete;
@property(nonatomic, strong) NSMutableArray* toDoList;

-(IBAction)addToDoListItem;

@end
