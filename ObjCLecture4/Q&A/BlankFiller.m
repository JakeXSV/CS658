//
//  BlankFiller.m
//  ObjCLecture3 51:45
//
//  Created by jprather on 1/30/14.
//  Copyright (c) 2014 jprather. All rights reserved.
//

#import "BlankFiller.h"
#import "Word.h"
#import "WordTemplate.h"

@implementation BlankFiller

-(id)init{
    self = [super init];
    if(self){
        _nouns = [[NSMutableArray alloc]init];
        _verbs = [[NSMutableArray alloc]init];
        _adjectives = [[NSMutableArray alloc]init];
        _adverbs = [[NSMutableArray alloc]init];
        _interjections = [[NSMutableArray alloc]init];
        _templates = [[NSMutableArray alloc]init];
        [self readWords];
    }
    return self;
}

// Reads words from file in format <partOfSpeech>,wordOfSPeech
-(void)readWords{
    
    NSString* filePath = [[NSBundle mainBundle] pathForResource:(@"wordList") ofType:(@"txt")];
    NSError* error;
    NSString* fileContents = [NSString stringWithContentsOfFile:(filePath) encoding:(NSUTF8StringEncoding) error:(&error)];
    
    if(error){NSLog(@"%@",[error localizedFailureReason]);return;}
    
    NSArray* fileLines = [fileContents componentsSeparatedByString:(@"\n")];
    NSArray* line;
    Word* wordEntry;
    
    for(NSString* fileLine in fileLines){
        line = [fileLine componentsSeparatedByString:(@":")];
        if([line count] == 2){
            wordEntry = [[Word alloc]initWithWord:([line objectAtIndex:(0)]) partOfSpeech:([Word convertStringToPartOfSpeech:([line objectAtIndex:(1)])])];
            [self addWord:(wordEntry)];
        }
    }
    
}

-(void)addWord:(Word*)word{
    if([word partOfSpeech] == NOUN){
        [_nouns addObject:(word)];
    }
    else if([word partOfSpeech] == NOUN){
        [_verbs addObject:(word)];
    }
    else if([word partOfSpeech] == ADJECTIVE){
        [_adjectives addObject:(word)];
    }
    else if([word partOfSpeech] == ADVERB){
        [_adverbs addObject:(word)];
    }
    else if([word partOfSpeech] == VERB){
        [_verbs addObject:(word)];
    }
    else if([word partOfSpeech] == INTERJECTION){
        [_interjections addObject:(word)];
    }
}

-(Word*)getAWordWithPartOfSpeech:(PartOfSpeech)partOfSpeech{
    if(partOfSpeech == NOUN){
        return [_nouns objectAtIndex:(arc4random_uniform((int)[_nouns count]))];
    }
    else if(partOfSpeech == ADJECTIVE){
        return [_adjectives objectAtIndex:(arc4random_uniform((int)[_adjectives count]))];
    }
    else if(partOfSpeech == ADVERB){
        return [_adverbs objectAtIndex:(arc4random_uniform((int)[_adverbs count]))];
    }
    else if(partOfSpeech == ADJECTIVE){
        return [_adjectives objectAtIndex:(arc4random_uniform((int)[_adjectives count]))];
    }
    else if(partOfSpeech == VERB){
        return [_verbs objectAtIndex:(arc4random_uniform((int)[_verbs count]))];
    }
    else if(partOfSpeech == INTERJECTION){
        return [_interjections objectAtIndex:(arc4random_uniform((int)[_interjections count]))];
    }
    NSLog(@"RETURNIN NIL!!!");
    return nil;
}

-(NSString*)generate{
    if ([_templates count]==0){return @"No templates found.";}
    
    WordTemplate* currTemplate = [_templates objectAtIndex:(arc4random_uniform((int)[_templates count]))];
    
    BOOL valid = true;
    
    while(valid){
        //Get next blank/part of speech
        PartOfSpeech currSpeech = [currTemplate getNextBlankType];
        //NSLog(@"%@", currSpeech);
        if(currSpeech != UNKNOWN){
            //get appropriate word according to the blank's part of speech
            Word* repWord = [self getAWordWithPartOfSpeech:(currSpeech)];
            //replace the blank in the template with word
            [currTemplate replaceNextBlankWithWord:(repWord)];
        }else{
            valid = false;
        }
    }
    
    return [currTemplate filledTemplate];
}

@end
