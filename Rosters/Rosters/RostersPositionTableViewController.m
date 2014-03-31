//
//  RostersPositionTableViewController.m
//  Rosters
//  48 MINUTES
//  http://www.youtube.com/watch?v=OjDdPfSULB4&feature=youtu.be
//  Created by Jake on 3/31/14.
//  Copyright (c) 2014 Jake. All rights reserved.
//

#import "RostersPositionTableViewController.h"
#import "RostersPlayersTableViewController.h"
#import "BaseballPlayer.h"

@interface RostersPositionTableViewController ()
// Just following the lecture, this seems like a pretty bad way to do things
// 2d array would be better
@property(nonatomic, strong) NSMutableArray* pitcher;
@property(nonatomic, strong) NSMutableArray* catcher;
@property(nonatomic, strong) NSMutableArray* firstBase;
@property(nonatomic, strong) NSMutableArray* secondBase;
@property(nonatomic, strong) NSMutableArray* thirdBase;
@property(nonatomic, strong) NSMutableArray* shortStop;
@property(nonatomic, strong) NSMutableArray* leftField;
@property(nonatomic, strong) NSMutableArray* centerField;
@property(nonatomic, strong) NSMutableArray* rightField;

@end

@implementation RostersPositionTableViewController

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
    
    self.pitcher = [[NSMutableArray alloc] init];
    self.catcher = [[NSMutableArray alloc] init];
    self.firstBase = [[NSMutableArray alloc] init];
    self.secondBase = [[NSMutableArray alloc] init];
    self.thirdBase = [[NSMutableArray alloc] init];
    self.shortStop = [[NSMutableArray alloc] init];
    self.leftField = [[NSMutableArray alloc] init];
    self.centerField = [[NSMutableArray alloc] init];
    self.rightField = [[NSMutableArray alloc] init];
    
    self.allPositions = [[NSArray alloc] initWithObjects: self.pitcher, self.catcher, self.firstBase, self.secondBase, self.thirdBase, self.shortStop, self.leftField, self.centerField, self.rightField, nil];
    [self createPlayers];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return 9;
}

-(void)createPlayers{
    // Pitchers
    [self.pitcher addObject:([self baseballPlayerGenerator:(@"Yovani,Gallardo,Pitcher")])];
    [self.pitcher addObject:([self baseballPlayerGenerator:(@"Matt,Garza,Pitcher")])];
    [self.pitcher addObject:([self baseballPlayerGenerator:(@"Jim,Gallardo,Pitcher")])];
    
    // Catchers
    [self.pitcher addObject:([self baseballPlayerGenerator:(@"Jonathan,Lucray,Catcher")])];
    [self.pitcher addObject:([self baseballPlayerGenerator:(@"Martin,Maldonaldo,Catcher")])];
}

-(BaseballPlayer*)baseballPlayerGenerator:(NSString*)data{
    return [[BaseballPlayer alloc] initWithFirstName:([[data componentsSeparatedByString:@","] objectAtIndex:(0)]) lastName:([[data componentsSeparatedByString:@","] objectAtIndex:(1)]) position:([[data componentsSeparatedByString:@","] objectAtIndex:(2)])];
}

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Navigation

// In a story board-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    RostersPlayersTableViewController* dest = [segue destinationViewController];
    UITableViewCell* cell = (UITableViewCell*)sender;
    dest.players = [self.allPositions objectAtIndex:([self.tableView indexPathForSelectedRow].row)];
    dest.navigationItem.title = cell.textLabel.text; //whatever cell was clicked, set that selected cel text to next nav item
}


@end
