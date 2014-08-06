//
//  SPPracticeScene.h
//  Clef Quizzer
//
//  Created by Stone  Preston on 7/29/14.
//  Copyright (c) 2014 Stone Preston. All rights reserved.
//

#import "SPGamePlayScene.h"
#import "SPPracticeHud.h"

@interface SPPracticeScene : SPGamePlayScene

@property (nonatomic) SPPracticeHud *practiceHud;

- (id)initWithSize:(CGSize)size;

@end
