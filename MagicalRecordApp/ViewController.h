//
//  ViewController.h
//  MagicalRecordApp
//
//  Created by Jakub Truhlar on 06.12.14.
//  Copyright (c) 2014 Jakub Truhlar. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MagicalRecord/CoreData+MagicalRecord.h>

@interface ViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, weak) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *notes;

@end

