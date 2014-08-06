//
//  SPGamePlayScene.m
//  Clef Quizzer
//
//  Created by Stone  Preston on 7/23/14.
//  Copyright (c) 2014 Stone Preston. All rights reserved.
//

#import "SPGamePlayScene.h"
#import "SPBackgroundNode.h"
#import "SPLabelButton.h"
#import "SPModeScene.h"


@interface SPGamePlayScene ()

//whether or not the buttons and notes should be colored
@property (nonatomic) BOOL colored;


@end

@implementation SPGamePlayScene

- (id)initWithSize:(CGSize)size colored:(BOOL)colored {
    
    if (self = [super initWithSize:size]) {
        /* Setup your scene here */
        self.colored = colored;
        self.backgroundColor = [SKColor whiteColor];
        
        
        if ([SPGameState sharedInstance].clef == SPClefTypeTreble) {
            
            SPBackgroundNode *trebleBackground = [SPBackgroundNode backgroundWithClefOfType:SPClefTypeTreble atPosition:CGPointMake(0, CGRectGetMidY(self.frame))];
            [self addChild:trebleBackground];
            
        } else {
            
            SPBackgroundNode *bassBackground = [SPBackgroundNode backgroundWithClefOfType:SPClefTypeBass atPosition:CGPointMake(0, CGRectGetMidY(self.frame))];
            
            [self addChild:bassBackground];
            
        }
        
        self.correctOrIncorrectLabel = [self addCorrectOrIncorrectLabel];
        
        [self addButtons];
        
        self.currentNote = [self generateNote];
        
       
    }
    return self;
    
    
}


- (NSArray *)noteTypeNumbers {
    
    //array of note ranges has not been populated yet, generate it using the noteRange numbers stored in the game state
    if (_noteTypeNumbers == nil) {
        
        _noteTypeNumbers = [NSArray arrayWithArray:[self generateNoteTypesForNoteRanges:[SPGameState sharedInstance].noteRangeNumbers]];
        
    }
    
    return _noteTypeNumbers;
}


- (NSMutableArray *)generateNoteTypesForNoteRanges:(NSMutableSet *)noteRanges  {
    
    NSMutableArray *noteTypes = [[NSMutableArray alloc] init];
    
    for (NSNumber *noteRangeNumber in noteRanges) {
        
        
        //add all the line noteType numbers to the noteTypeSet
        if ([noteRangeNumber integerValue] == SPNoteRangeLines) {
            
            
            //lines start at 8. they are every even number up to and including 16
            for (NSInteger i = 8; i < 17; i++) {
                
                //test for evenness
                if (i % 2 == 0) {
                    
                    [noteTypes addObject:[NSNumber numberWithInteger:i]];
                    
                }
                
                
            }
            
            
            
        }
        
        //add all the space noteType numbers to the noteTypeSet
        if ([noteRangeNumber integerValue] == SPNoteRangeSpaces) {
            
            //spaces start at 9. they are every odd number up to and including 15
            for (NSInteger i = 9; i < 16; i ++) {
                
                //test for oddness
                if (i % 2 != 0) {
                    
                    [noteTypes addObject:[NSNumber numberWithInteger:i]];
                    
                }
                
                
            }
            
        }
        
        //add all the upper Ledger line noteType numbers to the noteTypeSet
        if ([noteRangeNumber integerValue] == SPNoteRangeUpperLedgerLines) {
            
            //upper ledger lines start at 17. they are every odd number up to and including 24
            for (NSInteger i = 17; i < 25; i++) {
                
                [noteTypes addObject:[NSNumber numberWithInteger:i]];
            }
            
        }
        
        //add all the Lower Ledger line noteType numbers to the noteTypeSet
        if ([noteRangeNumber integerValue] == SPNoteRangeLowerLedgerLines) {
            
            //upper ledger lines start at 0. they are every odd number up to and including 7
            for (NSInteger i = 0; i < 8; i++) {
                
                [noteTypes addObject:[NSNumber numberWithInteger:i]];
            }
            
        }
        
        
        
    }
    
    
    
    return noteTypes;
    
}

- (SPNoteNode *)generateNote {
    
    SPNoteNode *note;
    NSInteger randomNoteType;
    
    //randomly pick a note type number from the array note types
    randomNoteType = [[self.noteTypeNumbers objectAtIndex:[SPUtil randomWithMin:0 max:self.noteTypeNumbers.count]] integerValue];
    note = [SPNoteNode noteOfType:randomNoteType forClef:[SPGameState sharedInstance].clef inFrame:self.frame colored:self.colored];
    
    while (note.noteType == self.currentNote.noteType) {
        
        //randomly pick a note type number from the array note types to avoid duplicates
        randomNoteType = [[self.noteTypeNumbers objectAtIndex:[SPUtil randomWithMin:0 max:self.noteTypeNumbers.count]] integerValue];
        note = [SPNoteNode noteOfType:randomNoteType forClef:[SPGameState sharedInstance].clef inFrame:self.frame colored:self.colored];
        
    }
    
    [self addChild:note];
    return note;
    
}



