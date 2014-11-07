//
//  AudioLayer.m
//  DynamicProperty
//
//  Created by salmon on 14/11/7.
//  Copyright (c) 2014年 salmon. All rights reserved.
//

#import "AudioLayer.h"

#import <AVFoundation/AVFoundation.h>


@interface AudioLayer ()

@property (nonatomic, strong) AVAudioPlayer *player;

@end


@implementation AudioLayer


@dynamic volume;

- (id)initWithAudioFileURL:(NSURL *)URL
{
    if ((self = [self init]))
    {
        self.volume = 1.0;
        self.player = [[AVAudioPlayer alloc] initWithContentsOfURL:URL error:NULL];
    }
    return self;
}

- (void)play
{
    [self.player play];
}

- (void)stop
{
    [self.player stop];
}

- (BOOL)isPlaying
{
    return self.player.playing;
}


+(BOOL)needsDisplayForKey:(NSString *)key
{
    
    if ([key isEqualToString:@"volume"]) {
        
        NSLog(@"needsDisplayForKey");
        
        return YES;
    }
    
    return [super needsDisplayForKey:key];
}

-(id<CAAction>)actionForKey:(NSString *)key
{
    if ([key isEqualToString:@"volume"]) {
        
        NSLog(@"actionForKey");
        
        CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:key];
        animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
        animation.fromValue = @([[self presentationLayer] volume]);
        animation.duration = 2.f;
        
        return animation;
        
    }
    return [super actionForKey:key];
}


-(void)display
{
    
    NSLog(@"volume: %f", [[self presentationLayer] volume]);
    
    self.player.volume = [[self presentationLayer] volume];
}


@end
