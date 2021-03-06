//
//  SPGamePlayViewController.m
//  Clef Quizzer
//
//  Created by Stone  Preston on 8/5/14.
//  Copyright (c) 2014 Stone Preston. All rights reserved.
//

#import "SPGamePlayViewController.h"
#import <SpriteKit/SpriteKit.h>
#import "SPGameState.h"
#import "SPGamePlayScene.h"
#import "SPTrainingScene.h"
#import "SPChallengeScene.h"
#import "SPPracticeScene.h"
#import "SPUtil.h"

@interface SPGamePlayViewController ()

@end

@implementation SPGamePlayViewController



- (void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:animated];
    
    // Create and configure the scene.
    [self createSceneForMode:[SPGameState sharedInstance].mode];
}

//creates the scene depending on the mode the user selected
- (void)createSceneForMode:(SPMode)mode {
    
    //Configure the view.
    SKView *skView = (SKView *)self.view;
    skView.showsFPS = YES;
    skView.showsNodeCount = YES;
    
    SKScene *scene;
    
    
    
    if (mode == SPModeTraining) {
        
        // Create and configure the training scene.
        scene = [[SPTrainingScene alloc] initWithSize:skView.frame.size];
        scene.scaleMode = SKSceneScaleModeAspectFill;
        
        
        // Present the scene.
        [skView presentScene:scene];
        
    } else if (mode == SPModePractice) {
        
        // Create and configure the practice scene.
        scene = [[SPPracticeScene alloc] initWithSize:skView.frame.size];
        scene.scaleMode = SKSceneScaleModeAspectFill;
        
        // Present the scene.
        [skView presentScene:scene];
        
        
    } else {
        
        // Create and configure challenge the scene.
        scene = [[SPChallengeScene alloc] initWithSize:skView.frame.size];
        scene.scaleMode = SKSceneScaleModeAspectFill;
        
        // Present the scene.
        [skView presentScene:scene];
        
    }
    
    
}

//hides the status bar
- (BOOL)prefersStatusBarHidden {
    
    return YES;
}
- (IBAction)doneButtonPressed:(id)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
