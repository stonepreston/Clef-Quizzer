//
//  SPClefViewController.m
//  Clef Quizzer
//
//  Created by Stone  Preston on 8/4/14.
//  Copyright (c) 2014 Stone Preston. All rights reserved.
//

#import "SPClefViewController.h"
#import "SPGameState.h"
#import "SPUtil.h"

@interface SPClefViewController ()

@end

@implementation SPClefViewController


//hides the status bar
- (BOOL)prefersStatusBarHidden {
    
    return YES;
}


//called when the user selects the treble clef button
- (IBAction)trebleClefButtonPressed:(id)sender {
    
    [self handleClefButtonPressedForClef:SPClefTypeTreble];
}

//called when the user selects the bass clef button
- (IBAction)bassClefButtonPressed:(id)sender {
    
    [self handleClefButtonPressedForClef:SPClefTypeBass];
}

//called when the user selects the tenor clef button
- (IBAction)tenorClefButtonPressed:(id)sender {
    
    [self handleClefButtonPressedForClef:SPClefTypeTenor];
}

//called when the user selects the alto clef button
- (IBAction)altoClefButtonPressed:(id)sender {
    
    [self handleClefButtonPressedForClef:SPClefTypeAlto];
}

//handles the button presses
- (void)handleClefButtonPressedForClef:(SPClefType)clef {
    

    //set the new clef
    [SPGameState sharedInstance].clef = clef;
    
    //pefrom the segue to the notes view controller
    [self performSegueWithIdentifier:@"showNotes" sender:self];
}
@end
