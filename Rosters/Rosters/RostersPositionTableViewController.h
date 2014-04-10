//
//  RostersPositionTableViewController.h
//  Rosters
//
//  Created by Jake on 3/31/14.
//  Copyright (c) 2014 Jake. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RostersPositionTableViewController : UITableViewController

@property(nonatomic, strong) NSArray* allPositions;
-(BOOL)saveChanges;

@end
