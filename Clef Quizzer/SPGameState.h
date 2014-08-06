//
//  SPGameState.h
//  Clef Quizzer
//
//  Created by Stone  Preston on 8/4/14.
//  Copyright (c) 2014 Stone Preston. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SPUtil.h"

@interface SPGameState : NSObject <NSCoding>

@property (nonatomic) SPClefType clef;
@property (nonatomic) NSMutableSet *noteRangeNumbers;
@property (nonatomic) SPMode mode;
@property (nonatomic) NSInteger lives;
@property (nonatomic) NSInteger highScore;
@property (nonatomic) NSInteger score;

+ (instancetype)sharedInstance;

+ (instancetype)loadInstance;

- (void)save;

- (void)reset;



@end
