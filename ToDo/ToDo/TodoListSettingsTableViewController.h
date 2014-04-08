//
//  TodoListSettingsTableViewController.h
//  ToDo2
//
//  Created by Jake on 4/4/14.
//  Copyright (c) 2014 Ryan Hardt. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TodoListSettingsTableViewController : UITableViewController

@property(nonatomic, weak) IBOutlet UISwitch* deleteOnCompleteSwitch;
@property(nonatomic, weak) NSMutableString* deleteOnComplete;

@end