- (void)addButtons {
    
    NSArray *notes = [SPUtil notes];
    
    //grab a texture to get the size the buttons are going to be
    SKTexture *texture = [SKTexture textureWithImageNamed:@"g_button"];
    float buttonRowSize = (texture.size.width * (float)notes.count) + (SPButtonPadding * ((float)notes.count - 1));
    float startingX = (self.size.width - buttonRowSize) / 2;
    for (int i = 0; i < notes.count; i++) {
        
        NSString *normalImageName = [NSString stringWithFormat:@"%@_button", notes[i]];
        SKTexture *normal = [SKTexture textureWithImageNamed:normalImageName];
        AGSpriteButton *button = [AGSpriteButton buttonWithTexture:normal];
        button.anchorPoint = CGPointMake(0, .5);
        button.name = [NSString stringWithFormat:@"%@_button", notes[i]];
        button.position = CGPointMake(startingX, 38);
        button.zPosition = 20;
        button.buttonType = (SPButtonType)i;
        
        if (self.colored) {
            
            
            button.color = [[SPUtil colors] objectForKey:notes[i]];
            button.colorBlendFactor = 1.0;
            
            
        } else {
            
            //color the buttons black for challenge mode
            button.color = [SKColor blackColor];
            button.colorBlendFactor = 1.0;
            
        }
       
        
        [button addTarget:self selector:@selector(buttonPressed:) withObject:button forControlEvent:AGButtonControlEventTouchUpInside];
        startingX = startingX + button.size.width + SPButtonPadding;
        [self addChild:button];
 
        
    }
    
    
}

- (void)buttonPressed:(id)sender {
    
    //remove current note from screen and add a new one
    AGSpriteButton *button = (AGSpriteButton *)sender;
    
    if ([self checkNoteForButton:button]) {
        
        //correct
        [self.currentNote removeFromParent];
        self.currentNote = [self generateNote];
        self.correctOrIncorrectLabel.text = @"Correct!";
        self.correctOrIncorrectLabel.fontColor = [UIColor colorWithRed:56.0/255.0 green:180.0/255.0 blue:73.0/255.0 alpha:1.0];
        [self animateCorrectOrIncorrectLabel:self.correctOrIncorrectLabel];
        
        
        
        
        
    } else {
        
        //incorrect
        
        
        self.correctOrIncorrectLabel.text = @"Incorrect!";
        self.correctOrIncorrectLabel.fontColor = [UIColor redColor];
        [self animateCorrectOrIncorrectLabel:self.correctOrIncorrectLabel];
        
    }
    
    
    
    
}

- (BOOL)checkNoteForButton:(AGSpriteButton *)button {
    
    NSArray *letters = @[@"a",
                         @"b",
                         @"c",
                         @"d",
                         @"e",
                         @"f",
                         @"g"];

    //if the letter corresponding to the button type is equal to the letter of the note, the answer is correct
    if ([self.currentNote.letter isEqualToString:letters[button.buttonType]]) {
        
        return YES;
        
    } else {
        
        return NO;
    }
                         
    
    
}

- (SKLabelNode *)addCorrectOrIncorrectLabel {
    
    SKLabelNode *correctOrIncorrectLabel = [SKLabelNode labelNodeWithFontNamed:@"Futura-CondensedMedium"];
    correctOrIncorrectLabel.position = CGPointMake(self.frame.size.width - 150, 90);
    correctOrIncorrectLabel.fontColor = [UIColor colorWithRed:56.0/255.0 green:180.0/255.0 blue:73.0/255.0 alpha:1.0];
    correctOrIncorrectLabel.text = @"Correct!";
    correctOrIncorrectLabel.alpha = 0.0;
    [self addChild:correctOrIncorrectLabel];
    
     return correctOrIncorrectLabel;
    

}

- (void)animateCorrectOrIncorrectLabel:(SKLabelNode *)label {

    SKAction *fadeIn = [SKAction fadeInWithDuration:.5];
    SKAction *wait = [SKAction waitForDuration:.5];
    SKAction *fadeOut = [SKAction fadeOutWithDuration:.5];
    
    
    NSArray *sequence = @[fadeIn, wait, fadeOut];
        
    [label runAction:[SKAction sequence:sequence]];
 
    
}










@end
