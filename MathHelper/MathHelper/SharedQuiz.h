//
//  SharedQuiz.h
//  MathHelper
//
//  Created by Jacob Henry Prather on 3/5/14.
//  Copyright (c) 2014 Jake. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "MultDivQuizViewController.h"
#import "AddSubQuizViewController.h"

@interface SharedQuiz : NSObject

-(UIImage*)getCorrectImage;
-(UIImage*)getIncorrectImage;

-(void)setTextFieldDelegates:(NSArray*)answerTextFields MultDivQuiz:(MultDivQuizViewController*)multdiv;
-(void)setTextFieldDelegates:(NSArray*)answerTextFields AddSubQuiz:(AddSubQuizViewController*)addsub;

-(void)checkAnswers:(NSMutableArray*)answers answerFields:(NSArray*)answerTextFields correctnessImages:(NSArray*)cI;

@end
