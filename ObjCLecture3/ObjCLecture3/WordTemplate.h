//
//  WordTemplate.h
//  ObjCLecture3
//
//  Created by jprather on 1/30/14.
//  Copyright (c) 2014 jprather. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Word.h"

@interface WordTemplate : NSObject

@property(nonatomic, strong) NSString *template;
@property(nonatomic, strong) NSMutableString *filledTemplate;

-(id)init;
-(id)initWithTemplate:(NSString*)template;

-(PartOfSpeech)getNextBlankType;
-(void)replaceNextBlankWithWord:(Word*)word;
-(void)clearFilledTemplate;
-(NSString*)description;

@end
