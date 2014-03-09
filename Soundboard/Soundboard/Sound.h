//
//  Sound.h
//  Soundboard
//
//  Created by Jake on 3/8/14.
//  Copyright (c) 2014 Jake. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>

@interface Sound : NSObject

@property(nonatomic, strong) NSString* name;
@property(nonatomic, strong) AVAudioPlayer* audioPlayer;

-(id)initWithName:(NSString*)name audioPlayer:(AVAudioPlayer*)audioPlayer;

@end
