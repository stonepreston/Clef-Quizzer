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


- (BOOL)prefersStatusBarHidden {
    
    return YES;
}



- (IBAction)trainingButtonPressed:(id)sender {
    
    [self handleButtonPressForMode:SPModeTraining];
    
}

- (IBAction)practiceButtonPressed:(id)sender {
    
    [self handleButtonPressForMode:SPModePractice];
}

- (IBAction)challengeButtonPressed:(id)sender {
    
    [self handleButtonPressForMode:SPModeChallenge];
}

- (void)handleButtonPressForMode:(SPMode)mode {
    
    [SPGameState sharedInstance].mode = mode;
    [self performSegueWithIdentifier:@"showGamePlay" sender:self];
    
    
}



@end
