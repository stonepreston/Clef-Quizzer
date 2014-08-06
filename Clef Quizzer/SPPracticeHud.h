//
//  SPPracticeHud.h
//  Clef Quizzer
//
//  Created by Stone  Preston on 7/29/14.
//  Copyright (c) 2014 Stone Preston. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>
#import "SPUtil.h"

@interface SPPracticeHud : SKNode

@property (nonatomic) SKLabelNode *numberCorrectLabel;

@property (nonatomic) SKLabelNode *numberIncorrectLabel;

@property (nonatomic) NSInteger numberCorrect;

@property (nonatomic) NSInteger numberIncorrect;

+ (instancetype)practiceHudAtPosition:(CGPoint)position inClef:(SPClefType)clef inFrame:(CGRect)frame;

- (void)increaseCorrectLabel;

- (void)increaseIncorrectLabel;



@end
