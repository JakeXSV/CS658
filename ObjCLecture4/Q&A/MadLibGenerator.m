//
//  MadLibGenerator.m
//  ObjCLecture3
//
//  Created by Jacob Henry Prather on 2/4/14.
//  Copyright (c) 2014 jprather. All rights reserved.
//

#import "MadLibGenerator.h"
#import "WordTemplate.h"

@implementation MadLibGenerator

-(id)init{
    self = [super init];
    if(self){
        [self readMadLibTemplates];
    }
    return self;
}

-(void)readMadLibTemplates{
    
    NSMutableArray* madLibTemplates = [[NSMutableArray alloc]init];
    
    NSString* filePath = [[NSBundle mainBundle] pathForResource:(@"madLibTemplateList") ofType:(@"txt")];
    NSError* error;
    NSString* fileContents = [NSString stringWithContentsOfFile:(filePath) encoding:(NSUTF8StringEncoding) error:(&error)];
    
    if(error){NSLog(@"%@",[error localizedFailureReason]);return;}
    
    NSArray* fileLines = [fileContents componentsSeparatedByString:(@"\n")];
    NSString* madLibString = [[NSString alloc]init];
    
    for(NSString* fileLine in fileLines){
        if([fileLine isEqualToString:(@"")]){
            //Add complete template
            WordTemplate* temp = [[WordTemplate alloc] initWithTemplate:(madLibString)];
            [madLibTemplates addObject:(temp)];
            madLibString = [[NSString alloc]init];
        }else{
            //Add to string
            madLibString = [madLibString stringByAppendingString:(fileLine)];
            madLibString = [madLibString stringByAppendingString:(@" ")];
        }
    }
    
    [self setTemplates:(madLibTemplates)];
}


@end
