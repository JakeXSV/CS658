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
    
    UIView * headSeparator = [[UIView alloc] initWithFrame:CGRectMake(self.textTextView.frame.origin.x, self.textTextView.frame.origin.y, self.textTextView.frame.size.width, 1)];
    headSeparator.backgroundColor = [UIColor colorWithWhite:0.7 alpha:1];
    UIView * topSeparator = [[UIView alloc] initWithFrame:CGRectMake(self.completedSwitchLabel.frame.origin.x, self.completedSwitchLabel.frame.origin.y-15, self.textTextView.frame.size.width, 1)];
    topSeparator.backgroundColor = [UIColor colorWithWhite:0.7 alpha:1];
    UIView * botSeparator = [[UIView alloc] initWithFrame:CGRectMake(self.dueDateLabel.frame.origin.x, self.dueDateLabel.frame.origin.y+25, self.textTextView.frame.size.width, 1)];
    botSeparator.backgroundColor = [UIColor colorWithWhite:0.7 alpha:1];
    [self.view addSubview:headSeparator];
    [self.view addSubview:topSeparator];
    [self.view addSubview:botSeparator];
    self.dueDateDateLabel.text = self.item.dueDateDateLabelText;
    self.navigationItem.title = self.item.title;
    self.titleTextField.text = self.item.title;
    if(self.item.text != nil){
        self.textTextView.text = self.item.text;
        self.textTextView.textColor = [UIColor blackColor];
    }
    if(self.item.isCompleted){
        self.completedSwitch.on = YES;
    }
    if([self.dueDateDateLabel.text isEqualToString:(@"None")]){
        self.dueDatePicker.hidden = YES;
    }else{
        self.dueDatePicker.hidden = YES;
        self.dueDateDateLabel.textColor = [UIColor blackColor];
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

-(IBAction)dateHasBeenSet{
    NSDateFormatter* fmt = [[NSDateFormatter alloc]init];
    [fmt setDateFormat:(@"MMMM d 'at' h:mm a")];
    self.item.dueDateDateLabelText = [fmt stringFromDate:(self.dueDatePicker.date)];
    self.dueDateDateLabel.text = self.item.dueDateDateLabelText;
    self.dueDateDateLabel.textColor = [UIColor blackColor];
    self.dueDatePicker.hidden = YES;
}

-(IBAction)editDueDate{
    if(self.dueDatePicker.hidden){
        self.dueDatePicker.hidden = NO;
    }
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
