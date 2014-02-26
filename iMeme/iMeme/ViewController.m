//
//  ViewController.m
//  iMeme
//
//  Created by Jacob Henry Prather on 2/25/14.
//  Copyright (c) 2014 jprather. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.top.hidden = true;
    self.bot.hidden = true;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//Respond to gestures
-(IBAction)imageTapped:(id)sender{
    NSLog(@"HIT!");
    UIImagePickerController* imagePicker = [[UIImagePickerController alloc]init];
    imagePicker.delegate = self;
    if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]){
        imagePicker.sourceType = UIImagePickerControllerSourceTypeCamera;
    }else{
        imagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    }
    [self presentViewController:imagePicker animated:YES completion:nil];
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


@end
