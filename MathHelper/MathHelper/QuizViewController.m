//
//  SecondViewController.m
//  MathHelper
//  1:10:08
//  Created by Jake on 3/3/14.
//  Copyright (c) 2014 Jake. All rights reserved.
//

#import "QuizViewController.h"

@interface QuizViewController ()
@property(nonatomic, strong) NSMutableArray* answers;
@end

@implementation QuizViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)generateQuiz{
    for(UILabel* questionLabel in self.questionLabels){
        int op1 = [self getRandomNumber];
        int op2 = [self getRandomNumber];
        int op = [self getRandomOperation];
        int answer = ((op==0)?(op1+op2):(op1-op2));
        [questionLabel setText:([NSString stringWithFormat:@"%i %@ %i\t=",op1,(op==0)?@"+":@"-",op2])];
        [self.answers addObject:([NSString stringWithFormat:(@"%i",answer)])];
    }
}

-(IBAction)submitQuit{
    
}

-(int)getRandomNumber{
    return arc4random_uniform(99) + 1;
}

-(int)getRandomOperation{
    return arc4random_uniform(2);
}

@end
