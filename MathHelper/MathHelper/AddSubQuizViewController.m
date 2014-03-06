//
//  SecondViewController.m
//  MathHelper
//  1:10:08
//  Created by Jake on 3/3/14.
//  Copyright (c) 2014 Jake. All rights reserved.
//

#import "AddSubQuizViewController.h"

@interface AddSubQuizViewController ()
@property(nonatomic, strong) NSMutableArray* answers;
@property(nonatomic, strong) UIImage* correctImage;
@property(nonatomic, strong) UIImage* incorrectImage;
@property(nonatomic, assign) BOOL isSlidUp;
@property(nonatomic, strong) SharedAll* allHelper;
@property(nonatomic, strong) SharedQuiz* quizHelper;
@end

@implementation AddSubQuizViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.answers = [[NSMutableArray alloc]init];
    self.allHelper = [[SharedAll alloc]init];
    self.quizHelper = [[SharedQuiz alloc]init];
    self.correctImage = [self.quizHelper getCorrectImage];
    self.incorrectImage = [self.quizHelper getIncorrectImage];
    self.isSlidUp = false;
    //[self setTextFieldDelegates];
    [self.quizHelper setTextFieldDelegates:(self.answerTextFields) delegateView:(self)];
    [self generateQuiz];
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
        [self.answers addObject:([NSString stringWithFormat:(@"%i"), answer])];
    }
}

-(IBAction)submitQuiz{
    NSLog(@"submitQuit!");
    if([self.button.currentTitle isEqualToString:(@"New Quiz")]){
        [self resetQuiz];
        [self.button setTitle:(@"Submit Quiz") forState:(UIControlStateNormal)];
    }else{
        [self checkAnswers];
        [self.button setTitle:(@"New Quiz") forState:(UIControlStateNormal)];
    }
}

-(IBAction)closeKeyboard:(id)sender{
    [self.view endEditing:(YES)];
}

-(int)getRandomNumber{
    return arc4random_uniform(99) + 1;
}

-(int)getRandomOperation{
    return arc4random_uniform(2);
}

-(void)checkAnswers{
    for(int i=0;i<self.answers.count;++i){
        if([self.answers[i] isEqualToString:([self.answerTextFields[i] text])]){
            [self.correctnessImages[i] setImage:(self.correctImage)];
        }else{
            [self.correctnessImages[i] setImage:(self.incorrectImage)];
        }
    }
}

-(void)resetQuiz{
    [self.answers removeAllObjects];
    [self generateQuiz];
    for(UITextField* answerText in self.answerTextFields){
        [answerText setText:(@"")];
    }
    for(UIImageView* imageView in self.correctnessImages){
        [imageView setImage:(nil)];
    }
}

// Keyboard / View Management

- (void)textFieldDidBeginEditing:(UITextField *)textField{
    if([self doesViewNeedToSlideUp:(textField)]){
        [self slideMainViewUp];
        self.isSlidUp = true;
    }
}

- (void)textFieldDidEndEditing:(UITextField *)textField{
    if(self.isSlidUp){
        [self slideMainViewDown];
    }
}

-(BOOL)doesViewNeedToSlideUp:(UITextField *)textField{
    CGFloat screenHeight = self.view.bounds.size.height;
    CGFloat keyboardHeight = [self getKeyboardHeight];
    if(textField.center.y >= (screenHeight - keyboardHeight)){
        return YES;
    }else{
        return NO;
    }
}

-(void)slideMainViewUp{
    [UIView beginAnimations:nil context: nil];
    [UIView setAnimationDuration: 0.3];
    CGFloat keyboardHeight = [self getKeyboardHeight];
    if ([[UIApplication sharedApplication] statusBarOrientation] == UIInterfaceOrientationPortrait){
        self.view.frame = CGRectOffset([[UIScreen mainScreen]bounds],0,-keyboardHeight);
    }else{
        if([[UIApplication sharedApplication] statusBarOrientation] == UIInterfaceOrientationLandscapeLeft){
            self.view.frame = CGRectOffset([[UIScreen mainScreen]bounds],-keyboardHeight,0);
        }else{
            self.view.frame = CGRectOffset([[UIScreen mainScreen]bounds],keyboardHeight,0);
        }
    }
    [UIView commitAnimations];
}

-(void)slideMainViewDown{
    [UIView beginAnimations:nil context: nil];
    [UIView setAnimationDuration: 0.3];
    self.view.frame = CGRectOffset([[UIScreen mainScreen]bounds],0,0);
    [UIView commitAnimations];
}

-(CGFloat)getKeyboardHeight{
    CGFloat keyboardHeight = 0;
    if ([[UIApplication sharedApplication] statusBarOrientation] == UIInterfaceOrientationPortrait){
        keyboardHeight=216;
    }else if([[UIApplication sharedApplication] statusBarOrientation] == UIInterfaceOrientationLandscapeLeft){
        keyboardHeight=162;
    }else if([[UIApplication sharedApplication] statusBarOrientation] == UIInterfaceOrientationLandscapeRight){
        keyboardHeight=162;
    }
    return keyboardHeight;
}

-(void)setTextFieldDelegates{
    for(UITextField* textField in self.answerTextFields){
        textField.delegate = self;
    }
}

@end
