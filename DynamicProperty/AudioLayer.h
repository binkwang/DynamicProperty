//
//  AudioLayer.h
//  DynamicProperty
//
//  Created by salmon on 14/11/7.
//  Copyright (c) 2014年 salmon. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>

@interface AudioLayer : CALayer

- (id)initWithAudioFileURL:(NSURL *)URL;

@property (nonatomic, assign) float volume;

- (void)play;
- (void)stop;
- (BOOL)isPlaying;

@end
