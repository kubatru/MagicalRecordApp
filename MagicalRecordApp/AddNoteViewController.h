//
//  AddNoteViewController.h
//  MagicalRecordApp
//
//  Created by Jakub Truhlar on 06.12.14.
//  Copyright (c) 2014 Jakub Truhlar. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MagicalRecord/CoreData+MagicalRecord.h>
#import "Note.h"

@interface AddNoteViewController : UIViewController

@property (nonatomic, weak) IBOutlet UITextField *titleField;
@property (nonatomic, weak) IBOutlet UITextField *textField;
@property (nonatomic, strong) Note *note;

@end
