//
//  SPUtil.h
//  Clef Quizzer
//
//  Created by Stone  Preston on 7/23/14.
//  Copyright (c) 2014 Stone Preston. All rights reserved.
//

#import <Foundation/Foundation.h>

extern NSDictionary *const colors;

static const float SPButtonPadding = 25.0;

static const float SPMenuButtonPadding = 45.0;

static const NSInteger SPMaxLives = 3;

static const NSInteger SPPointsPerCorrectAnswer = 100;

static NSString* const SPGameStateHighScoreKey = @"highScore";

typedef NS_ENUM(NSInteger, SPMode) {
    
    SPModeTraining,
    SPModePractice,
    SPModeChallenge
};

typedef NS_ENUM(NSInteger, SPNoteRange) {
    
    SPNoteRangeLines,
    SPNoteRangeSpaces,
    SPNoteRangeUpperLedgerLines,
    SPNoteRangeLowerLedgerLines
};

typedef NS_ENUM(NSInteger, SPButtonType) {
    
    SPButtonTypeA,
    SPButtonTypeB,
    SPButtonTypeC,
    SPButtonTypeD,
    SPButtonTypeE,
    SPButtonTypeF,
    SPButtonTypeG
};

typedef NS_ENUM(NSInteger, SPNoteTypeTreble) {
    
    SPNoteTypeTrebleLowerD,
    SPNoteTypeTrebleLowerE,
    SPNoteTypeTrebleLowerF,
    SPNoteTypeTrebleLowerG,
    SPNoteTypeTrebleLowerA,
    SPNoteTypeTrebleLowerB,
    SPNoteTypeTrebleLowerC,
    SPNoteTypeTrebleSpaceD,
    SPNoteTypeTrebleLineE,
    SPNoteTypeTrebleSpaceF,
    SPNoteTypeTrebleLineG,
    SPNoteTypeTrebleSpaceA,
    SPNoteTypeTrebleLineB,
    SPNoteTypeTrebleSpaceC,
    SPNoteTypeTrebleLineD,
    SPNoteTypeTrebleSpaceE,
    SPNoteTypeTrebleLineF,
    SPNoteTypeTrebleSpaceG,
    SPNoteTypeTrebleUpperA,
    SPNoteTypeTrebleUpperB,
    SPNoteTypeTrebleUpperC,
    SPNoteTypeTrebleUpperD,
    SPNoteTypeTrebleUpperE,
    SPNoteTypeTrebleUpperF,
    SPNoteTypeTrebleUpperG
    
    
};

typedef NS_ENUM(NSInteger, SPNoteTypeBass) {
    
    SPNoteTypeBassLowerF,
    SPNoteTypeBassLowerG,
    SPNoteTypeBassLowerA,
    SPNoteTypeBassLowerB,
    SPNoteTypeBassLowerC,
    SPNoteTypeBassLowerD,
    SPNoteTypeBassLowerE,
    SPNoteTypeBassSpaceF,
    SPNoteTypeBassLineG,
    SPNoteTypeBassSpaceA,
    SPNoteTypeBassLineB,
    SPNoteTypeBassSpaceC,
    SPNoteTypeBassLineD,
    SPNoteTypeBassSpaceE,
    SPNoteTypeBassLineF,
    SPNoteTypeBassSpaceG,
    SPNoteTypeBassLineA,
    SPNoteTypeBassSpaceB,
    SPNoteTypeBassUpperC,
    SPNoteTypeBassUpperD,
    SPNoteTypeBassUpperE,
    SPNoteTypeBassUpperF,
    SPNoteTypeBassUpperG,
    SPNoteTypeBassUpperA,
    SPNoteTypeBassUpperB

};

typedef NS_ENUM(NSInteger, SPClefType) {
    
    SPClefTypeTreble,
    SPClefTypeBass,
    SPClefTypeTenor,
    SPClefTypeAlto
    
};


@interface SPUtil : NSObject

+ (NSDictionary *)colors;

+ (NSArray *)notes;

+ (NSInteger)randomWithMin:(NSInteger)min max:(NSInteger)max;

@end
