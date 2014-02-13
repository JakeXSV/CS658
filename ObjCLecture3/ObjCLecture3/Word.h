//
//  Word.h
//  ObjCLecture3
//
//  Created by jprather on 1/30/14.
//  Copyright (c) 2014 jprather. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum{UNKNOWN, NOUN, VERB, ADJECTIVE, ADVERB, INTERJECTION} PartOfSpeech;

@interface Word : NSObject

@property(nonatomic, strong) NSString* word;
@property(nonatomic) PartOfSpeech partOfSpeech;

+(PartOfSpeech)convertStringToPartOfSpeech:(NSString*)n;

-(id)init; // prototyped because inheritance occurs
-(id)initWithWord:(NSString*)word partOfSpeech:(PartOfSpeech)partOfSpeech;
-(id)initWithWord:(NSString*)word;

@end
