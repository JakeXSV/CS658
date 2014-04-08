//
//  ToDoViewController.m
//  ToDo
//
//  Created by Ryan Hardt on 3/7/14.
//  Copyright (c) 2014 Ryan Hardt. All rights reserved.
//

#import "ToDoListViewController.h"
#import "ToDoListItem.h"
#import "ToDoListItemDetailViewController.h"
#import "ToDoListItemTableViewCell.h"
#import "TodoListSettingsTableViewController.h"

@interface ToDoListViewController ()
@property(nonatomic, strong) NSMutableArray* toDoList;
@end

@implementation ToDoListViewController

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

    self.clearsSelectionOnViewWillAppear = NO;
    
    self.toDoList = [NSKeyedUnarchiver unarchiveObjectWithFile:([self getArchivePath])];
    if(!self.toDoList){
        self.toDoList = [[NSMutableArray alloc]init];
    }
    
    
    self.deleteOnComplete = [NSMutableString stringWithString:([[NSUserDefaults standardUserDefaults] objectForKey:(DeleteOnCompleteKey)])];
    
    self.navigationItem.rightBarButtonItem = self.editButtonItem;
    UIBarButtonItem* settingsButton = [[UIBarButtonItem alloc] initWithTitle:(@"Settings") style:(UIBarButtonItemStyleBordered) target:(self) action:@selector(showSettings)];
    self.toolbarItems = @[settingsButton];
    self.navigationController.toolbarHidden = NO;
    
}

-(void)viewDidAppear:(BOOL)animated
{
    [self.tableView reloadData];
}

-(void)viewWillAppear:(BOOL)animated{
    //if deleteOnComplete, delete
    if([self.deleteOnComplete isEqualToString:(@"YES")]){
        ToDoListItem* item;
        for(int i=0; i<self.toDoList.count; ++i) {
            item = [self.toDoList objectAtIndex:i];
            if(item.isCompleted) {
                [self.toDoList removeObject:item];
                --i;
            }
        }
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSString*)getArchivePath{
    NSArray* docDirArray = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString* docDir = [docDirArray objectAtIndex:0];
    NSString* archPath = [docDir stringByAppendingPathComponent:@"todoData.archive"];
    return archPath;
}

-(BOOL)saveChanges{
    return [NSKeyedArchiver archiveRootObject:(self.toDoList) toFile:([self getArchivePath])];
}

-(IBAction)addToDoListItem
{
    ToDoListItem* item = [[ToDoListItem alloc] init];
    [self.toDoList insertObject:item atIndex:0];
    
    // Create an index path for the new item
    NSIndexPath* indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    
    // Update the tableview with cool animations
    [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationTop];
}

-(void)showSettings{
    [self performSegueWithIdentifier:(@"ShowSettingsSegue") sender:(self)];
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.toDoList.count;

}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"ListItemCell";
    ToDoListItemTableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    ToDoListItem* item = [self.toDoList objectAtIndex:indexPath.row];
    cell.item = item;
    cell.titleTextField.text = item.title;
    if(item.isCompleted) {
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    } else {
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }

    return cell;
}

#pragma mark - Navigation

// In a story board-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    //always check to see which segue it is
    if([segue.identifier isEqualToString:@"ShowDetailView"]) {
        ToDoListItemDetailViewController* dest = [segue destinationViewController];
        NSIndexPath* indexPath = [self.tableView indexPathForSelectedRow];
        ToDoListItem* item;
        item = [self.toDoList objectAtIndex:indexPath.row];
        dest.item = item;
    }
    if([segue.identifier isEqualToString:@"ShowSettingsSegue"]) {
        TodoListSettingsTableViewController* dest = [segue destinationViewController];
        dest.deleteOnComplete = self.deleteOnComplete;
    }
}

// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}


// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [self.toDoList removeObjectAtIndex:indexPath.row];
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }
}


// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
    ToDoListItem* item = [self.toDoList objectAtIndex:fromIndexPath.row];
    [self.toDoList removeObjectAtIndex:fromIndexPath.row];
    [self.toDoList insertObject:item atIndex:toIndexPath.row];
}


// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

@end
