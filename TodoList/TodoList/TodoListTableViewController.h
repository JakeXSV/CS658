//
//  TodoListTableViewController.h
//  TodoList
//
//  Created by Jake on 3/18/14.
//  Copyright (c) 2014 Jake. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TodoListTableViewController : UITableViewController

@property(nonatomic, strong) IBOutlet UIBarButtonItem* editButton;
-(IBAction)addTodoListItem;
-(IBAction)startEditing:(id)sender;

@end
