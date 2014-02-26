//
//  ViewController.h
//  iMeme
//  Yes, is an actual assignment.
//  Created by Jacob Henry Prather on 2/25/14.
//  Copyright (c) 2014 jprather. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UIImagePickerControllerDelegate,UINavigationControllerDelegate>

@property(nonatomic, weak) IBOutlet UIImageView* imageView;
@property(nonatomic, weak) IBOutlet UITextView* top;
@property(nonatomic, weak) IBOutlet UITextView* bot;

@end
