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

-(void)checkAnswers:(NSMutableArray*)answers answerFields:(NSArray*)answerTextFields correctnessImages:(NSArray*)cI correctImage:(UIImage*)correct incorrectImage:(UIImage*)incorrect{
    for(int i=0;i<answers.count;++i){
        NSLog(@"%@ == %@", answers[i], [answerTextFields[i] text]);
        if([answers[i] isEqualToString:([answerTextFields[i] text])]){
            [cI[i] setImage:(correct)];
        }else{
            [cI[i] setImage:(incorrect)];
        }
    }
}

-(void)resetQuiz:(NSMutableArray*)answers textFields:(NSArray*)answerTextFields correctnessImages:(NSArray*)cI{
    [answers removeAllObjects];
    for(UITextField* answerText in answerTextFields){
        [answerText setText:(@"")];
    }
    for(UIImageView* imageView in cI){
        [imageView setImage:(nil)];
    }
}

-(BOOL)doesViewNeedToSlideUp:(UITextField *)textField genericView:(UIViewController*)view{
    CGFloat screenHeight = view.view.bounds.size.height;
    CGFloat keyboardHeight = [self getKeyboardHeight];
    if(textField.center.y >= (screenHeight - keyboardHeight)){
        return YES;
    }else{
        return NO;
    }
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


-(void)slideMainViewUp:(UIViewController*)view{
    [UIView beginAnimations:nil context: nil];
    [UIView setAnimationDuration: 0.3];
    CGFloat keyboardHeight = [self getKeyboardHeight];
    if ([[UIApplication sharedApplication] statusBarOrientation] == UIInterfaceOrientationPortrait){
        view.view.frame = CGRectOffset([[UIScreen mainScreen]bounds],0,-keyboardHeight);
    }else{
        if([[UIApplication sharedApplication] statusBarOrientation] == UIInterfaceOrientationLandscapeLeft){
            view.view.frame = CGRectOffset([[UIScreen mainScreen]bounds],-keyboardHeight,0);
        }else{
            view.view.frame = CGRectOffset([[UIScreen mainScreen]bounds],keyboardHeight,0);
        }
    }
    [UIView commitAnimations];
}

-(void)slideMainViewDown:(UIViewController*)view{
    [UIView beginAnimations:nil context: nil];
    [UIView setAnimationDuration: 0.3];
    view.view.frame = CGRectOffset([[UIScreen mainScreen]bounds],0,0);
    [UIView commitAnimations];
}

@end
