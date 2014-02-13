//
//  Word.m
//  ObjCLecture3
//
//  Created by jprather on 1/30/14.
//  Copyright (c) 2014 jprather. All rights reserved.
//

#import "Word.h"


@implementation Word

-(id)init{
    return [self initWithWord:(@"ERR") partOfSpeech:(UNKNOWN)];
}
-(id)initWithWord:(NSString*)word partOfSpeech:(PartOfSpeech)partOfSpeech{ // Designated init
    self = [super init];
    if(self){
        _word = word;
        _partOfSpeech = partOfSpeech;
    }
    return self;
}
-(id)initWithWord:(NSString*) word{
    return [self initWithWord:(word) partOfSpeech:(UNKNOWN)];
}

+(PartOfSpeech)convertStringToPartOfSpeech:(NSString*)n{
    if([n isEqualToString:@"noun"]){
        return NOUN;
    }
    else if([n isEqualToString:@"adjective"]){
        return ADJECTIVE;
    }
    else if([n isEqualToString:@"adverb"]){
        return ADVERB;
    }
    else if([n isEqualToString:@"verb"]){
        return VERB;
    }
    else if([n isEqualToString:@"interjection"]){
        return INTERJECTION;
    }else{
        return UNKNOWN;
    }
}

-(NSString*)description{
    return _word;
}

@end
