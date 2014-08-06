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

//creates the challenge hud
+ (instancetype)challengeHudAtPosition:(CGPoint)position inClef:(SPClefType)clef inFrame:(CGRect)frame;

//removes one life, the bool return type is used in testing for game over
- (BOOL)loseLife;

//adds points to the users score
- (void)addPoints;

@end
