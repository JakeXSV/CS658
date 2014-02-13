//
//  main.m
//  HelloObjectiveC
//
//  Created by jprather on 1/23/14.
//  Copyright (c) 2014 jprather. All rights reserved.
//

#import <Foundation/Foundation.h>

#define macroPrintString(e) (NSLog(@"%@",e))

// This function is more C style. check my other repos for proper objective-c functions
void functionPrintString(NSString *e){
    NSLog(@"%@", e);
}

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        // Data Types, variables, constants, primitive casting
        double const piConst = 3.14159;
        double helloDouble = 9000.1;
        int doubleCasted = (int)helloDouble;
        int helloInt = 22;
        NSString *immutable = @"This can't be changed.";
        NSMutableString *mutable = [NSMutableString stringWithString:@"This can be changed."];
        // Strings can also be made the way they are in C, char * or char []
        
        NSLog(@"It's over %.1f (double)", helloDouble);
        NSLog(@"helloDouble being casted %d", doubleCasted);
        NSLog(@"Here's an int %d", helloInt);
        NSLog(@"Pie is delicious %.5f", piConst); //%.Xf where X is the number of decimals.
        NSLog(@"%@", immutable);
        NSLog(@"%@", mutable);
        
        // Arithmetic Operations
        
        int addition = 5+7;
        int subtraction = 10-3;
        int multiplication = 5*3;
        double division = 10/3; // int=int/int = no good
        double modDivision = 6 % 2;
        
        NSLog(@"%d",addition);
        NSLog(@"%d",subtraction);
        NSLog(@"%d", multiplication);
        NSLog(@"%.5f", division);
        NSLog(@"%.5f", modDivision);
        
        // Conditionals & Comparators/Operators
        
        if(true){
            NSLog(@"If #1");
        }
        
        if(false){
            
        }else{
            NSLog(@"If #2");
        }
        
        if(false){
            
        }else if(false){
            
        }else if(true){
            NSLog(@"If #3");
        }
        
        if(1==1 && 3>2 && 3>=3 && 2!=3){
            NSLog(@"1 is equal to 1, 3 is greater than 2, 3 is greater than or equal to 3, 2 is not equal to 3.");
        }
        if(true || false){
            NSLog(@"or oerator");
        }
        
        // Switch
        int switchVar = 123;
        switch (switchVar){
            case 1:
                NSLog(@"switchVar is 1");
                break;
            case 2:
                NSLog(@"switchVar is 2");
                break;
            case 123:
                NSLog(@"switchVar is 123");
                break;
            default:
                NSLog(@"switch doesn't handle switchVar's value");
                break;
        }
        
    // Flow Control
        
        // While loop
        int i = 0;
        while(i<10){
            NSLog(@"%d", i);
            i++;
        }
        
        // For loop
        int z = 0;
        for (z=0;z<5;z++){
            NSLog(@"%d", z);
        }
        
        // For in / iterative
        NSArray *arrayOfCars = @[@"Challenger", @"Charger", @"GTO", @"Firebird"]; // fast-enumeration array obj-c specific
        for(id car in arrayOfCars){
            NSLog(@"%@", car);
        }
        
    // Macros
        // Inherited from C I believe. Defined at top of this file. Macros are a low-level way to define "functions",
        // what really happens is printString gets replaced with the snippet defined at runtime
        macroPrintString(@"macro test");
        
    // Functions
        functionPrintString(@"function test");
        
    }
    
    
    return 0;
}

