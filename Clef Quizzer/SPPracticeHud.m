//
//  SPPracticeHud.m
//  Clef Quizzer
//
//  Created by Stone  Preston on 7/29/14.
//  Copyright (c) 2014 Stone Preston. All rights reserved.
//

#import "SPPracticeHud.h"

@implementation SPPracticeHud

+ (instancetype)practiceHudAtPosition:(CGPoint)position inClef:(SPClefType)clef inFrame:(CGRect)frame {
    
    SPPracticeHud *hud = [self node];
    
    hud.position = position;
    hud.name = @"PracticeHud";
    
    //setup score label
    
    hud.numberCorrectLabel = [SKLabelNode labelNodeWithFontNamed:@"Futura-CondensedMedium"];
    hud.numberCorrectLabel.name = @"NumberCorrectLabel";
    hud.numberCorrectLabel.fontColor = [SKColor blackColor];
    hud.numberCorrectLabel.text = [NSString stringWithFormat:@"Correct: %ld", (long)hud.numberCorrect];
    hud.numberCorrectLabel.fontSize = 30.0;
    hud.numberCorrectLabel.horizontalAlignmentMode = SKLabelHorizontalAlignmentModeRight;
    hud.numberCorrectLabel.position = CGPointMake(frame.size.width - 20, -20);
    [hud addChild:hud.numberCorrectLabel];
    
    hud.numberIncorrectLabel = [SKLabelNode labelNodeWithFontNamed:@"Futura-CondensedMedium"];
    hud.numberIncorrectLabel.name = @"NumberIncorrectLabel";
    hud.numberIncorrectLabel.fontColor = [SKColor blackColor];
    hud.numberIncorrectLabel.text = [NSString stringWithFormat:@"Incorrect: %ld", (long)hud.numberIncorrect];
    hud.numberIncorrectLabel.fontSize = 30;
    hud.numberIncorrectLabel.horizontalAlignmentMode = SKLabelHorizontalAlignmentModeRight;
    hud.numberIncorrectLabel.position = CGPointMake(hud.numberCorrectLabel.position.x,  hud.numberCorrectLabel.position.y - (hud.numberCorrectLabel.frame.size.height / 2) -20);
    [hud addChild:hud.numberIncorrectLabel];
    
    
    
    
    return hud;
    
}

- (void)increaseCorrectLabel {
    
    self.numberCorrect += 1;
    self.numberCorrectLabel.text = [NSString stringWithFormat:@"Correct: %ld", (long)self.numberCorrect];
    
}

- (void)increaseIncorrectLabel {
    
    self.numberIncorrect += 1;
    self.numberIncorrectLabel.text = [NSString stringWithFormat:@"Incorrect: %ld", (long)self.numberIncorrect];

    
}


@end
