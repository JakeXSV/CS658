//
//  TodoListItemDetailViewController.m
//  TodoList
//
//  Created by Jake on 3/18/14.
//  Copyright (c) 2014 Jake. All rights reserved.
//

#import "TodoListItemDetailViewController.h"
#import "TodoListItem.h"

@interface TodoListItemDetailViewController ()

@end

@implementation TodoListItemDetailViewController

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
}

-(void)viewWillAppear:(BOOL)animated{
    // use this for segues
    self.navigationItem.title = self.item.title;
    self.titleTextField.text = self.item.title;
    if(self.item.text != nil){
        self.textTextView.text = self.item.text;
        self.textTextView.textColor = [UIColor blackColor];
    }
    if(self.item.isCompleted){
        self.completedSwitch.on = YES;
    }
}

-(void)viewWillDisappear:(BOOL)animated{
    
    self.item.text = [NSMutableString stringWithString:self.textTextView.text];
    self.item.title = [NSMutableString stringWithString:self.titleTextField.text];
    self.item.isCompleted = self.completedSwitch.isOn;
    if(![self.textTextView.text isEqualToString:@"Notes"]){
        self.item.text = [NSMutableString stringWithString:(self.textTextView.text)];
    }else{
        
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)textViewDidBeginEditing:(UITextView *)textView{
    if([textView.text isEqualToString:@"Notes"]){
        self.textTextView.text = @"";
        self.textTextView.textColor = [UIColor blackColor];
    }
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return NO;
}

-(IBAction)screenTapped{
    [self.view endEditing:(YES)];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end