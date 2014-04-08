//
//  TodoListSettingsTableViewController.m
//  ToDo2
//
//  Created by Jake on 4/4/14.
//  Copyright (c) 2014 Ryan Hardt. All rights reserved.
//

#import "TodoListSettingsTableViewController.h"
#import "ToDoListViewController.h"

@interface TodoListSettingsTableViewController ()

@end

@implementation TodoListSettingsTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    if([self.deleteOnComplete isEqualToString:(@"YES")]){
        [self.deleteOnCompleteSwitch setOn:YES];
        [[NSUserDefaults standardUserDefaults] setObject:(@"YES") forKey:(DeleteOnCompleteKey)];
    }else{
        [self.deleteOnCompleteSwitch setOn:NO];
        [[NSUserDefaults standardUserDefaults] setObject:(@"NO") forKey:(DeleteOnCompleteKey)];
    }
    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewWillDisappear:(BOOL)animated{
    if(self.deleteOnCompleteSwitch.isOn){
        [self.deleteOnComplete setString:@"YES"];
    }else{
        [self.deleteOnComplete setString:@"NO"];
    }
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

@end
