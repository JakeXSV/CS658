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

@interface BrewersPositionTableViewController ()

@property(nonatomic, strong) NSArray* allPositions;
@property(nonatomic, strong) NSMutableArray* pitcher;
@property(nonatomic, strong) NSMutableArray* catcher;
@property(nonatomic, strong) NSMutableArray* firstBase;
@property(nonatomic, strong) NSMutableArray* secondBase;
@property(nonatomic, strong) NSMutableArray* thirdBase;
@property(nonatomic, strong) NSMutableArray* shortstop;
@property(nonatomic, strong) NSMutableArray* leftField;
@property(nonatomic, strong) NSMutableArray* centerField;
@property(nonatomic, strong) NSMutableArray* rightField;

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
    
    
    //get the path to the archive
    NSString* pathToArchive = [self playersArchivePath];
    
    //unarchive all those items and put them in the array
    self.allPositions = [NSKeyedUnarchiver unarchiveObjectWithFile:pathToArchive];
    
    if(!self.allPositions) {
        self.pitcher = [[NSMutableArray alloc] init];
        self.catcher = [[NSMutableArray alloc] init];
        self.firstBase = [[NSMutableArray alloc] init];
        self.secondBase = [[NSMutableArray alloc] init];
        self.thirdBase = [[NSMutableArray alloc] init];
        self.shortstop = [[NSMutableArray alloc] init];
        self.leftField = [[NSMutableArray alloc] init];
        self.centerField = [[NSMutableArray alloc] init];
        self.rightField = [[NSMutableArray alloc] init];
        
        self.allPositions = [[NSArray alloc] initWithObjects:self.pitcher, self.catcher, self.firstBase, self.secondBase,
                             self.thirdBase, self.shortstop, self.leftField, self.centerField, self.rightField, nil];
    }
    
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
    UITableViewCell* cell = (UITableViewCell*)sender;
    dest.positionPlayers = [self.allPositions objectAtIndex:[self.tableView indexPathForSelectedRow].row];
    dest.navigationItem.title = cell.textLabel.text;
}

-(NSString*)playersArchivePath
{
    //get an array of all document directories (only 1 on iOS)
    NSArray* documentDirectories = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    
    //get the only document directory
    NSString* documentDirectory = [documentDirectories objectAtIndex:0];
    
    return [documentDirectory stringByAppendingPathComponent:@"players.archive"];
}

-(BOOL)saveChanges
{
    //get path to doucment we're creating
    NSString* path = [self playersArchivePath];
    
    //now save
    return [NSKeyedArchiver archiveRootObject:self.allPositions toFile:path];
}

@end
