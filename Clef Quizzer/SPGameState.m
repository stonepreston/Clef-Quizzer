//
//  SPGameState.m
//  Clef Quizzer
//
//  Created by Stone  Preston on 8/4/14.
//  Copyright (c) 2014 Stone Preston. All rights reserved.
//

#import "SPGameState.h"
#import "SPUtil.h"


@implementation SPGameState

+(instancetype)loadInstance
{
    
        
    //load the game state
    SPGameState *gameState = [[SPGameState alloc] init];
    
    //initialize the score, lives, and note range
    gameState.score = 0;
    gameState.lives = SPMaxLives;
    gameState.noteRangeNumbers = [[NSMutableSet alloc] init];
    
    
    
    
    return gameState;
    
    
    
}

//returns a singleton game state object
+ (instancetype)sharedInstance {
    
    
    static SPGameState *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [SPGameState loadInstance];
    });
    return sharedInstance;
}



//resets the score and lives
- (void)reset {
    
    self.score = 0;
    self.lives = SPMaxLives;
}

@end
