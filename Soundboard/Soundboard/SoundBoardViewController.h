//
//  ViewController.h
//  Soundboard
//
//  Created by Jake on 3/8/14.
//  Copyright (c) 2014 Jake. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
#import "Sound.h"

@interface SoundBoardViewController : UIViewController <UITableViewDelegate,UITableViewDataSource,UITabBarDelegate>

@property(nonatomic, strong) IBOutlet UITableView* tableView;
@property(nonatomic, strong) IBOutlet UITabBar* movieSelector;
@property(nonatomic, strong) IBOutlet UITabBarItem* anchorman;
@property(nonatomic, strong) IBOutlet UITabBarItem* other;

@end
