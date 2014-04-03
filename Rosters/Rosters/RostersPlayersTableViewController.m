//
//  RostersPlayersTableViewController.m
//  Rosters
//
//  Created by Jake on 3/31/14.
//  Copyright (c) 2014 Jake. All rights reserved.
//

#import "RostersPlayersTableViewController.h"
#import "RostersPlayerDetailViewController.h"
#import "BaseballPlayer.h"

@interface RostersPlayersTableViewController ()

@end

@implementation RostersPlayersTableViewController

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
    UIBarButtonItem *btnRefresh = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(manuallyCallSegueToPlayerAddEdit)];
    
    [self.navigationItem setRightBarButtonItems:[NSArray arrayWithObjects:btnRefresh, self.editButtonItem, nil]];
}

-(void)viewDidAppear:(BOOL)animated{
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)manuallyCallSegueToPlayerAddEdit{
    [self performSegueWithIdentifier:@"toPlayerAddEdit" sender:self];
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return self.players.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"PlayerCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    cell.textLabel.text = [[self.players objectAtIndex:(indexPath.row)] fullName];
    
    return cell;
}


// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}

// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [self.players removeObjectAtIndex:(indexPath.row)];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}

// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
    //swap data
    BaseballPlayer* temp = [self.players objectAtIndex:(fromIndexPath.row)];
    [self.players removeObjectAtIndex:(fromIndexPath.row)];
    [self.players insertObject:(temp) atIndex:(toIndexPath.row)];
}

// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}

#pragma mark - Navigation

// In a story board-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    if([segue.identifier isEqualToString:(@"toPlayerDetail")]){
        RostersPlayerDetailViewController* dest = segue.destinationViewController;
        UITableViewCell* cell = (UITableViewCell*)sender;
        
        dest.player = [self.players objectAtIndex:([self.tableView indexPathForSelectedRow].row)];
        dest.navigationItem.title = cell.textLabel.text;
    }
    if([segue.identifier isEqualToString:(@"toPlayerAddEdit")]){
        RostersAddEditPlayerViewController* dest = segue.destinationViewController;
        dest.delegate = self;
    }
}

#pragma mark - delegate stuff

-(void)cancelAddPlayer{
    [self.navigationController popViewControllerAnimated:(YES)];
}
-(void)doneAddPlayer:(BaseballPlayer*)player{
    [self.players addObject:(player)];
    [self.navigationController popViewControllerAnimated:(YES)];
}


@end
