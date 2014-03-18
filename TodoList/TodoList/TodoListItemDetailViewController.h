//
//  TodoListItemDetailViewController.h
//  TodoList
//
//  Created by Jake on 3/18/14.
//  Copyright (c) 2014 Jake. All rights reserved.
//

#import <UIKit/UIKit.h>
@class TodoListItem;

@interface TodoListItemDetailViewController : UIViewController

@property(nonatomic, weak) IBOutlet UITextField* titleTextField;
@property(nonatomic, weak) IBOutlet UITextField* textTextView;
@property(nonatomic, weak) IBOutlet UISwitch* completedSwitch;
@property(nonatomic, weak) TodoListItem* item;

@end
