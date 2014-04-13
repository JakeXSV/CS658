//
//  BrewersAddEditPlayerViewController.h
//  Brewers
//
//  Created by Ryan Hardt on 3/17/14.
//  Copyright (c) 2014 Ryan Hardt. All rights reserved.
//

#import <UIKit/UIKit.h>
@class BrewersPlayer;

@protocol BrewersAddPlayerViewControllerDelegate <NSObject>

-(void)doneAddPlayer;
-(void)cancelAddPlayer;

@end

@interface BrewersAddEditPlayerViewController : UIViewController<UITextFieldDelegate,UIImagePickerControllerDelegate>

@property(nonatomic, weak) IBOutlet UITextField* firstNameTextField;
@property(nonatomic, weak) IBOutlet UITextField* lastNameTextField;
@property(nonatomic, weak) IBOutlet UILabel* positionLabel;
@property(nonatomic, weak) IBOutlet UITextField* urlTextField;
@property(nonatomic, weak) IBOutlet UITextField* headshotUrlTextField;

@property(nonatomic, strong) NSNumber* isAdd;
@property(nonatomic, weak) BrewersPlayer* player;
@property(nonatomic, weak) id<BrewersAddPlayerViewControllerDelegate> delegate;

-(IBAction)cancel:(id)sender;
-(IBAction)done:(id)sender;

@end
