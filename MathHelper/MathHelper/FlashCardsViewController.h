//
//  FirstViewController.h
//  MathHelper
//
//  Created by Jake on 3/3/14.
//  Copyright (c) 2014 Jake. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FlashCardsViewController : UIViewController

@property(nonatomic, weak) IBOutlet UILabel* operand1Label;
@property(nonatomic, weak) IBOutlet UILabel* operand2Label;
@property(nonatomic, weak) IBOutlet UILabel* operatorLabel;
@property(nonatomic, weak) IBOutlet UILabel* answerLabel;

-(IBAction)screenTapped;

@end
