//
//  Sound.m
//  Soundboard
//
//  Created by Jake on 3/8/14.
//  Copyright (c) 2014 Jake. All rights reserved.
//

#import "Sound.h"

@implementation Sound

-(id)initWithName:(NSString*)name audioPlayer:(AVAudioPlayer*)audioPlayer{
    self = [super init];
    if(self){
        _name = name;
        _audioPlayer = audioPlayer;
    }
    return self;
}

-(id)init:(id)sender{
    return [self initWithName:(@"") audioPlayer:([[AVAudioPlayer alloc]init])];
}

@end
