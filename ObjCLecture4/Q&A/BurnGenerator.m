//
//  BurnGenerator.m
//  ObjCLecture3
//
//  Created by Jacob Henry Prather on 2/4/14.
//  Copyright (c) 2014 jprather. All rights reserved.
//

#import "BurnGenerator.h"
#import "WordTemplate.h"

@implementation BurnGenerator

-(id)init{
    self = [super init];
    if(self){
        [self readBurnTemplates];
    }
    return self;
}

-(void)readBurnTemplates{
    
    NSMutableArray* burnTemplates = [[NSMutableArray alloc]init];
    
    NSString* filePath = [[NSBundle mainBundle] pathForResource:(@"burnTemplateList") ofType:(@"txt")];
    NSError* error;
    NSString* fileContents = [NSString stringWithContentsOfFile:(filePath) encoding:(NSUTF8StringEncoding) error:(&error)];
    
    if(error){NSLog(@"%@",[error localizedFailureReason]);return;}
    
    NSArray* fileLines = [fileContents componentsSeparatedByString:(@"\n")];
    
    for(NSString* fileLine in fileLines){
        //NSLog(@"%@",fileLine);
        WordTemplate* temp = [[WordTemplate alloc] initWithTemplate:(fileLine)];
        [burnTemplates addObject:(temp)];
    }
    
    [self setTemplates:(burnTemplates)];
}


@end
