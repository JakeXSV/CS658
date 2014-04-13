//
//  BrewersPositionTableViewController.m
//  Brewers
//
//  Created by Ryan Hardt on 3/17/14.
//  Copyright (c) 2014 Ryan Hardt. All rights reserved.
//

#import "BrewersPositionTableViewController.h"
#import "BrewersPlayer.h"
#import "BrewersPlayersTableViewController.h"
#import "AppDelegate.h"

@interface BrewersPositionTableViewController ()

@end

@implementation BrewersPositionTableViewController

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
    // Return the number of rows in the section.
    return 9;
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
    BrewersPlayersTableViewController* dest = [segue destinationViewController];
    
    Position position = [[self.tableView indexPathForSelectedRow] row]+1;
    dest.position = position;
    dest.players = [self playersForPosition:position];
    dest.navigationItem.title = [[BrewersPlayer alloc] nameForPosition:(position)];
    
}

-(NSMutableArray*)playersForPosition:(Position)position{
    AppDelegate* appDelegate = [[UIApplication sharedApplication] delegate];
    NSManagedObjectContext* moc = [appDelegate managedObjectContext];
    
    NSFetchRequest* fetchReq = [[NSFetchRequest alloc] init];
    NSEntityDescription* entityDesc = [NSEntityDescription entityForName:@"BrewersPlayer" inManagedObjectContext:moc];
    NSSortDescriptor* sortByName = [[NSSortDescriptor alloc] initWithKey:@"lastName" ascending:YES];
    NSPredicate* predicate = [NSPredicate predicateWithFormat:@"position == %i", position];
    
    [fetchReq setEntity:entityDesc];
    [fetchReq setSortDescriptors:@[sortByName]];
    [fetchReq setPredicate:predicate];
    
    NSError* error = nil;
    NSArray* fetchedResults = [moc executeFetchRequest:fetchReq error:&error];
    NSMutableArray* results = [NSMutableArray arrayWithArray:fetchedResults];
    
    if(!results){
        NSLog(@"Unresolved error %@ %@", error, [error userInfo]);
    }
    
    return results;
}

@end
