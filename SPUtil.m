//
//  SPUtil.m
//  Clef Quizzer
//
//  Created by Stone  Preston on 7/23/14.
//  Copyright (c) 2014 Stone Preston. All rights reserved.
//

#import "SPUtil.h"

@implementation SPUtil

//generates a random integer within a given range
+ (NSInteger)randomWithMin:(NSInteger)min max:(NSInteger)max {
    
    return arc4random()%(max-min) + min;
}

//used to determine which note letter should be what color
+ (NSDictionary *)colors {
    
    static NSDictionary *colors = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        colors = @{@"a" : [UIColor greenColor],
                   @"b" : [UIColor brownColor],
                   @"c" : [UIColor darkGrayColor],
                   @"d" : [UIColor blueColor],
                   @"e" : [UIColor redColor],
                   @"f" : [UIColor purpleColor],
                   @"g" : [UIColor cyanColor]};
    });
    return colors;
}

//the note letters 
+ (NSArray *)notes {
    
    static NSArray *notes = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        notes = @[@"a", @"b", @"c", @"d", @"e", @"f", @"g"];
    });
    return notes;
}

@end
