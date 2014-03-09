//
//  ViewController.m
//  Soundboard
//
//  Created by Jake on 3/8/14.
//  Copyright (c) 2014 Jake. All rights reserved.
//

#import "SoundBoardViewController.h"

@interface SoundBoardViewController ()
@property(nonatomic, strong) NSMutableArray* sounds;
@end

@implementation SoundBoardViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    _sounds = [[NSMutableArray alloc]init];
    NSError* error=nil;
    AVAudioPlayer* audioPlayer;
    NSURL* soundUrl;
    
    soundUrl = [[NSBundle mainBundle] URLForResource:(@"bears") withExtension:(@"mp3")];
    audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:(soundUrl) error:&error];
    [audioPlayer prepareToPlay];
    [audioPlayer play];
    
    NSLog(@"%d", [audioPlayer isPlaying]);
    //[self addSounds];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)addSounds{

    NSError* error;
    AVAudioPlayer* audioPlayer;
    NSURL* soundUrl;
    NSString* soundPath;
    NSString* soundName;
    Sound* soundBit;
    
    soundPath = [[NSBundle mainBundle] pathForResource:(@"afternoondelight") ofType:(@"mp3")];
    soundUrl = [NSURL fileURLWithPath:(soundPath)];
    audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:(soundUrl) error:&error];
    soundName = @"POINTLESS?";
    soundBit = [[Sound alloc]initWithName:(soundName) audioPlayer:(audioPlayer)];
    [self.sounds addObject:(soundBit)];

    /*
     [self.sounds addObject:([self createSoundBit:(@"Bears") path:(@"bears")])];
    [self.sounds addObject:([self createSoundBit:(@"I Love Scotch") path:(@"ilovescotch")])];
    [self.sounds addObject:([self createSoundBit:(@"Milk Was a Bad Choice") path:(@"milkwasabadchoice")])];
    [self.sounds addObject:([self createSoundBit:(@"Oh Baxter...") path:(@"ohbaxter")])];
    [self.sounds addObject:([self createSoundBit:(@"Punch") path:(@"punch")])];
    [self.sounds addObject:([self createSoundBit:(@"San Diago") path:(@"sandiago")])];
    [self.sounds addObject:([self createSoundBit:(@"Slap You In Public") path:(@"slap")])];
    [self.sounds addObject:([self createSoundBit:(@"Smelly Pirate") path:(@"smellypirate")])];
    */
}

-(Sound*)createSoundBit:(NSString*)name path:(NSString*)path{
    NSError* error;
    AVAudioPlayer* audioPlayer;
    NSURL* soundUrl;
    NSString* soundPath;
    NSString* soundName;
    Sound* soundBit;
    
    soundPath = [[NSBundle mainBundle] pathForResource:(path) ofType:(@"mp3")];
    soundUrl = [NSURL fileURLWithPath:(soundPath)];
    audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:(soundUrl) error:&error];
    soundName = name;
    soundBit = [[Sound alloc]initWithName:(soundName) audioPlayer:(audioPlayer)];
    return soundBit;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.sounds count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    // Create cell
    static NSString* CellIdentifier=@"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:(CellIdentifier) forIndexPath:(indexPath)];
    // Configure cell
    cell.textLabel.text = [[self.sounds objectAtIndex:(indexPath.row)] name];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    /*
    Sound* soundToBePlayed = [self.sounds objectAtIndex:(indexPath.row)];
    [soundToBePlayed.audioPlayer prepareToPlay];
    [soundToBePlayed.audioPlayer play];
     */
}

@end
