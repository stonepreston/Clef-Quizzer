//
//  SPNotesViewController.m
//  Clef Quizzer
//
//  Created by Stone  Preston on 8/4/14.
//  Copyright (c) 2014 Stone Preston. All rights reserved.
//

#import "SPNotesViewController.h"
#import "SPGameState.h"
#import "SPUtil.h"

@interface SPNotesViewController ()

@end

@implementation SPNotesViewController



- (void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:animated];
    
    [self resetCheckboxes];
    
    //check relevant checkboxes
    for (NSNumber *noteRangeNumber in [SPGameState sharedInstance].noteRangeNumbers) {
        
        switch ([noteRangeNumber integerValue]) {
            
            //lines needs to be checked
            case SPNoteRangeLines:
                self.linesCheckbox.selected = YES;
                break;
                
            //spaces needs to be checked
            case SPNoteRangeSpaces:
                self.spacesCheckbox.selected = YES;
                break;
                
            //Upper Ledger Lines needs to be checked
            case SPNoteRangeUpperLedgerLines:
                self.upperLedgerLinesCheckbox.selected = YES;
                break;
                
            //Lower ledger lines needs to be checked
            case SPNoteRangeLowerLedgerLines:
                self.lowerLedgerLinesCheckbox.selected = YES;
                break;
                
            default:
                break;
        }
        
    }
}

- (void)resetCheckboxes {
    
    self.linesCheckbox.selected = NO;
    self.spacesCheckbox.selected = NO;
    self.upperLedgerLinesCheckbox.selected = NO;
    self.lowerLedgerLinesCheckbox.selected = NO;
}

- (BOOL)prefersStatusBarHidden {
    
    return YES;
}




- (IBAction)linesCheckboxSelected:(id)sender {
    
    UIButton *button = sender;
    
    [self handleCheckboxPressedForButton:button andNoteRange:SPNoteRangeLines];
    
}

- (IBAction)spacesCheckboxSelected:(id)sender {
    
    UIButton *button = sender;
    
    [self handleCheckboxPressedForButton:button andNoteRange:SPNoteRangeSpaces];

}

- (IBAction)upperLedgerLinesCheckboxSelected:(id)sender {
    
    UIButton *button = sender;
    
    [self handleCheckboxPressedForButton:button andNoteRange:SPNoteRangeUpperLedgerLines];

    
    
}

- (IBAction)lowerLedgerLinesCheckboxSelected:(id)sender {
    
    UIButton *button = sender;
    
    [self handleCheckboxPressedForButton:button andNoteRange:SPNoteRangeLowerLedgerLines];
    
}

- (IBAction)linesButtonPressed:(id)sender {
    
    [self handleCheckboxPressedForButton:self.linesCheckbox andNoteRange:SPNoteRangeLines];
}

- (IBAction)spacesButtonPressed:(id)sender {
    
    [self handleCheckboxPressedForButton:self.spacesCheckbox andNoteRange:SPNoteRangeSpaces];
}

- (IBAction)upperLedgerLinesButtonPressed:(id)sender {
    
    [self handleCheckboxPressedForButton:self.upperLedgerLinesCheckbox andNoteRange:SPNoteRangeUpperLedgerLines];
}

- (IBAction)lowerLedgerLinesButtonPressed:(id)sender {
    
    [self handleCheckboxPressedForButton:self.lowerLedgerLinesCheckbox andNoteRange:SPNoteRangeLowerLedgerLines];
}



- (void)handleCheckboxPressedForButton:(UIButton *)button andNoteRange:(SPNoteRange)noteRange {
    
    
    
    if (button.selected) {
        
        //uncheck it
        button.selected = NO;
        
        //remove it from the set if it exists
        if ([[SPGameState sharedInstance].noteRangeNumbers containsObject:[NSNumber numberWithInt:noteRange]]) {
            
            [[SPGameState sharedInstance].noteRangeNumbers removeObject:[NSNumber numberWithInt:noteRange]];
        }
        
        
    } else {
        
        //mark the checkbox as selected
        button.selected = YES;
        
        //add the note range integer value to the gamestate set if its not in there already
        if (![[SPGameState sharedInstance].noteRangeNumbers containsObject:[NSNumber numberWithInteger:noteRange]]) {
            
            [[SPGameState sharedInstance].noteRangeNumbers addObject:[NSNumber numberWithInteger:noteRange]];
            
            
            
        }
        
    }

    
}

- (IBAction)nextButtonPressed:(id)sender {
    
    //check to make sure the noteRange set is not empty
    if ([SPGameState sharedInstance].noteRangeNumbers.count == 0) {
        
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Oops" message:@"You must select at least one category of notes" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        
        [alertView show];
    } else {
        
        [self performSegueWithIdentifier:@"showMode" sender:self];
    }
}
@end
