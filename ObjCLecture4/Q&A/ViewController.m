//
//  ViewController.m
//  Q&A
//
//  Created by Jake on 2/8/14.
//  Copyright (c) 2014 Jake. All rights reserved.
//

#import "ViewController.h"
#import "BurnGenerator.h"
#import "MadLibGenerator.h"
#import "WordTemplate.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)genBurn:(id)sender{
    NSLog(@"GET NEW BURN!");
    BurnGenerator* burns = [[BurnGenerator alloc]init];
    NSString * data = [burns generate];
    NSMutableArray* test = [burns templates];
    for(int i=0;i<[test count];i++){
        [[test objectAtIndex:(i)] clearFilledTemplate];
    }
    [_templateLabel setText:(data)];
}
-(IBAction)genMadLib:(id)sender{
    NSLog(@"GET NEW MADLIB");
    MadLibGenerator* madLibs = [[MadLibGenerator alloc]init];
    NSString * data = [madLibs generate];
    NSMutableArray* test = [madLibs templates];
    for(int i=0;i<[test count];i++){
        [[test objectAtIndex:(i)] clearFilledTemplate];
    }
    [_templateLabel setText:(data)];
}

@end
