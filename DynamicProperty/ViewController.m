//
//  ViewController.m
//  DynamicProperty
//
//  Created by salmon on 14/11/7.
//  Copyright (c) 2014年 salmon. All rights reserved.
//

#import "ViewController.h"

#import "AudioLayer.h"

@interface ViewController ()

@property (nonatomic, strong) AudioLayer *audioLayer;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSURL *musicURL = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"music" ofType:@"mp3"]];
    self.audioLayer = [[AudioLayer alloc] initWithAudioFileURL:musicURL];
    [self.view.layer addSublayer:self.audioLayer];
    
    
    [self.view addSubview:self.playPauseButton];
    [self.view addSubview:self.fadeInFadeOutButton];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - getter
-(UIButton*)playPauseButton
{
    if (!_playPauseButton) {
        
        _playPauseButton = [[UIButton alloc] initWithFrame:CGRectMake(20, 100, self.view.frame.size.width-20*2, 40)];
        _playPauseButton.layer.cornerRadius = 5;
        _playPauseButton.layer.masksToBounds = YES;
        _playPauseButton.layer.borderWidth = 1;
        _playPauseButton.layer.borderColor = [UIColor blackColor].CGColor;
        [_playPauseButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_playPauseButton setTitle:@"Play" forState:UIControlStateNormal];
        [_playPauseButton addTarget:self action:@selector(playPauseMusic:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _playPauseButton;
}

-(UIButton*)fadeInFadeOutButton
{
    if (!_fadeInFadeOutButton) {
        _fadeInFadeOutButton = [[UIButton alloc] initWithFrame:CGRectMake(20, CGRectGetMaxY(_playPauseButton.frame)+20, self.view.frame.size.width-20*2, 40)];
        _fadeInFadeOutButton.layer.cornerRadius = 5;
        _fadeInFadeOutButton.layer.masksToBounds = YES;
        _fadeInFadeOutButton.layer.borderWidth = 1;
        _fadeInFadeOutButton.layer.borderColor = [UIColor blackColor].CGColor;
        [_fadeInFadeOutButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_fadeInFadeOutButton setTitle:@"fadeOut" forState:UIControlStateNormal];
        [_fadeInFadeOutButton addTarget:self action:@selector(fadeInFadeOut:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _fadeInFadeOutButton;
}


- (void)playPauseMusic:(UIButton *)sender
{
    if ([self.audioLayer isPlaying])
    {
        [self.audioLayer stop];
        [sender setTitle:@"Play" forState:UIControlStateNormal];
    }
    else
    {
        [self.audioLayer play];
        [sender setTitle:@"Pause" forState:UIControlStateNormal];
    }
}

- (void)fadeInFadeOut:(UIButton*)sender
{
    
    if (0 == self.audioLayer.volume)
    {
        self.audioLayer.volume = 1;
        [sender setTitle:@"fadeOut" forState:UIControlStateNormal];
    }
    else
    {
        self.audioLayer.volume = 0;
        [sender setTitle:@"fadeIn" forState:UIControlStateNormal];
    }
    
    
}



@end
