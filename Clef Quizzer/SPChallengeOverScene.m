//
//  SPChallengeOverScene.m
//  Clef Quizzer
//
//  Created by Stone  Preston on 8/5/14.
//  Copyright (c) 2014 Stone Preston. All rights reserved.
//

#import "SPChallengeOverScene.h"
#import "SPChallengeScene.h"
#import "SPGamePlayViewController.h"

@implementation SPChallengeOverScene

- (id)initWithSize:(CGSize)size {
    
    if (self = [super initWithSize:size]) {
        
        //set background color to white
        self.backgroundColor = [SKColor whiteColor];
        
        //setup scene
        SKNode *gameOverNode = [SKNode node];

        gameOverNode.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame));
  
        //setup the score label
        SKLabelNode *gameOverScoreLabel = [SKLabelNode labelNodeWithFontNamed:@"Futura-CondensedMedium"];
        gameOverScoreLabel.name = @"GameOverScoreLabel";
        gameOverScoreLabel.text = [NSString stringWithFormat:@"Score: %ld", (long)[SPGameState sharedInstance].score];
        gameOverScoreLabel.fontSize = 25;
        gameOverScoreLabel.fontColor = [SKColor blackColor];
        gameOverScoreLabel.position = CGPointMake(0, 0);
        [gameOverNode addChild:gameOverScoreLabel];
    
        //setup the retry label
        SKLabelNode *retryLabel = [SKLabelNode labelNodeWithFontNamed:@"Futura-CondensedMedium"];
        retryLabel.position = CGPointMake(0, gameOverScoreLabel.position.y - gameOverScoreLabel.frame.size.height);
        retryLabel.fontSize = 18.0;
        retryLabel.fontColor = [SKColor blackColor];
        retryLabel.text = @"Tap to Retry";
        [gameOverNode addChild:retryLabel];
            
        
        
        [self addChild:gameOverNode];
    
        //reset the lives and score
        [[SPGameState sharedInstance] reset];
  
        
    }
    
    return self;
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    
    //restarts the challenge
    //Configure the view.
    SKView *skView = (SKView *)self.view;
    skView.showsFPS = YES;
    skView.showsNodeCount = YES;
    
    SPChallengeScene *scene;
    
    // Create and configure the scene.
    scene = [[SPChallengeScene alloc] initWithSize:skView.frame.size];
    scene.scaleMode = SKSceneScaleModeAspectFill;
    
    // Present the scene.
    [skView presentScene:scene];
    
}

@end
