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
    
    //setup the note
    NSString *imageName = [NSString stringWithFormat:@"note_%02ld", (long)type];
    SPNoteNode *note = [self spriteNodeWithImageNamed:imageName];
    note.position = CGPointMake(CGRectGetMidX(frame), CGRectGetMidY(frame));
    note.name = [NSString stringWithFormat:@"note_%02ld", (long)type];
    note.clefType = clef;
    note.noteType = type;
    [note assignNoteLetterToNoteforClef:clef];
    
    //used for training mode
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


- (void)assignNoteLetterToNoteforClef:(SPClefType)clef {

    
    //TODO: add in tenor and alto clefs
    if (clef == SPClefTypeTreble) {
        
        //set the note letters and their corresponding notes
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
    
    
    //loop through all the note values
    for (NSArray *array in [notesDictionary allValues]) {
        
        //assign the note its proper letter
        if ([array containsObject:[NSNumber numberWithInteger:self.noteType]]) {
            
            NSArray *keys = [notesDictionary allKeysForObject:array];
            self.letter = [keys objectAtIndex:0];
            
        }
    }

    
}



@end
