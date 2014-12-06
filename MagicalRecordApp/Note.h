//
//  Note.h
//  MagicalRecordApp
//
//  Created by Jakub Truhlar on 06.12.14.
//  Copyright (c) 2014 Jakub Truhlar. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@interface Note : NSManagedObject

@property (nonatomic, retain) NSString * titleField;
@property (nonatomic, retain) NSString * textField;

@end
