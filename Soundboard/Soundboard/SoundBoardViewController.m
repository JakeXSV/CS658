//
//  ViewController.m
//  Soundboard
//
//  Created by Jake on 3/8/14.
//  Copyright (c) 2014 Jake. All rights reserved.
//

#import "SoundBoardViewController.h"

@interface SoundBoardViewController ()
@property(nonatomic, strong) NSMutableArray* anchormanInsultSounds;
@property(nonatomic, strong) NSMutableArray* anchormanRandomSounds;
@property(nonatomic, strong) UITableView* anchormanView;
@property(nonatomic, strong) UITableView* otherView;
@property(nonatomic, strong) NSMutableArray* otherSounds;
@property(nonatomic, strong) AVAudioPlayer *player;
@property(nonatomic, assign) BOOL isAnchorman;
@end

@implementation SoundBoardViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.anchormanInsultSounds = [[NSMutableArray alloc]init];
    self.anchormanRandomSounds = [[NSMutableArray alloc]init];
    self.otherSounds = [[NSMutableArray alloc]init];
    self.isAnchorman = true;
    self.movieSelector.delegate = self;
    [self addAnchormanSounds];
    [self addOtherSounds];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

-(void)addAnchormanSounds{
    [self.anchormanInsultSounds addObject:([self createSoundBit:(@"Punch") path:(@"punch")])];
    [self.anchormanInsultSounds addObject:([self createSoundBit:(@"Slap You In Public") path:(@"slap")])];
    [self.anchormanInsultSounds addObject:([self createSoundBit:(@"Smelly Pirate") path:(@"smellypirate")])];
    [self.anchormanRandomSounds addObject:([self createSoundBit:(@"Bears") path:(@"bears")])];
    [self.anchormanRandomSounds addObject:([self createSoundBit:(@"I Love Scotch") path:(@"ilovescotch")])];
    [self.anchormanRandomSounds addObject:([self createSoundBit:(@"Milk Was a Bad Choice") path:(@"milkwasabadchoice")])];
    [self.anchormanRandomSounds addObject:([self createSoundBit:(@"Oh Baxter...") path:(@"ohbaxter")])];
    [self.anchormanRandomSounds addObject:([self createSoundBit:(@"San Diago") path:(@"sandiago")])];
}

-(void)addOtherSounds{
    [self.otherSounds addObject:([self createSoundBit:(@"Other1") path:(@"bears")])];
    [self.otherSounds addObject:([self createSoundBit:(@"Other2") path:(@"ilovescotch")])];
    [self.otherSounds addObject:([self createSoundBit:(@"Other3") path:(@"milkwasabadchoice")])];
    [self.otherSounds addObject:([self createSoundBit:(@"Other4") path:(@"ohbaxter")])];
    [self.otherSounds addObject:([self createSoundBit:(@"Other5") path:(@"punch")])];
    [self.otherSounds addObject:([self createSoundBit:(@"Other6") path:(@"sandiago")])];
    [self.otherSounds addObject:([self createSoundBit:(@"Other7") path:(@"slap")])];
    [self.otherSounds addObject:([self createSoundBit:(@"Other8") path:(@"smellypirate")])];
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
    if(self.isAnchorman){
        return 2;
    }else{
        return 1;
    }
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    NSString *sectionName;
    if(self.isAnchorman){
        switch (section)
        {
            case 0:
                sectionName = NSLocalizedString(@"Insults", @"Insults");
                break;
            case 1:
                sectionName = NSLocalizedString(@"Random", @"Random");
                break;
            default:
                sectionName = @"";
                break;
        }
    }
    return sectionName;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if(self.isAnchorman){
        if(section==0){
            return 3;
        }else{
            return 5;
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
    if(self.isAnchorman){
        if(indexPath.section==0){
            cell.textLabel.text = [[self.anchormanInsultSounds objectAtIndex:(indexPath.row)] name];
        }else{
            cell.textLabel.text = [[self.anchormanRandomSounds objectAtIndex:(indexPath.row)] name];
        }
        cell.imageView.image = [UIImage imageNamed:@"aTableViewImage.jpg"];
    }else{
        cell.imageView.image = [[UIImage alloc]init];
        cell.textLabel.text = [[self.otherSounds objectAtIndex:(indexPath.row)] name];
    }
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if(self.isAnchorman){
        if(indexPath.section==0){
            Sound* soundToBePlayed = [self.anchormanInsultSounds objectAtIndex:(indexPath.row)];
            _player = [soundToBePlayed audioPlayer];
            [_player play];
        }else{
            Sound* soundToBePlayed = [self.anchormanRandomSounds objectAtIndex:(indexPath.row)];
            _player = [soundToBePlayed audioPlayer];
            [_player play];
        }
    }else{
        Sound* soundToBePlayed = [self.otherSounds objectAtIndex:(indexPath.row)];
        _player = [soundToBePlayed audioPlayer];
        [_player play];
    }
}

-(void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item{
    if ([[item title] isEqualToString:(@"Anchorman")]){
        self.isAnchorman = true;
    }else{
        self.isAnchorman = false;
    }
    [self.tableView reloadData];
}

@end
