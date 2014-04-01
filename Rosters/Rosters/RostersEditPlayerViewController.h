//
//  RostersEditPlayerViewController.h
//  Rosters
//
//  Created by Jake on 3/31/14.
//  Copyright (c) 2014 Jake. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseballPlayer.h"

@interface RostersEditPlayerViewController : UIViewController<UITextFieldDelegate>

@property(nonatomic, weak) IBOutlet UITextField* firstNameTextField;
@property(nonatomic, weak) IBOutlet UITextField* lastNameTextField;
@property(nonatomic, weak) IBOutlet UITextField* urlTextField;
@property(nonatomic, weak) IBOutlet UILabel* positionLabel;
@property(nonatomic, weak) BaseballPlayer* player;

-(IBAction)savePlayerEditing;
-(IBAction)cancelPlayerEditing;

@end
