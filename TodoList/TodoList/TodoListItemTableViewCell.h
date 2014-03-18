//
//  TodoListItemTableViewCell.h
//  TodoList
//
//  Created by Jake on 3/18/14.
//  Copyright (c) 2014 Jake. All rights reserved.
//

#import <UIKit/UIKit.h>
@class TodoListItem;

@interface TodoListItemTableViewCell : UITableViewCell <UITextFieldDelegate>

@property(nonatomic, weak) IBOutlet UITextField* titleTextField;
@property(nonatomic, weak) TodoListItem* item;



@end
