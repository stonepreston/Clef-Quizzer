//
//  SPChallengeScene.h
//  Clef Quizzer
//
//  Created by Stone  Preston on 7/29/14.
//  Copyright (c) 2014 Stone Preston. All rights reserved.
//

#import "SPGamePlayScene.h"
#import "SPChallengeHud.h"

@interface SPChallengeScene : SPGamePlayScene

@property (nonatomic) SPChallengeHud *challengeHud;

- (id)initWithSize:(CGSize)size;

@end
