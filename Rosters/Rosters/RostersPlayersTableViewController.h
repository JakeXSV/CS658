//
//  RostersPlayersTableViewController.h
//  Rosters
//
//  Created by Jake on 3/31/14.
//  Copyright (c) 2014 Jake. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RostersPlayerDetailViewController.h"
#import "RostersAddEditPlayerViewController.h"
#import "BaseballPlayer.h"

@interface RostersPlayersTableViewController : UITableViewController<RostersAddPlayerDelegate>

@property(nonatomic, weak) NSMutableArray* players;
@property(nonatomic, strong) BaseballPlayer* toBeAddedPlayer;

@end
