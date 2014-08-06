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

- (void)viewDidLoad
{
    [super viewDidLoad];
    
}


- (BOOL)prefersStatusBarHidden {
    
    return YES;
}




- (IBAction)trebleClefButtonPressed:(id)sender {
    
    [self handleClefButtonPressedForClef:SPClefTypeTreble];
}

- (IBAction)bassClefButtonPressed:(id)sender {
    
    [self handleClefButtonPressedForClef:SPClefTypeBass];
}

- (IBAction)tenorClefButtonPressed:(id)sender {
    
    [self handleClefButtonPressedForClef:SPClefTypeTenor];
}

- (IBAction)altoClefButtonPressed:(id)sender {
    
    [self handleClefButtonPressedForClef:SPClefTypeAlto];
}

- (void)handleClefButtonPressedForClef:(SPClefType)clef {
    
    //new clef selected, clear the note range
    [[SPGameState sharedInstance].noteRangeNumbers removeAllObjects];
    
    //set the new clef
    [SPGameState sharedInstance].clef = clef;
    
    //pefrom the segue to the notes view controller
    [self performSegueWithIdentifier:@"showNotes" sender:self];
}
@end
