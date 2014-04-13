//
//  BrewersPlayersTableViewController.m
//  Brewers
//
//  Created by Ryan Hardt on 3/17/14.
//  Copyright (c) 2014 Ryan Hardt. All rights reserved.
//

#import "BrewersPlayersTableViewController.h"
#import "BrewersPlayer.h"
#import "BrewersPlayerDetailViewController.h"
#import "BrewersAddEditPlayerViewController.h"

@interface BrewersPlayersTableViewController ()

@property(nonatomic, strong) BrewersPlayer* tempPlayer;

@end

@implementation BrewersPlayersTableViewController

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
    
    UIBarButtonItem* addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addPlayer)];
    self.navigationItem.rightBarButtonItems = @[addButton, self.editButtonItem];
}

-(void)viewWillAppear:(BOOL)animated
{
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.positionPlayers.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"PlayerCell" forIndexPath:indexPath];
    
    // Configure the cell...
    cell.textLabel.text = [[self.positionPlayers objectAtIndex:indexPath.row] fullName];
    
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
        [self.positionPlayers removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
        
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}


// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
    BrewersPlayer* player = [self.positionPlayers objectAtIndex:fromIndexPath.row];
    [self.positionPlayers removeObjectAtIndex:fromIndexPath.row];
    [self.positionPlayers insertObject:player atIndex:toIndexPath.row];
}


// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    if([segue.identifier isEqualToString:@"showPlayerDetailSegue"]) {
        BrewersPlayerDetailViewController* dest = [segue destinationViewController];
        UITableViewCell* cell = (UITableViewCell*)sender;
        dest.player = [self.positionPlayers objectAtIndex:[self.tableView indexPathForSelectedRow].row];
        dest.navigationItem.title = cell.textLabel.text;
    }
    else if([segue.identifier isEqualToString:@"addPlayerSegue"]) {
        BrewersAddEditPlayerViewController* dest = [segue destinationViewController];
        dest.navigationItem.title = @"Add Player";
        dest.player = self.tempPlayer;
        dest.delegate = self;
    }
}
 -(void)addPlayer
 {
     self.tempPlayer = [[BrewersPlayer alloc] init];
     self.tempPlayer.position = self.navigationItem.title;
 
     [self performSegueWithIdentifier:@"addPlayerSegue" sender:self];
 }
 
 #pragma mark - BrewersAddEditPlayerViewController
 
 -(void)doneAddPlayer
 {
     [self.positionPlayers insertObject:self.tempPlayer atIndex:0];
 }
 
 -(void)cancelAddPlayer
 {
     self.tempPlayer = nil;
 }


@end
