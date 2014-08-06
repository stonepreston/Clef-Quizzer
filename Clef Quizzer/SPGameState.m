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
    NSData* decodedData = [NSData dataWithContentsOfFile: [SPGameState filePath]];
    if (decodedData) {
        SPGameState *gameState = [NSKeyedUnarchiver unarchiveObjectWithData:decodedData];
        gameState.score = 0;
        gameState.lives = SPMaxLives;
        gameState.noteRangeNumbers = [[NSMutableSet alloc] init];
        return gameState;
    }
    
    SPGameState *gameState = [[SPGameState alloc] init];
    gameState.score = 0;
    gameState.lives = SPMaxLives;
    gameState.noteRangeNumbers = [[NSMutableSet alloc] init];
    return gameState;
}

+ (instancetype)sharedInstance {
    
    
    static SPGameState *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [SPGameState loadInstance];
    });
    return sharedInstance;
}

- (instancetype)initWithCoder:(NSCoder *)decoder
{
    self = [self init];
    if (self) {
        self.highScore = [decoder decodeIntegerForKey: SPGameStateHighScoreKey];
        
        
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)encoder
{
    [encoder encodeInteger:self.highScore forKey:SPGameStateHighScoreKey];
    
}

//+ (instancetype)loadInstance {
//    
//    SPGameState *gameState = [[SPGameState alloc] init];
//    gameState.noteRangeNumbers = [[NSMutableSet alloc] init];
//    return gameState;
//}

+(NSString*)filePath
{
    static NSString* filePath = nil;
    if (!filePath) {
        filePath =
        [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject]
         stringByAppendingPathComponent:@"gamedata"];
    }
    return filePath;
}

- (void)save {
    
    NSData* encodedData = [NSKeyedArchiver archivedDataWithRootObject: self];
    [encodedData writeToFile:[SPGameState filePath] atomically:YES];
}

- (void)reset {
    
    self.score = 0;
    self.lives = SPMaxLives;
}

@end
