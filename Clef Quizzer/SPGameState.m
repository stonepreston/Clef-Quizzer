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
    //get the saved data from the file
    NSData* decodedData = [NSData dataWithContentsOfFile: [SPGameState filePath]];
    
    //if there was data
    if (decodedData) {
        
        //load the game state
        SPGameState *gameState = [NSKeyedUnarchiver unarchiveObjectWithData:decodedData];
        
        //initialize the score, lives, and note range
        gameState.score = 0;
        gameState.lives = SPMaxLives;
        gameState.noteRangeNumbers = [[NSMutableSet alloc] init];
        return gameState;
    }
    
    //if there was no saved state
    SPGameState *gameState = [[SPGameState alloc] init];
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


//used the get the file path of the saved data
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

//saves the highscore to disk
- (void)save {
    
    NSData* encodedData = [NSKeyedArchiver archivedDataWithRootObject: self];
    [encodedData writeToFile:[SPGameState filePath] atomically:YES];
}

//resets the score and lives
- (void)reset {
    
    self.score = 0;
    self.lives = SPMaxLives;
}

@end
