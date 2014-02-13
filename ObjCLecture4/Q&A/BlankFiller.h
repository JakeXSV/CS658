//
//  BlankFiller.h
//  ObjCLecture3
//
//  Created by jprather on 1/30/14.
//  Copyright (c) 2014 jprather. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Word.h"

@interface BlankFiller : NSObject

@property(nonatomic, strong) NSMutableArray *nouns;
@property(nonatomic, strong) NSMutableArray *verbs;
@property(nonatomic, strong) NSMutableArray *adjectives;
@property(nonatomic, strong) NSMutableArray *adverbs;
@property(nonatomic, strong) NSMutableArray *interjections;
@property(nonatomic, strong) NSMutableArray *templates;

-(id)init;
-(void)readWords;
-(void)addWord:(Word*)word;
-(Word*)getAWordWithPartOfSpeech:(PartOfSpeech)partOfSpeech;
-(NSString*)generate;

@end
