//
//  SPPracticeScene.m
//  Clef Quizzer
//
//  Created by Stone  Preston on 7/29/14.
//  Copyright (c) 2014 Stone Preston. All rights reserved.
//

#import "SPPracticeScene.h"

@interface SPPracticeScene ()

@end

@implementation SPPracticeScene

- (id)initWithSize:(CGSize)size {
    
    if (self = [super initWithSize:size colored:NO]) {
        /* Setup your scene here */
        self.practiceHud = [SPPracticeHud practiceHudAtPosition:CGPointMake(0, self.frame.size.height - 20) inClef:[SPGameState sharedInstance].clef inFrame:self.frame];
        [self addChild:self.practiceHud];
        

        
    }
    return self;
    
}



//override buttonPressed to update hud labels
- (void)buttonPressed:(id)sender {
    
    //remove current note from screen and add a new one
    AGSpriteButton *button = (AGSpriteButton *)sender;
    
    if ([self checkNoteForButton:button]) {
        
        //correct
        
        [self.practiceHud increaseCorrectLabel];
        [self.currentNote removeFromParent];
        self.currentNote = [self generateNote];
        self.correctOrIncorrectLabel.text = @"Correct!";
        self.correctOrIncorrectLabel.fontColor = [UIColor colorWithRed:56.0/255.0 green:180.0/255.0 blue:73.0/255.0 alpha:1.0];
        [self animateCorrectOrIncorrectLabel:self.correctOrIncorrectLabel];
 
        
    } else {
        
        //incorrect
        [self.practiceHud increaseIncorrectLabel];
        self.correctOrIncorrectLabel.text = @"Incorrect!";
        self.correctOrIncorrectLabel.fontColor = [UIColor redColor];
        [self animateCorrectOrIncorrectLabel:self.correctOrIncorrectLabel];
        
    }

    
    
}



@end
