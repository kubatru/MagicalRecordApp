//
//  AddNoteViewController.m
//  MagicalRecordApp
//
//  Created by Jakub Truhlar on 06.12.14.
//  Copyright (c) 2014 Jakub Truhlar. All rights reserved.
//

#import "AddNoteViewController.h"

@interface AddNoteViewController ()

@end

@implementation AddNoteViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // Apply appearance
    [self applyAppearance];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)applyAppearance {
    
    // Create Add Button
    UIBarButtonItem *saveButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSave target:self action:@selector(saveNoteBtnPressed:)];
    self.navigationItem.rightBarButtonItem = saveButton;
}

- (IBAction)saveNoteBtnPressed:(id)sender {
    
    // Create Note
    self.note = [Note MR_createEntity];

    // Configure Note
    self.note.titleField = _titleField.text;
    self.note.textField = _textField.text;

    // Save Managed Object Context
    [[NSManagedObjectContext MR_defaultContext] MR_saveToPersistentStoreWithCompletion:^(BOOL success, NSError *error) {
        if (!success) {
            NSLog(@"%@", error);
        }
    }];

    // Vertical transition backwards
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
