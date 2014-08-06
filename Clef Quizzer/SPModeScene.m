//
//  SPModeScene.m
//  Clef Quizzer
//
//  Created by Stone  Preston on 7/29/14.
//  Copyright (c) 2014 Stone Preston. All rights reserved.
//

#import "SPModeScene.h"
#import "SPLabelButton.h"
#import "SPChallengeScene.h"
#import "SPPracticeScene.h"
#import "SPTrainingScene.h"
#import "SPNoteRangeScene.h"

@implementation SPModeScene

- (id)initWithSize:(CGSize)size {
    if (self = [super initWithSize:size]) {
        
        //add background node to scene
        self.backgroundColor = [SKColor whiteColor];
        
        SKLabelNode *titleLabel = [SKLabelNode labelNodeWithFontNamed:@"Futura-CondensedMedium"];
        titleLabel.fontColor = [SKColor blackColor];
        titleLabel.fontSize = 50.0;
        titleLabel.text = @"Mode";
        titleLabel.position = CGPointMake(CGRectGetMidX(self.frame), self.frame.size.height - (titleLabel.frame.size.height) - 20);
        [self addChild:titleLabel];
        
        [self addButtonsAfterTitle:titleLabel withPadding:SPMenuButtonPadding];
        
        
        
    }
    return self;
}


- (void)trainingButtonPressed {
    
    SPTrainingScene *trainingScene = [SPTrainingScene sceneWithSize:self.size];
    
    [self.view presentScene:trainingScene];
}

- (void)practiceButtonPressed {
    
    SPPracticeScene *practiceScene = [SPPracticeScene sceneWithSize:self.size];
    
    [self.view presentScene:practiceScene];
    
}

- (void)challengeButtonPressed {
    
    SPChallengeScene *challengeScene = [SPChallengeScene sceneWithSize:self.size];
    
    [self.view presentScene:challengeScene];
    
}

- (void)backButtonPressed {
    
    SPNoteRangeScene *noteRangeScene = [SPNoteRangeScene sceneWithSize:self.frame.size];
    [self.view presentScene:noteRangeScene];
}

- (void)addButtonsAfterTitle:(SKLabelNode *)title withPadding:(float)padding {
    
    SPLabelButton *backLabel = [SPLabelButton buttonWithTitle:@"Back" fontName:@"Futura-CondensedMedium" fontSize:30.0 fontColor:[UIColor blackColor] position:CGPointMake(40, self.size.height - 40) selectable:NO];
    [backLabel addTarget:self selector:@selector(backButtonPressed) withObject:nil forControlEvent:SPLabelButtonControlEventTouchUpInside];
    [self addChild:backLabel];
    
    SKNode *menuNode = [SKNode node];
    float menuCenterY = (title.position.y - (title.frame.size.height / 2)) / 2;
    menuNode.position = CGPointMake(CGRectGetMidX(self.frame), menuCenterY - 15);
    [self addChild:menuNode];

    SPLabelButton *trainingLabel = [SPLabelButton buttonWithTitle:@"Training" fontName:@"Futura-CondensedMedium" fontSize:30.0 fontColor:[UIColor blackColor] position:CGPointMake(0, 90) selectable:NO];
    [trainingLabel addTarget:self selector:@selector(trainingButtonPressed) withObject:nil forControlEvent:SPLabelButtonControlEventTouchUpInside];
    [menuNode addChild:trainingLabel];
    
    SPLabelButton *practiceLabel = [SPLabelButton buttonWithTitle:@"Practice" fontName:@"Futura-CondensedMedium" fontSize:30.0 fontColor:[UIColor blackColor] position:CGPointMake(0, trainingLabel.position.y - padding) selectable:NO];
    [practiceLabel addTarget:self selector:@selector(practiceButtonPressed) withObject:nil forControlEvent:SPLabelButtonControlEventTouchUpInside];
    [menuNode addChild:practiceLabel];
    
    SPLabelButton *challengeLabel = [SPLabelButton buttonWithTitle:@"Challenge" fontName:@"Futura-CondensedMedium" fontSize:30.0 fontColor:[UIColor blackColor] position:CGPointMake(0, practiceLabel.position.y - padding) selectable:NO];
    [challengeLabel addTarget:self selector:@selector(challengeButtonPressed) withObject:nil forControlEvent:SPLabelButtonControlEventTouchUpInside];
    [menuNode addChild:challengeLabel];
}




@end
