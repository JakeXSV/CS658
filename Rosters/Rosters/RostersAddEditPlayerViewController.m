//
//  RostersEditPlayerViewController.m
//  Rosters
//
//  Created by Jake on 3/31/14.
//  Copyright (c) 2014 Jake. All rights reserved.
//

#import "RostersAddEditPlayerViewController.h"
#import "RostersPlayerWebViewViewController.h"

@interface RostersAddEditPlayerViewController ()
@property(nonatomic, assign) BOOL isSlidUp;
@end

@implementation RostersAddEditPlayerViewController

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
    self.firstNameTextField.text = self.player.firstName;
    self.lastNameTextField.text = self.player.lastName;
    self.positionLabel.text = self.player.position;
    self.urlTextField.text = self.player.url;
    self.isSlidUp = false;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(BOOL)textFieldShouldReturn:(UITextField*)textField{
    [textField resignFirstResponder];
    return NO;
}

-(IBAction)savePlayerEditing{
    self.player.firstName   = self.firstNameTextField.text;
    self.player.lastName    = self.lastNameTextField.text;
    self.player.url         = self.urlTextField.text;
    [self.navigationController popViewControllerAnimated:(YES)];
}

-(IBAction)cancelPlayerEditing{
    [self.navigationController popViewControllerAnimated:(YES)];
}

- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    if([self doesViewNeedToSlideUp:(textField)]){
        [self slideMainViewUp];
        self.isSlidUp = true;
    }
    
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
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

@end
