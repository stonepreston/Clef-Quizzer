//
//  SPLabelButton.h
//  Clef Quizzer
//
//  Created by Stone  Preston on 7/28/14.
//  Copyright (c) 2014 Stone Preston. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface SPLabelButton : SKLabelNode

// can the button be selected
@property (nonatomic) BOOL selectable;

// is the selectable button selected
@property (nonatomic) BOOL selected;

typedef NS_OPTIONS(int, SPLabelButtonControlEvent)
{
    SPLabelButtonControlEventTouchDown = 1,
    SPLabelButtonControlEventTouchUp,
    SPLabelButtonControlEventTouchUpInside,
    SPLabelButtonControlEventAllEvents
};

-(void)setBaseProperties;

// method used to create label
+ (instancetype)buttonWithTitle:(NSString *)title fontName:(NSString *)name fontSize:(CGFloat)size fontColor:(UIColor *)color position:(CGPoint)position selectable:(BOOL)selectable;

// target handler methods
-(void)addTarget:(id)target selector:(SEL)selector withObject:(id)object forControlEvent:(SPLabelButtonControlEvent)controlEvent;

-(void)removeTarget:(id)target selector:(SEL)selector forControlEvent:(SPLabelButtonControlEvent)controlEvent;

-(void)removeAllTargets;

// label animation method
-(void)transformForTouchDown;
-(void)transformForTouchUp;



@end
