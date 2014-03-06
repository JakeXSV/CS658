//
//  SharedQuiz.m
//  MathHelper
//
//  Created by Jacob Henry Prather on 3/5/14.
//  Copyright (c) 2014 Jake. All rights reserved.
//

#import "SharedQuiz.h"

@interface SharedQuiz ()
@end

@implementation SharedQuiz

-(UIImage*)getCorrectImage{
    return [[UIImage alloc] initWithContentsOfFile:([[NSBundle mainBundle] pathForResource:@"correct" ofType:@"jpg"])];
}

-(UIImage*)getIncorrectImage{
    return [[UIImage alloc] initWithContentsOfFile:([[NSBundle mainBundle] pathForResource:@"incorrect" ofType:@"jpg"])];
}

-(void)setTextFieldDelegates:(NSArray*)answerTextFields AddSubQuiz:(AddSubQuizViewController*)addsub{
    for(UITextField* textField in answerTextFields){
        textField.delegate = addsub;
    }
}

-(void)setTextFieldDelegates:(NSArray*)answerTextFields MultDivQuiz:(MultDivQuizViewController*)multdiv{
    for(UITextField* textField in answerTextFields){
        textField.delegate = multdiv;
    }
}

-(void)checkAnswers:(NSMutableArray*)answers answerFields:(NSArray*)answerTextFields correctnessImages:(NSArray*)cI{
    for(int i=0;i<answers.count;++i){
        if([answers[i] isEqualToString:([answerTextFields[i] text])]){
            [cI[i] setImage:([self getCorrectImage])];
        }else{
            [cI[i] setImage:([self getIncorrectImage])];
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

@end
