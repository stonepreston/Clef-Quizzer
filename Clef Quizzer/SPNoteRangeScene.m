//
//  SPNoteRangeScene.m
//  Clef Quizzer
//
//  Created by Stone  Preston on 7/28/14.
//  Copyright (c) 2014 Stone Preston. All rights reserved.
//

#import "SPNoteRangeScene.h"
#import "SPTitleScene.h"
#import "SPLabelButton.h"
#import "SPModeScene.h"


@interface SPNoteRangeScene ()

@end

@implementation SPNoteRangeScene

- (id)initWithSize:(CGSize)size {
    if (self = [super initWithSize:size]) {
        
        //add background node to scene
        self.backgroundColor = [SKColor whiteColor];
        
        SKLabelNode *titleLabel = [SKLabelNode labelNodeWithFontNamed:@"Futura-CondensedMedium"];
        titleLabel.fontColor = [SKColor blackColor];
        titleLabel.fontSize = 50.0;
        titleLabel.text = @"Notes";
        titleLabel.position = CGPointMake(CGRectGetMidX(self.frame), self.frame.size.height - (titleLabel.frame.size.height) - 20);
        [self addChild:titleLabel];
        
        [self addButtonsAfterTitle:titleLabel withPadding:SPMenuButtonPadding];

        
    }
    return self;
}


- (void)backButtonPressed {
    
    SPTitleScene *titleScene = [SPTitleScene sceneWithSize:self.frame.size];
    [self.view presentScene:titleScene];
    
}



- (void)noteRangeButtonPressed:(NSNumber *)noteRangeNumber {
    
    SPNoteRange noteRange = [noteRangeNumber integerValue];
    
    SPModeScene *modeScene = [SPModeScene sceneWithSize:self.frame.size];
    modeScene.noteRange = noteRange;
    modeScene.clef = self.clef;
    
//    [self.view presentScene:modeScene];
 
    
}

- (void)addButtonsAfterTitle:(SKLabelNode *)title withPadding:(float)padding {
    
    
    SPLabelButton *backLabel = [SPLabelButton buttonWithTitle:@"Back" fontName:@"Futura-CondensedMedium" fontSize:30.0 fontColor:[UIColor blackColor] position:CGPointMake(40, self.size.height - 40) selectable:NO];
    [backLabel addTarget:self selector:@selector(backButtonPressed) withObject:nil forControlEvent:SPLabelButtonControlEventTouchUpInside];
    [self addChild:backLabel];
    
    SKNode *menuNode = [SKNode node];
    float menuCenterY = (title.position.y - (title.frame.size.height / 2)) / 2;
    menuNode.position = CGPointMake(CGRectGetMidX(self.frame), menuCenterY);
    [self addChild:menuNode];
    
    SPLabelButton *linesLabel = [SPLabelButton buttonWithTitle:@"Lines" fontName:@"Futura-CondensedMedium" fontSize:30.0 fontColor:[UIColor blackColor] position:CGPointMake(0, 90) selectable:YES];
    [linesLabel addTarget:self selector:@selector(noteRangeButtonPressed:) withObject:[NSNumber numberWithInteger:SPNoteRangeLines] forControlEvent:SPLabelButtonControlEventTouchUpInside];
    linesLabel.selected = YES;
    [menuNode addChild:linesLabel];
    
    SPLabelButton *spacesLabel = [SPLabelButton buttonWithTitle:@"Spaces" fontName:@"Futura-CondensedMedium" fontSize:30.0 fontColor:[UIColor blackColor] position:CGPointMake(0, linesLabel.position.y - padding) selectable:YES];
    [spacesLabel addTarget:self selector:@selector(noteRangeButtonPressed:) withObject:[NSNumber numberWithInteger:SPNoteRangeSpaces] forControlEvent:SPLabelButtonControlEventTouchUpInside];
    [menuNode addChild:spacesLabel];
    
    SPLabelButton *upperLedgerLinesLabel = [SPLabelButton buttonWithTitle:@"Upper Ledger Lines" fontName:@"Futura-CondensedMedium" fontSize:30.0 fontColor:[UIColor blackColor] position:CGPointMake(0, spacesLabel.position.y - padding) selectable:YES];
    [upperLedgerLinesLabel addTarget:self selector:@selector(noteRangeButtonPressed:) withObject:[NSNumber numberWithInteger:SPNoteRangeUpperLedgerLines] forControlEvent:SPLabelButtonControlEventTouchUpInside];
    [menuNode addChild:upperLedgerLinesLabel];
    
    SPLabelButton *lowerLedgerLinesLabel = [SPLabelButton buttonWithTitle:@"Lower Ledger Lines" fontName:@"Futura-CondensedMedium" fontSize:30.0 fontColor:[UIColor blackColor] position:CGPointMake(0, upperLedgerLinesLabel.position.y - padding) selectable:YES];
    [lowerLedgerLinesLabel addTarget:self selector:@selector(noteRangeButtonPressed:) withObject:[NSNumber numberWithInteger:SPNoteRangeLowerLedgerLines] forControlEvent:SPLabelButtonControlEventTouchUpInside];
    [menuNode addChild:lowerLedgerLinesLabel];

    
}







@end
