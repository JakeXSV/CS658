//
//  SettingsViewController.m
//  brewers
//
//  Created by Jake on 4/22/14.
//  Copyright (c) 2014 Ryan Hardt. All rights reserved.
//

#import "SettingsViewController.h"

@interface SettingsViewController ()
@property(nonatomic, strong) BOOL firstRun;
@end

@implementation SettingsViewController

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
    self.offlineMode = [NSMutableString stringWithString:[[NSUserDefaults standardUserDefaults] objectForKey:offlindeModeConfig]];
    if([self.offlineMode isEqualToString:@"NO"]){
        [self.offlineModeSwitch setOn:NO];
    }else{
        [self.offlineModeSwitch setOn:YES];
    }
    [self.refreshPlayersButton setEnabled:(!self.offlineModeSwitch.isOn)];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

-(IBAction)offlineModeToggle{
    if([self.offlineMode isEqualToString:@"NO"]){
        self.offlineMode = @"YES";
        [[NSUserDefaults standardUserDefaults] setObject:@"YES" forKey:offlindeModeConfig];
    }else{
        self.offlineMode = @"NO";
        [[NSUserDefaults standardUserDefaults] setObject:@"NO" forKey:offlindeModeConfig];
    }
    [self.refreshPlayersButton setEnabled:(!self.offlineModeSwitch.isOn)];
    [[NSUserDefaults standardUserDefaults] synchronize];
}


-(IBAction)refreshPlayers{
    NSLog(@"refresh players");
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 2;
}

@end
