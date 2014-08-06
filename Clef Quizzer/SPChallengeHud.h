//
//  SPChallengeHud.h
//  Clef Quizzer
//
//  Created by Stone  Preston on 7/29/14.
//  Copyright (c) 2014 Stone Preston. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>
#import "SPUtil.h"

@interface SPChallengeHud : SKNode

//displays the score
@property (nonatomic) SKLabelNode *scoreLabel;

@property (nonatomic) NSInteger score;
@property (nonatomic) NSInteger lives;

+ (instancetype)challengeHudAtPosition:(CGPoint)position inClef:(SPClefType)clef inFrame:(CGRect)frame;

- (BOOL)loseLife;

- (void)addPoints;

@end
