//
//  SPGameState.h
//  Clef Quizzer
//
//  Created by Stone  Preston on 8/4/14.
//  Copyright (c) 2014 Stone Preston. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SPUtil.h"

@interface SPGameState : NSObject 

//stores the selected clef
@property (nonatomic) SPClefType clef;

//stores the selected note range
@property (nonatomic) NSMutableSet *noteRangeNumbers;

//stores the selected mode
@property (nonatomic) SPMode mode;

//keeps track of the users lives in challenge mode
@property (nonatomic) NSInteger lives;



//keeps track of the users score in challenge mode
@property (nonatomic) NSInteger score;

//returns a singleton object
+ (instancetype)sharedInstance;

//used to load the highscore from memory and create the instace
+ (instancetype)loadInstance;



//resets the score and lives
- (void)reset;



@end
