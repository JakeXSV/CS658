//
//  WordTemplate.m
//  ObjCLecture3
//
//  Created by jprather on 1/30/14.
//  Copyright (c) 2014 jprather. All rights reserved.
//

#import "WordTemplate.h"

@implementation WordTemplate
{
    NSRange _nextBlankRange;
}

-(id)init{
    return [self initWithTemplate:(@"")];
}

-(id)initWithTemplate:(NSString*)template{
    self = [super init];
    if(self){
        _template = template;
        _filledTemplate = [NSMutableString stringWithString:(_template)];
    }
    return self;
}

-(PartOfSpeech)getNextBlankType{
    
    //something like this <adjective> string
    NSRange start = [_filledTemplate rangeOfString:(@"<")];
    if(start.length==0) {return UNKNOWN;}
    NSRange end = [_filledTemplate rangeOfString:(@">")];
    if(end.length==0) {return UNKNOWN;}
    
    _nextBlankRange = NSMakeRange(start.location, (end.location - start.location)+1);
    NSRange blankTypeRange = NSMakeRange(_nextBlankRange.location+1, _nextBlankRange.length-2);
    NSString *blank = [_filledTemplate substringWithRange:(blankTypeRange)];
    
    //NSLog(@"gNBT found: %@", blank);
    
    return [Word convertStringToPartOfSpeech:(blank)];
}

-(void)replaceNextBlankWithWord:(Word*)word{
    [_filledTemplate replaceCharactersInRange:(_nextBlankRange) withString:([word word])];
}

-(void)clearFilledTemplate{
    _filledTemplate = [NSMutableString stringWithString:(_template)];
}

-(NSString*)description{
    return _template;
}

@end
