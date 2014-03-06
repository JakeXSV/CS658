//
//  MultDivQuizViewController.h
//  MathHelper
//
//  Created by Jake on 3/5/14.
//  Copyright (c) 2014 Jake. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SharedAll.h"
#import "SharedQuiz.h"

@interface MultDivQuizViewController : UIViewController <UITextFieldDelegate>

@property(nonatomic, strong) IBOutletCollection(UILabel) NSArray* questionLabels;

@property (strong, nonatomic) IBOutletCollection(UITextField) NSArray* answerTextFields;

@property(nonatomic, strong) IBOutletCollection(UIImageView) NSArray* correctnessImages;

@property(nonatomic, weak) IBOutlet UIButton* button;

-(IBAction)closeKeyboard:(id)sender;

@end
