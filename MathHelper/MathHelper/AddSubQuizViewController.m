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
    [self.quizHelper setTextFieldDelegates:(self.answerTextFields) AddSubQuiz:(self)];
    [self generateQuiz];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)generateQuiz{
    for(UILabel* questionLabel in self.questionLabels){
        int op1 = [self.allHelper getRandomNumber];
        int op2 = [self.allHelper getRandomNumber];
        int op = [self.allHelper getRandomOperation];
        int answer = ((op==0)?(op1+op2):(op1-op2));
        [questionLabel setText:([NSString stringWithFormat:@"%i %@ %i\t=",op1,(op==0)?@"+":@"-",op2])];
        [self.answers addObject:([NSString stringWithFormat:(@"%i"), answer])];
        NSLog(@"%@%@",[questionLabel text],[NSString stringWithFormat:(@"%i"), answer]);
    }
}

-(IBAction)submitQuiz{
    if([self.button.currentTitle isEqualToString:(@"New Quiz")]){
        NSLog(@"generating new quiz!");
        //Clear quiz, generate new one
        [self resetQuiz];
        [self.button setTitle:(@"Submit Quiz") forState:(UIControlStateNormal)];
    }else{
        NSLog(@"quiz has been submitted!");
        [self checkAnswers];
        [self.button setTitle:(@"New Quiz") forState:(UIControlStateNormal)];
    }
}

-(IBAction)closeKeyboard:(id)sender{
    [self.view endEditing:(YES)];
}

-(void)checkAnswers{
    NSLog(@"checkAnswers!");
    [self.quizHelper checkAnswers:(self.answers) answerFields:(self.answerTextFields) correctnessImages:(self.correctnessImages) correctImage:(self.correctImage) incorrectImage:(self.incorrectImage)];
}

-(void)resetQuiz{
    NSLog(@"resetQuiz!");
    [self.quizHelper resetQuiz:(self.answers) textFields:(self.answerTextFields) correctnessImages:(self.correctnessImages)];
    [self generateQuiz];
}

- (void)textFieldDidBeginEditing:(UITextField *)textField{
    if([self.quizHelper doesViewNeedToSlideUp:(textField) genericView:(self)]){
        [self.quizHelper slideMainViewUp:(self)];
        self.isSlidUp = true;
    }
}

- (void)textFieldDidEndEditing:(UITextField *)textField{
    if(self.isSlidUp){
        [self.quizHelper slideMainViewDown:(self)];
    }
}


@end
