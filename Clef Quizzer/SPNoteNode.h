//
//  SPNoteNode.h
//  Clef Quizzer
//
//  Created by Stone  Preston on 7/23/14.
//  Copyright (c) 2014 Stone Preston. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>
#import "SPUtil.h"


@interface SPNoteNode : SKSpriteNode

+ (instancetype)noteOfType:(NSInteger)type forClef:(SPClefType)clef inFrame:(CGRect)frame colored:(BOOL)colored;

//+ (instancetype)randomLineNoteForClef:(SPClefType)clef inFrame:(CGRect)frame colored:(BOOL)colored;
//
//+ (instancetype)randomSpaceNoteForClef:(SPClefType)clef inFrame:(CGRect)frame colored:(BOOL)colored;
//
//+ (instancetype)randomUpperLedgerLineNoteForClef:(SPClefType)clef inFrame:(CGRect)frame colored:(BOOL)colored;
//
//+ (instancetype)randomLowerLedgerLineNoteForClef:(SPClefType)clef inFrame:(CGRect)frame colored:(BOOL)colored;
//
//+ (instancetype)randomNoteForClef:(SPClefType)clef inFrame:(CGRect)frame colored:(BOOL)colored;

@property (nonatomic) SPClefType clefType;
@property (nonatomic) NSInteger noteType;
@property (nonatomic) NSString *letter;

@property (nonatomic) NSArray *aNotes;
@property (nonatomic) NSArray *bNotes;
@property (nonatomic) NSArray *cNotes;
@property (nonatomic) NSArray *dNotes;
@property (nonatomic) NSArray *eNotes;
@property (nonatomic) NSArray *fNotes;
@property (nonatomic) NSArray *gNotes;

@end
