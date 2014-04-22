//
//  SettingsViewController.h
//  brewers
//
//  Created by Jake on 4/22/14.
//  Copyright (c) 2014 Ryan Hardt. All rights reserved.
//

#import <UIKit/UIKit.h>
#define offlindeModeConfig @"offlindeModeConfig"

@interface SettingsViewController : UITableViewController

@property(nonatomic, strong) IBOutlet UISwitch* offlineModeSwitch;
@property(nonatomic, strong) IBOutlet UIButton* refreshPlayersButton;
@property(nonatomic, strong) NSString* offlineMode;

-(IBAction)offlineModeToggle;
-(IBAction)refreshPlayers;

@end
