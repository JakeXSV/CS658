//
//  RostersEditPlayerViewController.h
//  Rosters
//
//  Created by Jake on 3/31/14.
//  Copyright (c) 2014 Jake. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseballPlayer.h"
#import "RostersPlayerWebViewViewController.h"

@protocol RostersAddPlayerDelegate <NSObject>
-(void)cancelAddPlayer;
-(void)doneAddPlayer;
@end

@interface RostersAddEditPlayerViewController : UIViewController<UITextFieldDelegate>

@property(nonatomic, weak) IBOutlet UITextField* firstNameTextField;
@property(nonatomic, weak) IBOutlet UITextField* lastNameTextField;
@property(nonatomic, weak) IBOutlet UITextField* urlTextField;
@property(nonatomic, weak) IBOutlet UITextField* headUrlTextField;
@property(nonatomic, weak) IBOutlet UILabel* positionLabel;
@property(nonatomic, weak) BaseballPlayer* player;
@property(nonatomic, weak) id<RostersAddPlayerDelegate> delegate;

-(IBAction)savePlayerEditing;
-(IBAction)cancelPlayerEditing;

@end
