//
//  SPNoteNode.m
//  Clef Quizzer
//
//  Created by Stone  Preston on 7/23/14.
//  Copyright (c) 2014 Stone Preston. All rights reserved.
//

#import "SPNoteNode.h"
#import "SPUtil.h"

@implementation SPNoteNode

+ (instancetype)noteOfType:(NSInteger)type forClef:(SPClefType)clef inFrame:(CGRect)frame colored:(BOOL)colored {
    
    NSString *imageName = [NSString stringWithFormat:@"note_%02ld", (long)type];
    SPNoteNode *note = [self spriteNodeWithImageNamed:imageName];
    note.position = CGPointMake(CGRectGetMidX(frame), CGRectGetMidY(frame));
    note.name = [NSString stringWithFormat:@"note_%02ld", (long)type];
    note.clefType = clef;
    note.noteType = type;
    [note assignNoteLetterToNoteforClef:clef];
    
    
    if (colored) {
        
        //color the note with the corresponding color
        note.color = [[SPUtil colors] objectForKey:note.letter];
        note.colorBlendFactor = 1.0;
        
        
    } else {
        
        //color the note black for non training modes
        note.color = [SKColor blackColor];
        note.colorBlendFactor = 1.0;
    }
    
    

    
    return note;
}

//+ (instancetype)randomLineNoteForClef:(SPClefType)clef inFrame:(CGRect)frame colored:(BOOL)colored {
//    
//    NSArray *noteRange;
//    NSInteger randomNoteType;
//    
//    switch (clef) {
//            
//        case SPClefTypeTreble:
//            
//            noteRange = @[[NSNumber numberWithInteger:SPNoteTypeTrebleLineB],
//                          [NSNumber numberWithInteger:SPNoteTypeTrebleLineD],
//                          [NSNumber numberWithInteger:SPNoteTypeTrebleLineE],
//                          [NSNumber numberWithInteger:SPNoteTypeTrebleLineF],
//                          [NSNumber numberWithInteger:SPNoteTypeTrebleLineG]];
//            randomNoteType = [noteRange[[SPUtil randomWithMin:0 max:noteRange.count]] integerValue];
//            
//            break;
//            
//        case SPClefTypeBass:
//            
//            noteRange = @[[NSNumber numberWithInteger:SPNoteTypeBassLineA],
//                          [NSNumber numberWithInteger:SPNoteTypeBassLineB],
//                          [NSNumber numberWithInteger:SPNoteTypeBassLineD],
//                          [NSNumber numberWithInteger:SPNoteTypeBassLineF],
//                          [NSNumber numberWithInteger:SPNoteTypeBassLineG]];
//            randomNoteType = [noteRange[[SPUtil randomWithMin:0 max:noteRange.count]] integerValue];
//            
//        default:
//            break;
//    }
//    
//    SPNoteNode *note = [SPNoteNode noteOfType:randomNoteType forClef:clef inFrame:frame colored:colored];
//    [note assignNoteLetterToNoteforClef:clef];
//    return note;
//
//    
//    
//}
//
//+ (instancetype)randomSpaceNoteForClef:(SPClefType)clef inFrame:(CGRect)frame colored:(BOOL)colored {
//    
//    NSArray *noteRange;
//    NSInteger randomNoteType;
//    
//    switch (clef) {
//            
//        case SPClefTypeTreble:
//            
//            noteRange = @[[NSNumber numberWithInteger:SPNoteTypeTrebleSpaceA],
//                          [NSNumber numberWithInteger:SPNoteTypeTrebleSpaceC],
//                          [NSNumber numberWithInteger:SPNoteTypeTrebleSpaceE],
//                          [NSNumber numberWithInteger:SPNoteTypeTrebleSpaceF]];
//            
//            randomNoteType = [noteRange[[SPUtil randomWithMin:0 max:noteRange.count]] integerValue];
//            
//            break;
//            
//        case SPClefTypeBass:
//            
//            noteRange = @[[NSNumber numberWithInteger:SPNoteTypeBassSpaceA],
//                          [NSNumber numberWithInteger:SPNoteTypeBassSpaceC],
//                          [NSNumber numberWithInteger:SPNoteTypeBassSpaceE],
//                          [NSNumber numberWithInteger:SPNoteTypeBassSpaceG]];
//            randomNoteType = [noteRange[[SPUtil randomWithMin:0 max:noteRange.count]] integerValue];
//            
//        default:
//            break;
//    }
//    
//    SPNoteNode *note = [SPNoteNode noteOfType:randomNoteType forClef:clef inFrame:frame colored:colored];
//    [note assignNoteLetterToNoteforClef:clef];
//    return note;
//    
//    
//    
//}
//
//+ (instancetype)randomUpperLedgerLineNoteForClef:(SPClefType)clef inFrame:(CGRect)frame colored:(BOOL)colored {
//    
//    NSArray *noteRange;
//    NSInteger randomNoteType;
//    
//    switch (clef) {
//            
//        case SPClefTypeTreble:
//            
//            noteRange = @[[NSNumber numberWithInteger:SPNoteTypeTrebleSpaceG],
//                          [NSNumber numberWithInteger:SPNoteTypeTrebleUpperA],
//                          [NSNumber numberWithInteger:SPNoteTypeTrebleUpperB],
//                          [NSNumber numberWithInteger:SPNoteTypeTrebleUpperC],
//                          [NSNumber numberWithInteger:SPNoteTypeTrebleUpperD],
//                          [NSNumber numberWithInteger:SPNoteTypeTrebleUpperE],
//                          [NSNumber numberWithInteger:SPNoteTypeTrebleUpperF],
//                          [NSNumber numberWithInteger:SPNoteTypeTrebleUpperG]];
//            randomNoteType = [noteRange[[SPUtil randomWithMin:0 max:noteRange.count]] integerValue];
//            
//            break;
//            
//        case SPClefTypeBass:
//            
//            noteRange = @[[NSNumber numberWithInteger:SPNoteTypeBassSpaceB],
//                           [NSNumber numberWithInteger:SPNoteTypeBassUpperA],
//                           [NSNumber numberWithInteger:SPNoteTypeBassUpperB],
//                           [NSNumber numberWithInteger:SPNoteTypeBassUpperC],
//                           [NSNumber numberWithInteger:SPNoteTypeBassUpperD],
//                           [NSNumber numberWithInteger:SPNoteTypeBassUpperE],
//                           [NSNumber numberWithInteger:SPNoteTypeBassUpperF],
//                           [NSNumber numberWithInteger:SPNoteTypeBassUpperG]];
//            randomNoteType = [noteRange[[SPUtil randomWithMin:0 max:noteRange.count]] integerValue];
//            
//        default:
//            break;
//    }
//    
//    SPNoteNode *note = [SPNoteNode noteOfType:randomNoteType forClef:clef inFrame:frame colored:colored];
//    [note assignNoteLetterToNoteforClef:clef];
//    return note;
//    
//    
//    
//}
//
//+ (instancetype)randomLowerLedgerLineNoteForClef:(SPClefType)clef inFrame:(CGRect)frame colored:(BOOL)colored {
//    
//    NSArray *noteRange;
//    NSInteger randomNoteType;
//    
//    switch (clef) {
//            
//        case SPClefTypeTreble:
//            
//            noteRange = @[[NSNumber numberWithInteger:SPNoteTypeTrebleSpaceD],
//                          [NSNumber numberWithInteger:SPNoteTypeTrebleLowerA],
//                          [NSNumber numberWithInteger:SPNoteTypeTrebleLowerB],
//                          [NSNumber numberWithInteger:SPNoteTypeTrebleLowerC],
//                          [NSNumber numberWithInteger:SPNoteTypeTrebleLowerD],
//                          [NSNumber numberWithInteger:SPNoteTypeTrebleLowerE],
//                          [NSNumber numberWithInteger:SPNoteTypeTrebleLowerF],
//                          [NSNumber numberWithInteger:SPNoteTypeTrebleLowerG]];
//            randomNoteType = [noteRange[[SPUtil randomWithMin:0 max:noteRange.count]] integerValue];
//            
//            break;
//            
//        case SPClefTypeBass:
//            
//            noteRange = @[[NSNumber numberWithInteger:SPNoteTypeBassSpaceF],
//                          [NSNumber numberWithInteger:SPNoteTypeBassLowerA],
//                          [NSNumber numberWithInteger:SPNoteTypeBassLowerB],
//                          [NSNumber numberWithInteger:SPNoteTypeBassLowerC],
//                          [NSNumber numberWithInteger:SPNoteTypeBassLowerD],
//                          [NSNumber numberWithInteger:SPNoteTypeBassLowerE],
//                          [NSNumber numberWithInteger:SPNoteTypeBassLowerF],
//                          [NSNumber numberWithInteger:SPNoteTypeBassLowerG]];
//            randomNoteType = [noteRange[[SPUtil randomWithMin:0 max:noteRange.count]] integerValue];
//            
//        default:
//            break;
//    }
//    
//    SPNoteNode *note = [SPNoteNode noteOfType:randomNoteType forClef:clef inFrame:frame colored:colored];
//    [note assignNoteLetterToNoteforClef:clef];
//    return note;
//    
//    
//    
//}
//
//+ (instancetype)randomNoteForClef:(SPClefType)clef inFrame:(CGRect)frame colored:(BOOL)colored {
//    
//    NSInteger randomNoteType;
//    
//    switch (clef) {
//            
//        case SPClefTypeTreble:
//            
//            randomNoteType = [SPUtil randomWithMin:0 max:SPNoteTypeTrebleUpperG + 1];
//            
//            break;
//            
//        case SPClefTypeBass:
//            
//            randomNoteType = [SPUtil randomWithMin:0 max:SPNoteTypeTrebleUpperB + 1];
//            
//        default:
//            break;
//    }
//    
//    SPNoteNode *note = [SPNoteNode noteOfType:randomNoteType forClef:clef inFrame:frame colored:colored];
//    [note assignNoteLetterToNoteforClef:clef];
//    return note;
//    
//    
//    
//}
//



