//
//  RostersPlayerDetailViewController.h
//  Rosters
//
//  Created by Jake on 3/31/14.
//  Copyright (c) 2014 Jake. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseballPlayer.h"

@interface RostersPlayerDetailViewController : UIViewController

@property(nonatomic, weak) IBOutlet UILabel* firstNameLabel;
@property(nonatomic, weak) IBOutlet UILabel* lastNameLabel;
@property(nonatomic, weak) IBOutlet UILabel* positionLabel;
@property(nonatomic, weak) IBOutlet UIButton* moreInfoButton;
@property(nonatomic, strong) BaseballPlayer* player;
@property(nonatomic, weak) IBOutlet UIWebView* headShotView;

@end
