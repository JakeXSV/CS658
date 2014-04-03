//
//  RostersPlayersTableViewController.h
//  Rosters
//
//  Created by Jake on 3/31/14.
//  Copyright (c) 2014 Jake. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RostersAddEditPlayerViewController.h"

@interface RostersPlayersTableViewController : UITableViewController <RostersAddPlayerDelegate>

@property(nonatomic, weak) NSMutableArray* players;

@end
