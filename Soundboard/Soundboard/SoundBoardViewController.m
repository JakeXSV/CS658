//
//  ViewController.m
//  Soundboard
//
//  Created by Jake on 3/8/14.
//  Copyright (c) 2014 Jake. All rights reserved.
//

#import "SoundBoardViewController.h"

@interface SoundBoardViewController ()
@property(nonatomic, strong) NSMutableArray* anchormanSounds;
@property(nonatomic, strong) NSMutableArray* otherMovieSounds;
@property(nonatomic, strong) UITableView* movieView;
@property(nonatomic, strong) UITableView* otherView;
@property(nonatomic, strong) NSMutableArray* otherSounds;
@property(nonatomic, strong) AVAudioPlayer *player;
@property(nonatomic, assign) BOOL isMovie;
@end

@implementation SoundBoardViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.anchormanSounds = [[NSMutableArray alloc]init];
    self.otherMovieSounds = [[NSMutableArray alloc]init];
    self.otherSounds = [[NSMutableArray alloc]init];
    self.isMovie = true;
    self.movieSelector.delegate = self;
    [self addmovieSounds];
    [self addOtherSounds];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

-(void)addmovieSounds{
    [self.anchormanSounds addObject:([self createSoundBit:(@"Punch") path:(@"punch")])];
    [self.anchormanSounds addObject:([self createSoundBit:(@"Slap You In Public") path:(@"slap")])];
    [self.anchormanSounds addObject:([self createSoundBit:(@"Smelly Pirate") path:(@"smellypirate")])];
    [self.anchormanSounds addObject:([self createSoundBit:(@"Bears") path:(@"bears")])];
    [self.anchormanSounds addObject:([self createSoundBit:(@"Afternoon Delight") path:(@"afternoondelight")])];
    [self.anchormanSounds addObject:([self createSoundBit:(@"Baxter Budha") path:(@"baxterbudha")])];
    [self.anchormanSounds addObject:([self createSoundBit:(@"Loud Noises") path:(@"loudnoises")])];
    [self.anchormanSounds addObject:([self createSoundBit:(@"I Love Scotch") path:(@"ilovescotch")])];
    [self.anchormanSounds addObject:([self createSoundBit:(@"Milk Was a Bad Choice") path:(@"milkwasabadchoice")])];
    [self.anchormanSounds addObject:([self createSoundBit:(@"Oh Baxter...") path:(@"ohbaxter")])];
    [self.anchormanSounds addObject:([self createSoundBit:(@"San Diago") path:(@"sandiago")])];
    
    [self.otherMovieSounds addObject:([self createSoundBit:(@"Freedom Isn't Free") path:(@"freedomisntfree")])];
    [self.otherMovieSounds addObject:([self createSoundBit:(@"Matt Damon") path:(@"mattdamon")])];
    [self.otherMovieSounds addObject:([self createSoundBit:(@"Dayman") path:(@"dayman")])];
    [self.otherMovieSounds addObject:([self createSoundBit:(@"Job Land") path:(@"jobland")])];
}

-(void)addOtherSounds{
    [self.otherSounds addObject:([self createSoundBit:(@"Game Of Thrones") path:(@"catgot")])];
    [self.otherSounds addObject:([self createSoundBit:(@"Dr.Steve Brule") path:(@"drstevebruleplanets")])];
    [self.otherSounds addObject:([self createSoundBit:(@"Never Go..") path:(@"fullretard")])];
    [self.otherSounds addObject:([self createSoundBit:(@"Now You're A Man!") path:(@"nowyoureaman")])];
    [self.otherSounds addObject:([self createSoundBit:(@"Space Jam Mix") path:(@"spacejam")])];
    [self.otherSounds addObject:([self createSoundBit:(@"Thomas The Dank Engine") path:(@"thomasthedankengine")])];
    [self.otherSounds addObject:([self createSoundBit:(@"Truck Yeah") path:(@"truckyeah")])];
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

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    if(self.isMovie){
        return 2;
    }else{
        return 1;
    }
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    NSString *sectionName;
    if(self.isMovie){
        switch (section)
        {
            case 0:
                sectionName = NSLocalizedString(@"Anchorman", @"Anchorman");
                break;
            case 1:
                sectionName = NSLocalizedString(@"Other", @"Other");
                break;
            default:
                sectionName = @"";
                break;
        }
    }
    return sectionName;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if(self.isMovie){
        if(section==0){
            return [self.anchormanSounds count];
        }else{
            return [self.otherMovieSounds count];
        }
    }else{
        return [self.otherSounds count];
    }
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    // Create cell
    static NSString* CellIdentifier=@"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:(CellIdentifier) forIndexPath:(indexPath)];
    
    // Determine cell text
    if(self.isMovie){
        if(indexPath.section==0){
            cell.textLabel.text = [[self.anchormanSounds objectAtIndex:(indexPath.row)] name];
        }else{
            cell.textLabel.text = [[self.otherMovieSounds objectAtIndex:(indexPath.row)] name];
        }
        cell.imageView.image = [UIImage imageNamed:@"aTableViewImage.jpg"];
    }else{
        cell.imageView.image = [[UIImage alloc]init];
        cell.textLabel.text = [[self.otherSounds objectAtIndex:(indexPath.row)] name];
    }
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if(self.isMovie){
        if(indexPath.section==0){
            [self playSoundFromSoundList:(self.anchormanSounds) atSpot:(indexPath.row)];
        }else{
            [self playSoundFromSoundList:(self.otherMovieSounds) atSpot:(indexPath.row)];
        }
    }else{
        [self playSoundFromSoundList:(self.otherSounds) atSpot:(indexPath.row)];
    }
}

-(void)playSoundFromSoundList:(NSMutableArray*)soundList atSpot:(NSInteger)spot{
    Sound* soundToBePlayed = [soundList objectAtIndex:(spot)];
    [_player stop];
    _player = [soundToBePlayed audioPlayer];
    [_player play];
}

-(void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item{
    if ([[item title] isEqualToString:(@"Movies")]){
        self.isMovie = true;
    }else if([[item title] isEqualToString:(@"Other")]){
        self.isMovie = false;
    }else{
        [_player stop];
        if(self.isMovie){
           [tabBar setSelectedItem:(_movies)];
        }else{
           [tabBar setSelectedItem:(_other)];
        }
    }
    [self.tableView reloadData];
}

@end
