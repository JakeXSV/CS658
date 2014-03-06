//
//  SecondViewController.h
//  MathHelper
//
//  Created by Jake on 3/3/14.
//  Copyright (c) 2014 Jake. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SharedAll.h"
#import "SharedQuiz.h"

@interface AddSubQuizViewController : UIViewController <UITextFieldDelegate>

@property(nonatomic, strong) IBOutletCollection(UILabel) NSArray* questionLabels;
@property(nonatomic, strong) IBOutletCollection(UITextField) NSArray* answerTextFields;
@property(nonatomic, strong) IBOutletCollection(UIImageView) NSArray* correctnessImages;
@property(nonatomic, weak) IBOutlet UIButton* button;

-(IBAction)closeKeyboard:(id)sender;

@end
