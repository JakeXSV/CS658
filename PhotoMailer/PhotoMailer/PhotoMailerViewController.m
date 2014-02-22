//
//  ViewController.m
//  PhotoMailer
//
//  Created by Jake on 2/21/14.
//  Copyright (c) 2014 Jake. All rights reserved.
//

#import "PhotoMailerViewController.h"

@interface PhotoMailerViewController ()

@end

@implementation PhotoMailerViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}

-(void)viewDidAppear:(BOOL)animated{
    //gtfo status bar
    [[UIApplication sharedApplication] setStatusBarHidden:(YES)];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//Respond to gestures
-(IBAction)imageTapped:(id)sender{
    UIImagePickerController* imagePicker = [[UIImagePickerController alloc]init];
    imagePicker.delegate = self;
    if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]){
        imagePicker.sourceType = UIImagePickerControllerSourceTypeCamera;
    }else{
        imagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    }
    
    [self presentViewController:imagePicker animated:YES completion:nil];
}

-(IBAction)imageLongPressed:(id)sender{
    MFMailComposeViewController* mailComposer = [[MFMailComposeViewController alloc]init];
    mailComposer.mailComposeDelegate = self;
    NSData* data = UIImagePNGRepresentation(self.imageView.image);
    [mailComposer addAttachmentData:(data) mimeType:(@"image/png") fileName:(@"PhotoMailerImage")];
    
    [self presentViewController:(mailComposer) animated:(YES) completion:nil];
}


// Delegate Fn
-(void)imagePickerController:(UIImagePickerController*)picker didFinishPickingMediaWithInfo:(NSDictionary *)info{
    UIImage* image = [info objectForKey:UIImagePickerControllerOriginalImage];
    self.imageView.image = image;
    
    [self dismissViewControllerAnimated:(YES) completion:nil];
}

-(void)mailComposeController:(MFMailComposeViewController*)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error{
    
    [self dismissViewControllerAnimated:(YES) completion:nil];
}

@end