- (void)assignNoteLetterToNoteforClef:(SPClefType)clef {

    
    
    if (clef == SPClefTypeTreble) {
        
        self.aNotes = @[[NSNumber numberWithInteger:SPNoteTypeTrebleLowerA],
                   [NSNumber numberWithInteger:SPNoteTypeTrebleUpperA],
                   [NSNumber numberWithInteger:SPNoteTypeTrebleSpaceA]];
        
        self.bNotes = @[[NSNumber numberWithInteger:SPNoteTypeTrebleLowerB],
                   [NSNumber numberWithInteger:SPNoteTypeTrebleLineB],
                   [NSNumber numberWithInteger:SPNoteTypeTrebleUpperB]];
        
        self.cNotes = @[[NSNumber numberWithInteger:SPNoteTypeTrebleLowerC],
                   [NSNumber numberWithInteger:SPNoteTypeTrebleUpperC],
                   [NSNumber numberWithInteger:SPNoteTypeTrebleSpaceC]];
        
        self.dNotes = @[[NSNumber numberWithInteger:SPNoteTypeTrebleLowerD],
                   [NSNumber numberWithInteger:SPNoteTypeTrebleLineD],
                   [NSNumber numberWithInteger:SPNoteTypeTrebleSpaceD],
                   [NSNumber numberWithInteger:SPNoteTypeTrebleUpperD]];
        
        self.eNotes = @[[NSNumber numberWithInteger:SPNoteTypeTrebleLowerE],
                   [NSNumber numberWithInteger:SPNoteTypeTrebleLineE],
                   [NSNumber numberWithInteger:SPNoteTypeTrebleSpaceE],
                   [NSNumber numberWithInteger:SPNoteTypeTrebleUpperE]];
        
        self.fNotes = @[[NSNumber numberWithInteger:SPNoteTypeTrebleLowerF],
                   [NSNumber numberWithInteger:SPNoteTypeTrebleLineF],
                   [NSNumber numberWithInteger:SPNoteTypeTrebleSpaceF],
                   [NSNumber numberWithInteger:SPNoteTypeTrebleUpperF]];
        
        self.gNotes = @[[NSNumber numberWithInteger:SPNoteTypeTrebleLowerG],
                   [NSNumber numberWithInteger:SPNoteTypeTrebleLineG],
                   [NSNumber numberWithInteger:SPNoteTypeTrebleSpaceG],
                   [NSNumber numberWithInteger:SPNoteTypeTrebleUpperG]];
        
    } else if (clef == SPClefTypeBass) {
        
        self.aNotes = @[[NSNumber numberWithInteger:SPNoteTypeBassLowerA],
                   [NSNumber numberWithInteger:SPNoteTypeBassUpperA],
                   [NSNumber numberWithInteger:SPNoteTypeBassLineA],
                   [NSNumber numberWithInteger:SPNoteTypeBassSpaceA]];
        
        self.bNotes = @[[NSNumber numberWithInteger:SPNoteTypeBassLowerB],
                   [NSNumber numberWithInteger:SPNoteTypeBassLineB],
                   [NSNumber numberWithInteger:SPNoteTypeBassSpaceB],
                   [NSNumber numberWithInteger:SPNoteTypeBassUpperB]];
        
        self.cNotes = @[[NSNumber numberWithInteger:SPNoteTypeBassLowerC],
                   [NSNumber numberWithInteger:SPNoteTypeBassUpperC],
                   [NSNumber numberWithInteger:SPNoteTypeBassSpaceC]];
        
        self.dNotes = @[[NSNumber numberWithInteger:SPNoteTypeBassLowerD],
                   [NSNumber numberWithInteger:SPNoteTypeBassLineD],
                   [NSNumber numberWithInteger:SPNoteTypeBassUpperD]];
        
        self.eNotes = @[[NSNumber numberWithInteger:SPNoteTypeBassLowerE],
                   [NSNumber numberWithInteger:SPNoteTypeBassSpaceE],
                   [NSNumber numberWithInteger:SPNoteTypeBassUpperE]];
        
        self.fNotes = @[[NSNumber numberWithInteger:SPNoteTypeBassLowerF],
                   [NSNumber numberWithInteger:SPNoteTypeBassLineF],
                   [NSNumber numberWithInteger:SPNoteTypeBassSpaceF],
                   [NSNumber numberWithInteger:SPNoteTypeBassUpperF]];
        
        self.gNotes = @[[NSNumber numberWithInteger:SPNoteTypeBassLowerG],
                   [NSNumber numberWithInteger:SPNoteTypeBassLineG],
                   [NSNumber numberWithInteger:SPNoteTypeBassSpaceG],
                   [NSNumber numberWithInteger:SPNoteTypeBassUpperG]];
        
        
        
        
    }
    
    
    NSDictionary *notesDictionary = @{@"a" : self.aNotes,
                                      @"b" : self.bNotes,
                                      @"c" : self.cNotes,
                                      @"d" : self.dNotes,
                                      @"e" : self.eNotes,
                                      @"f" : self.fNotes,
                                      @"g" : self.gNotes};
    
    
    for (NSArray *array in [notesDictionary allValues]) {
        
        if ([array containsObject:[NSNumber numberWithInteger:self.noteType]]) {
            
            NSArray *keys = [notesDictionary allKeysForObject:array];
            self.letter = [keys objectAtIndex:0];
            
        }
    }

    
}



@end
