//
//  SPGamePlayScene.h
//  Clef Quizzer
//
//  Created by Stone  Preston on 7/23/14.
//  Copyright (c) 2014 Stone Preston. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>
#import "SPUtil.h"
#import "AGSpriteButton.h"
#import "SPNoteNode.h"
#import "SPGameState.h"

@interface SPGamePlayScene : SKScene

//stores the array of note types selected by the user
@property (nonatomic) NSArray *noteTypeNumbers;

//label used to identify if an answer was correct or incorrect
@property (nonatomic) SKLabelNode *correctOrIncorrectLabel;


// the note currently being displayed
@property (nonatomic) SPNoteNode *currentNote;

//creates the scene
- (id)initWithSize:(CGSize)size colored:(BOOL)colored;

//generates a random note
- (SPNoteNode *)generateNote;

//called when a button is tapped
- (void)buttonPressed:(id)sender;

//checks the users answer
- (BOOL)checkNoteForButton:(AGSpriteButton *)button;

//animates the correct/incorrect label (fades in and out)
- (void)animateCorrectOrIncorrectLabel:(SKLabelNode *)label;

@end
