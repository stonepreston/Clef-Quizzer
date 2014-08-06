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
        
        self.backgroundColor = [SKColor whiteColor];
        
        //setup scene
        SKNode *gameOverNode = [SKNode node];
        
        SPGamePlayViewController *viewController = (SPGamePlayViewController *)self.view.window.rootViewController;
        gameOverNode.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame) + viewController.navigationController.navigationBar.frame.size.height + 30);
        
        
        //New high score
        if ([SPGameState sharedInstance].score > [SPGameState sharedInstance].highScore) {
            
            NSLog(@"new high score!");
            [SPGameState sharedInstance].highScore = [SPGameState sharedInstance].score;
            SKLabelNode *gameOverHighScoreLabel = [SKLabelNode labelNodeWithFontNamed:@"Futura-CondensedMedium"];
            gameOverHighScoreLabel.name = @"GameOverHighScoreLabel";
            gameOverHighScoreLabel.text = [NSString stringWithFormat:@"High Score: %ld", (long)[SPGameState sharedInstance].highScore];
            gameOverHighScoreLabel.fontSize = 25;
            gameOverHighScoreLabel.fontColor = [SKColor blackColor];
            gameOverHighScoreLabel.position = CGPointMake(0, 0);
            [gameOverNode addChild:gameOverHighScoreLabel];
            
            SKLabelNode *retryLabel = [SKLabelNode labelNodeWithFontNamed:@"Futura-CondensedMedium"];
            retryLabel.position = CGPointMake(0, gameOverHighScoreLabel.position.y - gameOverHighScoreLabel.frame.size.height);
            retryLabel.fontSize = 18.0;
            retryLabel.fontColor = [SKColor blackColor];
            retryLabel.text = @"Tap to Retry";
            [gameOverNode addChild:retryLabel];
            
        } else {
            
            //no new high score
            NSLog(@"not a high score");
            NSLog(@"score: %ld", (long)[SPGameState sharedInstance].score);
            NSLog(@"high score: %ld", (long)[SPGameState sharedInstance].highScore);
            SKLabelNode *gameOverScoreLabel = [SKLabelNode labelNodeWithFontNamed:@"Futura-CondensedMedium"];
            gameOverScoreLabel.name = @"GameOverScoreLabel";
            gameOverScoreLabel.text = [NSString stringWithFormat:@"Score: %ld", (long)[SPGameState sharedInstance].score];
            gameOverScoreLabel.fontSize = 25;
            gameOverScoreLabel.fontColor = [SKColor blackColor];
            gameOverScoreLabel.position = CGPointMake(0, 0);
            [gameOverNode addChild:gameOverScoreLabel];
            
            SKLabelNode *gameOverHighScoreLabel = [SKLabelNode labelNodeWithFontNamed:@"Futura-CondensedMedium"];
            gameOverHighScoreLabel.name = @"GameOverScoreLabel";
            gameOverHighScoreLabel.text = [NSString stringWithFormat:@"High Score: %ld", (long)[SPGameState sharedInstance].highScore];
            gameOverHighScoreLabel.fontSize = 25;
            gameOverHighScoreLabel.fontColor = [SKColor blackColor];
            gameOverHighScoreLabel.position = CGPointMake(gameOverScoreLabel.position.x, gameOverScoreLabel.position.y - gameOverScoreLabel.frame.size.height - 10);
            [gameOverNode addChild:gameOverHighScoreLabel];
            
            SKLabelNode *retryLabel = [SKLabelNode labelNodeWithFontNamed:@"Futura-CondensedMedium"];
            retryLabel.position = CGPointMake(0, gameOverHighScoreLabel.position.y - gameOverHighScoreLabel.frame.size.height);
            retryLabel.fontSize = 18.0;
            retryLabel.fontColor = [SKColor blackColor];
            retryLabel.text = @"Tap to Retry";
            [gameOverNode addChild:retryLabel];
            
        }
        
        [self addChild:gameOverNode];
        
        [[SPGameState sharedInstance] save];
        [[SPGameState sharedInstance] reset];
  
        
    }
    
    return self;
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    
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
