//
//  SPBackgroundNode.m
//  Clef Quizzer
//
//  Created by Stone  Preston on 7/23/14.
//  Copyright (c) 2014 Stone Preston. All rights reserved.
//

#import "SPBackgroundNode.h"

@implementation SPBackgroundNode

+ (instancetype)backgroundWithClefOfType:(SPClefType)type atPosition:(CGPoint)position {
    
    //TODO: add in tenor and alto clefs
    SPBackgroundNode *background;
    if (type == SPClefTypeTreble) {
      
        background = [self spriteNodeWithImageNamed:@"background_treble"];
        
    } else {
        
        background = [self spriteNodeWithImageNamed:@"background_bass"];
        
    }
    
    background.anchorPoint = CGPointMake(0, .5);
    background.position = position;
    return background;
}
@end
