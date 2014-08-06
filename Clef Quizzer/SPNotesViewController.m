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
    
    //clears all checkboxes
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

//clears the checkboxes
- (void)resetCheckboxes {
    
    self.linesCheckbox.selected = NO;
    self.spacesCheckbox.selected = NO;
    self.upperLedgerLinesCheckbox.selected = NO;
    self.lowerLedgerLinesCheckbox.selected = NO;
}

//hides the status bars
- (BOOL)prefersStatusBarHidden {
    
    return YES;
}


//called when the user taps the lines checkbox
- (IBAction)linesCheckboxSelected:(id)sender {
    
    UIButton *button = sender;
    
    [self handleCheckboxPressedForButton:button andNoteRange:SPNoteRangeLines];
    
}

//called when the user taps the spaces checkbox
- (IBAction)spacesCheckboxSelected:(id)sender {
    
    UIButton *button = sender;
    
    [self handleCheckboxPressedForButton:button andNoteRange:SPNoteRangeSpaces];

}

//called when the user taps the upper ledger lines checkbox
- (IBAction)upperLedgerLinesCheckboxSelected:(id)sender {
    
    UIButton *button = sender;
    
    [self handleCheckboxPressedForButton:button andNoteRange:SPNoteRangeUpperLedgerLines];

    
    
}

//called when the user selects the lower ledger lines checkbox
- (IBAction)lowerLedgerLinesCheckboxSelected:(id)sender {
    
    UIButton *button = sender;
    
    [self handleCheckboxPressedForButton:button andNoteRange:SPNoteRangeLowerLedgerLines];
    
}

//called when the user taps the lines button
- (IBAction)linesButtonPressed:(id)sender {
    
    [self handleCheckboxPressedForButton:self.linesCheckbox andNoteRange:SPNoteRangeLines];
}

//called when the user taps the spaces button
- (IBAction)spacesButtonPressed:(id)sender {
    
    [self handleCheckboxPressedForButton:self.spacesCheckbox andNoteRange:SPNoteRangeSpaces];
}


//called when the user taps the upper ledger lines button
- (IBAction)upperLedgerLinesButtonPressed:(id)sender {
    
    [self handleCheckboxPressedForButton:self.upperLedgerLinesCheckbox andNoteRange:SPNoteRangeUpperLedgerLines];
}

//called when the user taps the lower ledger lines button
- (IBAction)lowerLedgerLinesButtonPressed:(id)sender {
    
    [self handleCheckboxPressedForButton:self.lowerLedgerLinesCheckbox andNoteRange:SPNoteRangeLowerLedgerLines];
}


//checks the appropriate checkbox when a button is pressed
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

//called when the user taps the next button
- (IBAction)nextButtonPressed:(id)sender {
    
    //check to make sure the noteRange set is not empty
    if ([SPGameState sharedInstance].noteRangeNumbers.count == 0) {
        
        //displays an alert view
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Oops" message:@"You must select at least one category of notes" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        
        [alertView show];
    } else {
        
        //segues to the mode view controller
        [self performSegueWithIdentifier:@"showMode" sender:self];
    }
}
@end
