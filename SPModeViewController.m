//
//  SPModeViewController.m
//  Clef Quizzer
//
//  Created by Stone  Preston on 8/4/14.
//  Copyright (c) 2014 Stone Preston. All rights reserved.
//

#import "SPModeViewController.h"
#import "SPGameState.h"
#import "SPUtil.h"


@interface SPModeViewController ()

@end

@implementation SPModeViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

//hides the status bar
- (BOOL)prefersStatusBarHidden {
    
    return YES;
}


//called when the training button is pressed
- (IBAction)trainingButtonPressed:(id)sender {
    
    [self handleButtonPressForMode:SPModeTraining];
    
}

//called when the practice button is pressed
- (IBAction)practiceButtonPressed:(id)sender {
    
    [self handleButtonPressForMode:SPModePractice];
}

//called when the challenge button is pressed
- (IBAction)challengeButtonPressed:(id)sender {
    
    [self handleButtonPressForMode:SPModeChallenge];
}


//handles the button pressed depending on the mode
- (void)handleButtonPressForMode:(SPMode)mode {
    
    //set the mode in the game state
    [SPGameState sharedInstance].mode = mode;
    
    //segue to the gameplay view controller
    [self performSegueWithIdentifier:@"showGamePlay" sender:self];
    
    
}



@end
