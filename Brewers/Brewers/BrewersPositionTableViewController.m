//
//  BrewersPositionTableViewController.m
//  Brewers
//
//  Created by Ryan Hardt on 3/17/14.
//  Copyright (c) 2014 Ryan Hardt. All rights reserved.
//

#import "BrewersPositionTableViewController.h"
#import "BrewersPlayersTableViewController.h"
#import "BrewersPlayer.h"
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
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
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
    return 10;
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    BrewersPlayersTableViewController* dest = [segue destinationViewController];
    Position position = (Position)[self.tableView indexPathForSelectedRow].row+1;
    dest.players = [self playersForPosition:position];
    dest.position = position;
    dest.navigationItem.title = [BrewersPlayer nameForPosition:position];
}

-(NSMutableArray*)playersForPosition:(Position)position
{
    AppDelegate* appDelegate = [[UIApplication sharedApplication] delegate];
    NSManagedObjectContext* moc = [appDelegate managedObjectContext];
    
    NSFetchRequest* fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription* entity = [NSEntityDescription entityForName:@"BrewersPlayer" inManagedObjectContext:moc];
    [fetchRequest setEntity:entity];
    
    NSSortDescriptor* sortByName = [[NSSortDescriptor alloc] initWithKey:@"lastName" ascending:YES];
    [fetchRequest setSortDescriptors:@[sortByName]];
    
    NSPredicate* predicate = [NSPredicate predicateWithFormat:@"position = %i", position];
    [fetchRequest setPredicate:predicate];
    
    NSError* error = nil;
    NSMutableArray* fetchResults = [NSMutableArray arrayWithArray:[moc executeFetchRequest:fetchRequest error:&error]];
    
    if(!fetchResults) {
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
    } else if([fetchResults count]==0) {
        //if no players, obtain players from web service
        fetchResults = [self getPlayersFromWebServiceForPosition:position withMoc:moc];
    }
    
    return fetchResults;
}

-(NSMutableArray*)getPlayersFromWebServiceForPosition:(Position)position withMoc:(NSManagedObjectContext*)moc{
    NSMutableArray* players = [[NSMutableArray alloc]init];
    
    //construct string for url
    NSString* brewersPlayersURLString = @"http://api.cbssports.com/fantasy/players/search?SPORT=baseball&version=3.0&response_format=json&pro_team=MIL";
    NSString* positionString = [NSString stringWithFormat:@"&position=%@", [BrewersPlayer identifierForPosition:position]];
    NSString* brewersPlayerURLForPosition = [brewersPlayersURLString stringByAppendingString:(positionString)];
    
    NSURL* brewersPlayersByPositionURL = [[NSURL alloc]initWithString:brewersPlayerURLForPosition];
    NSData* data = [NSData dataWithContentsOfURL:brewersPlayersByPositionURL];
    
    //get data
    NSError* error = nil;
    NSDictionary* jsonResults = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
    NSDictionary* bodyOfResults = [jsonResults objectForKey:@"body"];
    NSMutableArray* playerResults = [bodyOfResults objectForKey:@"players"];
    
    //construct players
    BrewersPlayer* player;
    for (NSDictionary* cplayer in playerResults){
        player = [NSEntityDescription insertNewObjectForEntityForName:@"BrewersPlayer" inManagedObjectContext:moc];
        player.firstName = [cplayer valueForKeyPath:@"firstname"];
        player.lastName = [cplayer valueForKeyPath:@"lastname"];
        player.position = [NSNumber numberWithInt:position];
        player.infoUrl = [@"http://www.cbssports.com/mlb/players/playerpage/" stringByAppendingString:[cplayer valueForKeyPath:@"id"]];
        NSURL* hs = [cplayer valueForKeyPath:@"photo_url"];
        player.headshot = [NSData dataWithContentsOfURL:hs];
        [players addObject:player];
    };
    
    return players;
}

@end
