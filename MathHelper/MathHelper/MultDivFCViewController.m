//
//  MultDivFCViewController.m
//  MathHelper
//
//  Created by Jake on 3/5/14.
//  Copyright (c) 2014 Jake. All rights reserved.
//

#import "MultDivFCViewController.h"

@interface MultDivFCViewController ()
@property(nonatomic, strong) NSString* answer;
@property(nonatomic, strong) SharedAll* allHelper;
@property(nonatomic, strong) SharedFlashCards* fcHelper;
@property(nonatomic, assign) int opType;
@property(nonatomic, assign) int answerIsShown;
@property(nonatomic, strong) UIView* bottomLine;
@property(nonatomic, strong) UIView* leftLine;
@property(nonatomic, strong) UIView* topLine;
@end

@implementation MultDivFCViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self.allHelper = [[SharedAll alloc]init];
    self.fcHelper = [[SharedFlashCards alloc] init];
    [self setBottomLineView];
    [self setTopLineView];
    [self setLeftLineView];
    [self generateEquation];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)screenTapped{
    
    NSLog(@"%@ - %@",self.answerLabel.text,self.operand1Label.text);
    
    if(self.answerIsShown==0){
        NSLog(@"updating answer view with answer!");
        [self setAnswerView:(self.answer)];
        self.answerIsShown=1;
    }else{
        NSLog(@"clearing and setting new EQN!");
        [self generateEquation];
    }
}

-(void)generateEquation{
    [self clearAllLineViews];
    [self clearAnswerView];
    self.answerIsShown = 0;
    self.opType = [self.allHelper getRandomOperation];
    int op1;
    int op2;
    if(self.opType ==0){
        //mult
        op1 = [self.allHelper getRandomNumberTo9];
        op2 = [self.allHelper getRandomNumberTo9];
    }else{
        //div
        op2 = [self.allHelper getRandomNumberTo9];
        op1 = ([self.allHelper getRandomNumberTo9] * op2);
    }
    NSLog(@"gen eqn: %i %i %i",op1, self.opType, op2);
    self.answer = [NSString stringWithFormat:@"%i", (self.opType ==0)?(op1*op2):(op1/op2)];
    [self setView:(op1) param2:(op2)];
}

-(void)setView:(int)op1 param2:(int)op2{
    if(self.opType==0){
        [self.operand1Label setText:([NSString stringWithFormat:@"%i", op1])];
        [self.operand2Label setText:([NSString stringWithFormat:@"%i", op2])];
        [self.operatorLabel setText:([NSString stringWithFormat:@"x"])];
        [self.view addSubview:(self.bottomLine)];
    }else{
        [self.operand1Label setText:(@"")];
        [self.operand2Label setText:([NSString stringWithFormat:@"%i", op1])];
        [self.operatorLabel setText:([NSString stringWithFormat:@"%i", op2])];
        [self.view addSubview:(self.topLine)];
        [self.view addSubview:(self.leftLine)];
    }
}

-(void)setAnswerView:(NSString*)answer{
    if(self.opType==0){
        [self.answerLabel setText:(answer)];
    }else{
        [self.operand1Label setText:(answer)];
    }
}

-(void)clearAnswerView{
    [self.answerLabel setText:(@"")];
}

-(BOOL)isMultProblem{
    if([[self.operatorLabel text] isEqualToString:(@"x")]){
        return true;
    }else{
        return false;
    }
}

-(void)setBottomLineView{
    UIView* lineView = [[UIView alloc]init];
    CGFloat xCoordinate = self.operatorLabel.frame.origin.x;
    CGFloat yCoordinate = self.operatorLabel.frame.origin.y + self.operatorLabel.frame.size.height;
    CGFloat width = self.operatorLabel.frame.size.width + self.operand2Label.frame.size.width;
    lineView.frame = CGRectMake(xCoordinate, yCoordinate, width, 5);
    lineView.backgroundColor = [UIColor blackColor];
    self.bottomLine = lineView;
}

-(void)setLeftLineView{
    UIView* lineView = [[UIView alloc]init];
    CGFloat xCoordinate = self.operand2Label.frame.origin.x;
    CGFloat yCoordinate = self.operand2Label.frame.origin.y;
    CGFloat height = self.operand2Label.frame.size.height;
    lineView.frame = CGRectMake(xCoordinate, yCoordinate, 5, height);
    lineView.backgroundColor = [UIColor blackColor];
    self.leftLine = lineView;
}

-(void)setTopLineView{
    UIView* lineView = [[UIView alloc]init];
    CGFloat xCoordinate = self.operand2Label.frame.origin.x;
    CGFloat yCoordinate = self.operand2Label.frame.origin.y;
    CGFloat width = self.operand2Label.frame.size.width;
    lineView.frame = CGRectMake(xCoordinate, yCoordinate, width, 5);
    lineView.backgroundColor = [UIColor blackColor];
    self.topLine = lineView;
}

-(void)clearAllLineViews{
    [self.bottomLine removeFromSuperview];
    [self.leftLine removeFromSuperview];
    [self.topLine removeFromSuperview];
}

@end
