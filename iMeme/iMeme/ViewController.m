//
//  ViewController.m
//  iMeme
//
//  Created by Jacob Henry Prather on 2/25/14.
//  Copyright (c) 2014 jprather. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property(nonatomic, assign) BOOL isSlidUp;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.top.hidden = true;
    self.bot.hidden = true;
    self.top.delegate = self;
    self.bot.delegate = self;
    self.isSlidUp = false;
    [[UIApplication sharedApplication] setStatusBarHidden:(YES)];
}

-(void)viewDidAppear:(BOOL)animated{
    [[UIApplication sharedApplication] setStatusBarHidden:(YES)];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)imageTapped:(id)sender{
    if(self.imageView.image == nil){
        UIImagePickerController* imagePicker = [[UIImagePickerController alloc]init];
        imagePicker.delegate = self;
    
        if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]){
            imagePicker.sourceType = UIImagePickerControllerSourceTypeCamera;
        }else{
            imagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        }
        [self presentViewController:imagePicker animated:YES completion:nil];
    }else{
        [self.view endEditing:YES];
    }
}

-(IBAction)moveTextView:(id)sender{
    UIPanGestureRecognizer* recog = (UIPanGestureRecognizer*) sender;
    CGPoint newCenter = [recog translationInView:(recog.view)];
    recog.view.center = CGPointMake(recog.view.center.x,recog.view.center.y+newCenter.y);
    [recog setTranslation:(CGPointZero) inView:(recog.view)];
}

-(void)imagePickerController:(UIImagePickerController*)picker didFinishPickingMediaWithInfo:(NSDictionary *)info{
    UIImage* image = [info objectForKey:UIImagePickerControllerOriginalImage];
    self.imageView.image = image;
    [self dismissViewControllerAnimated:(YES) completion:nil];
    
    self.top.hidden = false;
    self.bot.hidden = false;
    
    UIFont* font = [UIFont fontWithName:@"Impact" size:18];
    self.top.font = font;
    self.top.textColor = [UIColor whiteColor];
    self.top.layer.shadowColor = [[UIColor blackColor] CGColor];
    self.top.layer.shadowOffset = CGSizeMake(2.0f, 2.0f);
    self.top.layer.shadowOpacity = 1.0f;
    self.top.layer.shadowRadius = 2.0f;
    self.bot.font = font;
    self.bot.textColor = [UIColor whiteColor];
    self.bot.layer.shadowColor = [[UIColor blackColor] CGColor];
    self.bot.layer.shadowOffset = CGSizeMake(2.0f, 2.0f);
    self.bot.layer.shadowOpacity = 1.0f;
    self.bot.layer.shadowRadius = 2.0f;
}


- (void)textViewDidBeginEditing:(UITextView *)textView
{
    if([self doesViewNeedToSlideUp:(textView)]){
        [self slideMainViewUp];
        self.isSlidUp = true;
    }

}

- (void)textViewDidEndEditing:(UITextView *)textView
{
    if(self.isSlidUp){
        [self slideMainViewDown];
    }
}

-(BOOL)doesViewNeedToSlideUp:(UITextView *)textView{
    CGFloat screenHeight = self.view.bounds.size.height;
    CGFloat keyboardHeight = [self getKeyboardHeight];
    if(textView.center.y >= (screenHeight - keyboardHeight)){
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
