//
//  SPTitleScene.m
//  Clef Quizzer
//
//  Created by Stone  Preston on 7/28/14.
//  Copyright (c) 2014 Stone Preston. All rights reserved.
//

#import "SPTitleScene.h"
#import "SPNoteRangeScene.h"
#import "SPLabelButton.h"
#import "SPUtil.h"

@implementation SPTitleScene

- (id)initWithSize:(CGSize)size {
    if (self = [super initWithSize:size]) {
        
        //add background node to scene
        self.backgroundColor = [SKColor whiteColor];
        
        SKLabelNode *titleLabel = [SKLabelNode labelNodeWithFontNamed:@"Futura-CondensedMedium"];
        titleLabel.fontColor = [SKColor blackColor];
        titleLabel.fontSize = 50.0;
        titleLabel.text = @"Clef Quizzer";
        titleLabel.position = CGPointMake(CGRectGetMidX(self.frame), self.frame.size.height - (titleLabel.frame.size.height) - 20);
        [self addChild:titleLabel];
    
        [self addButtonsAfterTitle:titleLabel withPadding:SPMenuButtonPadding];
        
        
        
    }
    return self;
}

- (void)bassClefButtonPressed {
    
    SPNoteRangeScene *noteRangeScene = [SPNoteRangeScene sceneWithSize:self.frame.size];
    noteRangeScene.clef = SPClefTypeBass;
    [self.view presentScene:noteRangeScene];
}

- (void)trebleClefButtonPressed {
    
    SPNoteRangeScene *noteRangeScene = [SPNoteRangeScene sceneWithSize:self.frame.size];
    noteRangeScene.clef = SPClefTypeTreble;
    [self.view presentScene:noteRangeScene];
    
}

- (void)altoClefButtonPressed {
    
    SPNoteRangeScene *noteRangeScene = [SPNoteRangeScene sceneWithSize:self.frame.size];
    noteRangeScene.clef = SPClefTypeAlto;
    [self.view presentScene:noteRangeScene];
    
}

- (void)tenorClefButtonPressed {
    
    SPNoteRangeScene *noteRangeScene = [SPNoteRangeScene sceneWithSize:self.frame.size];
    noteRangeScene.clef = SPClefTypeAlto;
    [self.view presentScene:noteRangeScene];
    
}

- (void)addButtonsAfterTitle:(SKLabelNode *)title withPadding:(float)padding {
    
    
    SKNode *menuNode = [SKNode node];
    
    
    
    // Treble Clef Button
    SPLabelButton *trebleClefLabel = [SPLabelButton buttonWithTitle:@"Treble Clef" fontName:@"Futura-CondensedMedium" fontSize:30.0 fontColor:[UIColor blackColor] position:CGPointMake(0, 0) selectable:NO];
    [trebleClefLabel addTarget:self selector:@selector(trebleClefButtonPressed) withObject:nil forControlEvent:SPLabelButtonControlEventTouchUpInside];
    [menuNode addChild:trebleClefLabel];
    
    // Bass Clef Button
    SPLabelButton *bassClefLabel = [SPLabelButton buttonWithTitle:@"Bass Clef" fontName:@"Futura-CondensedMedium" fontSize:30.0 fontColor:[UIColor blackColor] position:CGPointMake(0, trebleClefLabel.position.y - padding) selectable:NO];
    [bassClefLabel addTarget:self selector:@selector(bassClefButtonPressed) withObject:nil forControlEvent:SPLabelButtonControlEventTouchUpInside];
    [menuNode addChild:bassClefLabel];
    
    // Alto Clef Button
    SPLabelButton *altoClefLabel = [SPLabelButton buttonWithTitle:@"Alto Clef" fontName:@"Futura-CondensedMedium" fontSize:30.0 fontColor:[UIColor blackColor] position:CGPointMake(0, bassClefLabel.position.y - padding) selectable:NO];
    [altoClefLabel addTarget:self selector:@selector(altoClefButtonPressed) withObject:nil forControlEvent:SPLabelButtonControlEventTouchUpInside];
    [menuNode addChild:altoClefLabel];
    
    // Tenor Clef Button
    SPLabelButton *tenorClefLabel = [SPLabelButton buttonWithTitle:@"Tenor Clef" fontName:@"Futura-CondensedMedium" fontSize:30.0 fontColor:[UIColor blackColor] position:CGPointMake(0, altoClefLabel.position.y - padding) selectable:NO];
    [tenorClefLabel addTarget:self selector:@selector(tenorClefButtonPressed) withObject:nil forControlEvent:SPLabelButtonControlEventTouchUpInside];
    [menuNode addChild:tenorClefLabel];
    
    
    menuNode.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame) + 30);
    [self addChild:menuNode];
    
    
}




@end
