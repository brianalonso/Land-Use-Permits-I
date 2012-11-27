//
//  BDADocument.h
//  Land Use Permits I
//
//  Created by Brian Alonso on 11/22/12.
//  Copyright (c) 2012 Brian Alonso. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface BDADocument : NSPersistentDocument
- (IBAction)addRecords:(id)sender;
@property (assign) IBOutlet NSTextField *labelApplicationTableCount;
@property (assign) IBOutlet NSSearchField *applicationsSearchBar;

@end
