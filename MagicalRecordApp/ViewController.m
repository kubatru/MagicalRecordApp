//
//  ViewController.m
//  MagicalRecordApp
//
//  Created by Jakub Truhlar on 06.12.14.
//  Copyright (c) 2014 Jakub Truhlar. All rights reserved.
//

#import "ViewController.h"
#import "AddNoteViewController.h"
#import "Note.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    // Apply appearance
    [self applyAppearance];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    // Fetch Notes
    [self fetchNotes];
    
    // Reload Table View
    [self.tableView reloadData];
}

- (void)applyAppearance {
    
    // Create Add Button
    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addNoteBtnPressed:)];
    self.navigationItem.rightBarButtonItem = addButton;
}

- (IBAction)addNoteBtnPressed:(id)sender {
    
    // This is initialization with storyboard identification
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    AddNoteViewController *viewController = [storyboard instantiateViewControllerWithIdentifier:@"newNote"];
    viewController.navigationItem.title = @"New note";
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:viewController];
    [self presentViewController:navigationController animated:true completion:nil];
}

- (void)fetchNotes {
    // Fetch Notes
    // self.notes = [NSMutableArray arrayWithArray:[Note findAll]];
    self.notes = [NSMutableArray arrayWithArray:[Note MR_findAllSortedBy:@"titleField" ascending:YES]];
}

#pragma mark - TableView DataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return [_notes count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }
    
    cell.textLabel.text = [[self.notes objectAtIndex:indexPath.row] titleField];
    cell.detailTextLabel.text = [[self.notes objectAtIndex:indexPath.row] textField];

    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 60;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
