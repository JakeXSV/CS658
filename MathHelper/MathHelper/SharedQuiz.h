//
//  SharedQuiz.h
//  MathHelper
//
//  Created by Jake on 3/5/14.
//  Copyright (c) 2014 Jake. All rights reserved.
//


#import <UIKit/UIKit.h>

@class MultDivQuizViewController;
@class AddSubQuizViewController;

@interface SharedQuiz : NSObject

-(UIImage*)getCorrectImage;
-(UIImage*)getIncorrectImage;

-(void)setTextFieldDelegates:(NSArray*)answerTextFields MultDivQuiz:(MultDivQuizViewController*)multdiv;

-(void)setTextFieldDelegates:(NSArray*)answerTextFields AddSubQuiz:(AddSubQuizViewController*)addsub;

-(void)checkAnswers:(NSMutableArray*)answers answerFields:(NSArray*)answerTextFields correctnessImages:(NSArray*)cI correctImage:(UIImage*)correct incorrectImage:(UIImage*)incorrect;

-(void)resetQuiz:(NSMutableArray*)answers textFields:(NSArray*)answerTextFields correctnessImages:(NSArray*)cI;

-(BOOL)doesViewNeedToSlideUp:(UITextField *)textField genericView:(UIViewController*)view;

-(void)slideMainViewUp:(UIViewController*)view;

-(void)slideMainViewDown:(UIViewController*)view;

-(CGFloat)getKeyboardHeight;

@end
