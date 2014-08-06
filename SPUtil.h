//
//  SPUtil.h
//  Clef Quizzer
//
//  Created by Stone  Preston on 7/23/14.
//  Copyright (c) 2014 Stone Preston. All rights reserved.
//

#import <Foundation/Foundation.h>

//used the determine which note letter is which color
extern NSDictionary *const colors;

//how far apart to space the buttons
static const float SPButtonPadding = 25.0;

//max number of lives in challenge mode
static const NSInteger SPMaxLives = 3;

//points awarded to user for correct answer in challenge mode
static const NSInteger SPPointsPerCorrectAnswer = 100;

//used in SPGameState to save highscore
static NSString* const SPGameStateHighScoreKey = @"highScore";

//modes
typedef NS_ENUM(NSInteger, SPMode) {
    
    SPModeTraining,
    SPModePractice,
    SPModeChallenge
};

//note ranges
typedef NS_ENUM(NSInteger, SPNoteRange) {
    
    SPNoteRangeLines,
    SPNoteRangeSpaces,
    SPNoteRangeUpperLedgerLines,
    SPNoteRangeLowerLedgerLines
};

//button types
typedef NS_ENUM(NSInteger, SPButtonType) {
    
    SPButtonTypeA,
    SPButtonTypeB,
    SPButtonTypeC,
    SPButtonTypeD,
    SPButtonTypeE,
    SPButtonTypeF,
    SPButtonTypeG
};

//treble note types
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


//bass note types
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

//TODO: add tenor and alto note type enums

//clefs
typedef NS_ENUM(NSInteger, SPClefType) {
    
    SPClefTypeTreble,
    SPClefTypeBass,
    SPClefTypeTenor,
    SPClefTypeAlto
    
};


@interface SPUtil : NSObject

//returns the colors dictionary
+ (NSDictionary *)colors;

//returns the array of note letters
+ (NSArray *)notes;

//generates a radom integer
+ (NSInteger)randomWithMin:(NSInteger)min max:(NSInteger)max;

@end
