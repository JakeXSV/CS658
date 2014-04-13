//
//  BrewersPlayersTableViewController.h
//  Brewers
//
//  Created by Ryan Hardt on 3/17/14.
//  Copyright (c) 2014 Ryan Hardt. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BrewersAddEditPlayerViewController.h"

@interface BrewersPlayersTableViewController : UITableViewController
<BrewersAddPlayerViewControllerDelegate>

@property(nonatomic, weak) NSMutableArray* positionPlayers;

@end
