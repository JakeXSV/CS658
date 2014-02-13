//
//  main.m
//  HelloOOPObjC
//
//  Created by Jacob Henry Prather on 1/23/14.
//  Copyright (c) 2014 jprather. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Square.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        Square *mySquare = [[Square alloc] init];
        NSLog(@"%@", mySquare.shapeName);
        
    }
    return 0;
}

