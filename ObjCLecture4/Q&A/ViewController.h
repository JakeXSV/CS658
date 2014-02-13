//
//  ViewController.h
//  Q&A
//
//  Created by Jake on 2/8/14.
//  Copyright (c) 2014 Jake. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property(nonatomic, weak) IBOutlet UITextView* templateLabel;
@property(nonatomic, weak) IBOutlet UIButton* burnButton;
@property(nonatomic, weak) IBOutlet UIButton* madLibButton;

-(IBAction)genBurn:(id)sender;
-(IBAction)genMadLib:(id)sender;

@end
