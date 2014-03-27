//
//  TodoListTableViewController.m
//  TodoList
//
//  Created by Jake on 3/18/14.
//  Copyright (c) 2014 Jake. All rights reserved.
//

#import "TodoListTableViewController.h"
#import "TodoListItemTableViewCell.h"
#import "TodoListItem.h"
#import "TodoListItemDetailViewController.h"

@interface TodoListTableViewController ()
@property(nonatomic, strong) NSMutableArray* todoList;
@end

@implementation TodoListTableViewController

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
    self.todoList = [[NSMutableArray alloc]init];
}

-(void)viewDidAppear:(BOOL)animated{
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)addTodoListItem{
    TodoListItem* item = [[TodoListItem alloc]init];
    [self.todoList insertObject:(item) atIndex:(0)];
    
    NSIndexPath* indexPath = [NSIndexPath indexPathForRow:(0) inSection:(0)];
    [self.tableView insertRowsAtIndexPaths:(@[indexPath]) withRowAnimation:(UITableViewRowAnimationTop)];
    
    //[self.tableView reloadData]; works but no animation
}

#pragma mark = Navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    if([segue.identifier isEqualToString:(@"ShowDetailView")]){
        TodoListItemDetailViewController* dest = [segue destinationViewController];
        NSIndexPath* indexPath = [self.tableView indexPathForSelectedRow];
        TodoListItem* item = [self.todoList objectAtIndex:(indexPath.row)];
        dest.item = item;
    }
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.todoList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TodoListItemTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    TodoListItem* item = [self.todoList objectAtIndex:(indexPath.row)];
    cell.item = item;
    cell.titleTextField.text = item.title;
    if(item.isCompleted){
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    }else{
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    return cell;
}


- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}


- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}

- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
    TodoListItem* temp = [self.todoList objectAtIndex:(fromIndexPath.row)];
    [self.todoList setObject:([self.todoList objectAtIndex:(toIndexPath.row)]) atIndexedSubscript:(fromIndexPath.row)];
    [self.todoList setObject:(temp) atIndexedSubscript:(toIndexPath.row)];
}



- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

-(IBAction)startEditing:(id)sender{
    if(self.editing){
        self.editing = NO;
    }else{
        self.editing = YES;
    }
    if([self.editButton.title isEqualToString:(@"Edit")]){
        self.editButton.title = @"Done";
    }else{
        self.editButton.title = @"Edit";
    }
}


@end
