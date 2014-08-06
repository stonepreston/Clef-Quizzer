//
//  SPLabelButton.m
//  Clef Quizzer
//
//  Created by Stone  Preston on 7/28/14.
//  Copyright (c) 2014 Stone Preston. All rights reserved.
//

#import "SPLabelButton.h"


@implementation SPLabelButton
{
    
    NSMutableArray *marrSelectors;
}

+ (instancetype)buttonWithTitle:(NSString *)title fontName:(NSString *)name fontSize:(CGFloat)size fontColor:(UIColor *)color position:(CGPoint)position selectable:(BOOL)selectable {
    
    SPLabelButton *button = [self labelNodeWithFontNamed:name];
    button.fontSize = size;
    button.fontColor = color;
    button.text = title;
    button.position = position;
    [button setBaseProperties];
    button.selectable = selectable;
    

    return button;
}

-(void)setBaseProperties
{
    self.userInteractionEnabled = YES;
    self.selectable = NO;
    self.selected = NO;
    marrSelectors = [[NSMutableArray alloc]init];
    
    
    
}

- (void)setSelected:(BOOL)selected {
    
    if (self.selectable) {
        
        if (selected) {
            
            _selected = selected;
            self.fontColor = [UIColor blackColor];
            
        } else {
            
            _selected = selected;
            self.fontColor = [UIColor lightGrayColor];
        }
    }
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
    
    [self controlEventOccured:SPLabelButtonControlEventTouchDown];
    [self transformForTouchDown];
  
    
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    
    [self controlEventOccured:SPLabelButtonControlEventTouchUpInside];
    [self controlEventOccured:SPLabelButtonControlEventTouchUp];
    [self transformForTouchUp];
    
    
}

- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event {
    
    
    [self transformForTouchUp];
  
    
}

-(void)transformForTouchDown
{

    [self runAction:[SKAction scaleBy:0.8 duration:0.1]];
    
}

-(void)transformForTouchUp
{
    
    [self runAction:[SKAction scaleBy:1.25 duration:0.1]];
    
}

#pragma mark - TARGET/SELECTOR HANDLING

-(void)addTarget:(id)target selector:(SEL)selector withObject:(id)object forControlEvent:(SPLabelButtonControlEvent)controlEvent
{
    //check whether selector is already saved, otherwise it will get called twice
    
    NSMutableDictionary *mdicSelector = [[NSMutableDictionary alloc]init];
    
    [mdicSelector setObject:target forKey:@"target"];
    [mdicSelector setObject:[NSValue valueWithPointer:selector] forKey:@"selector"];
    
    if (object)
    {
        [mdicSelector setObject:object forKey:@"object"];
    }
    
    [mdicSelector setObject:[NSNumber numberWithInt:controlEvent] forKey:@"controlEvent"];
    
    
    
    [marrSelectors addObject:mdicSelector];

}

-(void)removeTarget:(id)target selector:(SEL)selector forControlEvent:(SPLabelButtonControlEvent)controlEvent
{
    NSMutableArray *arrSelectors = [marrSelectors mutableCopy]; //Copied to prevent inconsistency
    
    for (int i = 0; i < [arrSelectors count]; i++)
    {
        
        NSDictionary *dicSelector = [arrSelectors objectAtIndex: i];
        
        BOOL shouldRemove = NO;
        BOOL shouldCheckSelector = NO;
        BOOL shouldCheckControlEvent = NO;
        
        id selTarget = [dicSelector objectForKey:@"target"];
        
        NSValue *valSelector = [dicSelector objectForKey:@"selector"];
        
        SEL selSelector = nil;
        
        if (valSelector)
        {
            selSelector = [valSelector pointerValue];
        }
        
        SPLabelButtonControlEvent selControlEvent = [[dicSelector objectForKey:@"controlEvent"]intValue];
        
        if (target != nil)
        {
            if ([selTarget isEqual:target])
            {
                shouldCheckSelector = YES;
            }
        }
        else
        {
            shouldCheckSelector = YES;
        }
        
        if (shouldCheckSelector)
        {
            if (selector != nil)
            {
                if (selSelector == selector)
                {
                    shouldCheckControlEvent = YES;
                }
            }
            else
            {
                shouldCheckControlEvent = YES;
            }
        }
        
        if (shouldCheckControlEvent)
        {
            if (controlEvent == SPLabelButtonControlEventAllEvents)
            {
                shouldRemove = YES;
            }
            else
            {
                if (selControlEvent == controlEvent)
                {
                    shouldRemove = YES;
                }
            }
        }
        
        if (shouldRemove)
        {
            [arrSelectors removeObject:dicSelector];
            i--; //To make sure the next item is checked
        }
    }
    
    marrSelectors = arrSelectors;
}

-(void)removeAllTargets
{
    [marrSelectors removeAllObjects];
}

-(void)controlEventOccured:(SPLabelButtonControlEvent)controlEvent
{
    

    for (NSDictionary *dicSelector in marrSelectors)
    {
        if ([[dicSelector objectForKey:@"controlEvent"]intValue] == controlEvent)
        {
            id target = [dicSelector objectForKey:@"target"];
            
            SEL selector = [[dicSelector objectForKey:@"selector"]pointerValue];
            
            id object = [dicSelector objectForKey:@"object"];
            
            IMP imp = [target methodForSelector:selector];
            
            if (object)
            {
                void (*func)(id, SEL, id) = (void*)imp;
                func (target, selector, object);
            }
            else
            {
                void (*func)(id, SEL) = (void *)imp;
                func(target, selector);
            }
        }
    }
}

@end
