//
//  FirstViewController.m
//  MathHelper
//  47:42
//  Created by Jake on 3/3/14.
//  Copyright (c) 2014 Jake. All rights reserved.
//

#import "AddSubFCViewController.h"

@interface AddSubFCViewController ()
@property(nonatomic, strong) NSString* answer;
@end

@implementation AddSubFCViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self generateEquation];
    [self createLineUnderEquation];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)screenTapped{
    if([self.answerLabel.text isEqualToString:(@"")]){
        [self setAnswerView:(self.answer)];
    }else{
        [self clearAnswerView];
        [self generateEquation];
    }
}

-(void)generateEquation{
    int op1 = [self getRandomNumber];
    int op2 = [self getRandomNumber];
    int op = [self getRandomOperation];
    self.answer = [self getAnswer:(op1) param2:(op2) operation:(op)];
    [self setEquationView:(op1) param2:(op2) operation:(op)];
}

-(int)getRandomNumber{
    return arc4random_uniform(99) + 1;
}

-(int)getRandomOperation{
    return arc4random_uniform(2);
}

-(NSString*)getAnswer:(int)op1 param2:(int)op2 operation:(int)op{
    return [NSString stringWithFormat:@"%i", (op==0)?(op1+op2):(op1-op2)];
}

-(void)setEquationView:(int)op1 param2:(int)op2 operation:(int)op{
    [self.operand1Label setText:([NSString stringWithFormat:@"%i", op1])];
    [self.operand2Label setText:([NSString stringWithFormat:@"%i", op2])];
    [self.operatorLabel setText:([NSString stringWithFormat:((op==0)?@"+":@"-")])];
}

-(void)setAnswerView:(NSString*)answer{
    [self.answerLabel setText:(answer)];
}

-(void)clearAnswerView{
    [self.answerLabel setText:(@"")];
}

-(void)createLineUnderEquation{
    UIView* lineView = [[UIView alloc]init];
    CGFloat xCoordinate = self.operatorLabel.frame.origin.x;
    CGFloat yCoordinate = self.operatorLabel.frame.origin.y + self.operatorLabel.frame.size.height;
    CGFloat width = self.operatorLabel.frame.size.width + self.operand2Label.frame.size.width;
    lineView.frame = CGRectMake(xCoordinate, yCoordinate, width, 5);
    lineView.backgroundColor = [UIColor blackColor];
    [self.view addSubview:(lineView)];
}

@end
