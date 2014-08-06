//
//  SPNotesViewController.h
//  Clef Quizzer
//
//  Created by Stone  Preston on 8/4/14.
//  Copyright (c) 2014 Stone Preston. All rights reserved.
//



@interface SPNotesViewController : UIViewController
- (IBAction)linesCheckboxSelected:(id)sender;

- (IBAction)spacesCheckboxSelected:(id)sender;
- (IBAction)upperLedgerLinesCheckboxSelected:(id)sender;
- (IBAction)lowerLedgerLinesCheckboxSelected:(id)sender;
- (IBAction)linesButtonPressed:(id)sender;
- (IBAction)spacesButtonPressed:(id)sender;
- (IBAction)upperLedgerLinesButtonPressed:(id)sender;
- (IBAction)lowerLedgerLinesButtonPressed:(id)sender;



- (IBAction)nextButtonPressed:(id)sender;

@property (weak, nonatomic) IBOutlet UIButton *linesCheckbox;
@property (weak, nonatomic) IBOutlet UIButton *spacesCheckbox;
@property (weak, nonatomic) IBOutlet UIButton *upperLedgerLinesCheckbox;
@property (weak, nonatomic) IBOutlet UIButton *lowerLedgerLinesCheckbox;




@end
