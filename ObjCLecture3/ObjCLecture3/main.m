//
//  main.m
//  ObjCLecture3
//
//  Created by jprather on 1/30/14.
//  Copyright (c) 2014 jprather. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BlankFiller.h"
#import "BurnGenerator.h"
#import "MadLibGenerator.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        BurnGenerator* burns = [[BurnGenerator alloc]init];
        MadLibGenerator* ml = [[MadLibGenerator alloc]init];
        
        for(int i=0;i<3;i++){
            NSString* bdata = [burns generate];
            NSLog(@"%@\n ",bdata);
        }
        
        for(int z=0;z<3;z++){
            NSString* mldata = [ml generate];
            NSLog(@"%@\n ",mldata);
        }
        
    }
    return 0;
}

