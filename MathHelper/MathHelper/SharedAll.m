//
//  SharedAll.m
//  MathHelper
//
//  Created by Jacob Henry Prather on 3/5/14.
//  Copyright (c) 2014 Jake. All rights reserved.
//

#import "SharedAll.h"

@implementation SharedAll

-(int)getRandomNumber{
    return arc4random_uniform(99) + 1;
}

-(int)getRandomOperation{
    return arc4random_uniform(2);
}



@end
