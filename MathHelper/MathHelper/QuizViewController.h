//
//  SecondViewController.h
//  MathHelper
//
//  Created by Jake on 3/3/14.
//  Copyright (c) 2014 Jake. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QuizViewController : UIViewController

@property(nonatomic, strong) IBOutletCollection(UILabel) NSArray* questionLabels;
@property(nonatomic, strong) IBOutletCollection(UITextField) NSArray* answerTextFields;
@property(nonatomic, strong) IBOutletCollection(UIImageView) NSArray* correctnessImages;
@property(nonatomic, weak) IBOutlet UIButton* button;

@end
