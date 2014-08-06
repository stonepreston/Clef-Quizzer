//
//  SPBackgroundNode.h
//  Clef Quizzer
//
//  Created by Stone  Preston on 7/23/14.
//  Copyright (c) 2014 Stone Preston. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>
#import "SPUtil.h"

@interface SPBackgroundNode : SKSpriteNode

//creates a background node
+ (instancetype)backgroundWithClefOfType:(SPClefType)type atPosition:(CGPoint)position;

@end
