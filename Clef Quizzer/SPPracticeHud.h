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

//displays the number of notes the user has gotten correct
@property (nonatomic) SKLabelNode *numberCorrectLabel;

//displays the number of notes the user has gotten incorrect
@property (nonatomic) SKLabelNode *numberIncorrectLabel;

//stores the number the user has gotten correct
@property (nonatomic) NSInteger numberCorrect;

//stores the number the user has gotten incorrect
@property (nonatomic) NSInteger numberIncorrect;

//creates the practice hud
+ (instancetype)practiceHudAtPosition:(CGPoint)position inClef:(SPClefType)clef inFrame:(CGRect)frame;

//increases the correct label by 1
- (void)increaseCorrectLabel;

//increases the incorrect label by 1
- (void)increaseIncorrectLabel;



@end
