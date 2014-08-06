//
//  SPChallengeHud.m
//  Clef Quizzer
//
//  Created by Stone  Preston on 7/29/14.
//  Copyright (c) 2014 Stone Preston. All rights reserved.
//

#import "SPChallengeHud.h"
#import "SPGameState.h"

@implementation SPChallengeHud

+ (instancetype)challengeHudAtPosition:(CGPoint)position inClef:(SPClefType)clef inFrame:(CGRect)frame {
    
    //initialize the hud
    SPChallengeHud *hud = [self node];
    hud.position = position;
    hud.name = @"ChallengeHud";
    
    //setup lives
    SKSpriteNode *lastLife;
    SKSpriteNode *life;
    for (int i = 0; i < SPMaxLives; i++) {
        
        
        // TODO add in alto and tenor clef
        if (clef == SPClefTypeTreble) {
            
            //set the life image for the treble clef
            life = [SKSpriteNode spriteNodeWithImageNamed:@"treble_life"];
            
        } else {
            
            //set the life image for the bass clef
            life = [SKSpriteNode spriteNodeWithImageNamed:@"bass_life"];
        }
        
        //name the life according to which life it is
        life.name = [NSString stringWithFormat:@"Life%d", i + 1];
        [hud addChild:life];
        
        //first life
        if (lastLife == nil) {
            
            life.position = CGPointMake( 20, -10);
            
            
        } else {
            
            // position each life after the first
            life.position = CGPointMake(lastLife.position.x + 20, lastLife.position.y);
        }
        
        lastLife = life;
        
    }
    
    //setup score label
    hud.scoreLabel = [SKLabelNode labelNodeWithFontNamed:@"Futura-CondensedMedium"];
    hud.scoreLabel.name = @"Score";
    hud.scoreLabel.fontColor = [SKColor blackColor];
    hud.scoreLabel.text = [NSString stringWithFormat:@"%ld", (long)[SPGameState sharedInstance].score];
    hud.scoreLabel.fontSize = 30;
    hud.scoreLabel.horizontalAlignmentMode = SKLabelHorizontalAlignmentModeRight;
    hud.scoreLabel.position = CGPointMake(frame.size.width - 20, -20);
    [hud addChild:hud.scoreLabel];
    
    return hud;

    
}

- (void)addPoints {
    
    //add points to the game state score and update label
    [SPGameState sharedInstance].score += SPPointsPerCorrectAnswer;
    self.scoreLabel.text = [NSString stringWithFormat:@"%ld", (long)[SPGameState sharedInstance].score];
    
}

//returns a bool to test for game over
- (BOOL)loseLife {
    
    //check to see if any lives are left
    if ([SPGameState sharedInstance].lives > 0) {
        
        //if there are lives left, remove the last life
        NSString *lifeNodeName = [NSString stringWithFormat:@"Life%ld", (long)[SPGameState sharedInstance].lives];
        SKNode *lifeToRemove = [self childNodeWithName:lifeNodeName];
        [lifeToRemove removeFromParent];
        //update the game state lives
        [SPGameState sharedInstance].lives--;
    }
    
    
    //this is used to test for a Game Over
    return [SPGameState sharedInstance].lives == 0;
}

@end
