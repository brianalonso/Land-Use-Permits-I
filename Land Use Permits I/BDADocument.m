//
//  BDADocument.m
//  Land Use Permits I
//
//  Created by Brian Alonso on 11/22/12.
//  Copyright (c) 2012 Brian Alonso. All rights reserved.
//

#import "BDADocument.h"
#import "Applicant.h"
#import "Property.h"
#import "Application.h"

@implementation BDADocument

- (id)init
{
    self = [super init];
    if (self) {
        // Add your subclass-specific initialization here.
    }
    return self;
}

- (NSString *)windowNibName
{
    // Override returning the nib file name of the document
    // If you need to use a subclass of NSWindowController or if your document supports multiple NSWindowControllers, you should remove this method and override -makeWindowControllers instead.
    return @"BDADocument";
}

- (void)windowControllerDidLoadNib:(NSWindowController *)aController
{
    [super windowControllerDidLoadNib:aController];
    // Add any code here that needs to be executed once the windowController has loaded the document's window.
}

+ (BOOL)autosavesInPlace
{
    return YES;
}

- (IBAction)addRecords:(id)sender {
    Applicant *larry = [Applicant findOrCreateApplicantWithName:@"Larry"
                                                        context:self.managedObjectContext];
    Applicant *moe = [Applicant findOrCreateApplicantWithName:@"Moe"
                                                      context:self.managedObjectContext];
    Applicant *curly = [Applicant findOrCreateApplicantWithName:@"Curly"
                                                        context:self.managedObjectContext];
    
    Property *one = [Property findOrCreatePropertyWithAddress:@"123 1ST ST"
                                                      context:self.managedObjectContext];
    one.propertyValue = @123456;
   
    Property *two = [Property findOrCreatePropertyWithAddress:@"123 2ND ST"
                                                      context:self.managedObjectContext];
    two.propertyValue = @9876543;

    Property *three = [Property findOrCreatePropertyWithAddress:@"123 3RD ST"
                                                        context:self.managedObjectContext];
    three.propertyValue = @4356443;

    Property *four = [Property findOrCreatePropertyWithAddress:@"123 4TH ST"
                                                       context:self.managedObjectContext];
    four.propertyValue = @76542834;

    
    Application *a = [Application findOrCreateApplicationWithPermitNumber:@"10001"
                                                                  context:self.managedObjectContext];
    a.applicant = larry;
    a.property = one;
    a.permitDescription = @"This property is a deserted apartment building";

    Application *b = [Application findOrCreateApplicationWithPermitNumber:@"10002"
                                                                  context:self.managedObjectContext];
    b.applicant = moe;
    b.property = two;
    b.permitDescription = @"This property is a retail storefront.";
    
    Application *c = [Application findOrCreateApplicationWithPermitNumber:@"10003"
                                                                  context:self.managedObjectContext];
    c.applicant = curly;
    c.property = three;
    c.permitDescription = @"Empty lot.";
    
    Application *d = [Application findOrCreateApplicationWithPermitNumber:@"10004"
                                                                  context:self.managedObjectContext];
    d.applicant = larry;
    d.property = four;
    d.permitDescription = @"This property is a 30 story apartment building.";
    
    Application *e = [Application findOrCreateApplicationWithPermitNumber:@"10005"
                                                                  context:self.managedObjectContext];
    e.applicant = moe;
    e.property = one;
    a.permitDescription = @"10 story office building";
    
    Application *f = [Application findOrCreateApplicationWithPermitNumber:@"10006"
                                                                  context:self.managedObjectContext];
    f.applicant = curly;
    f.property = two;
    f.permitDescription = @"Shoe repair shop.";
    
    Application *g = [Application findOrCreateApplicationWithPermitNumber:@"10007"
                                                                  context:self.managedObjectContext];
    g.applicant = larry;
    g.property = three;
    g.permitDescription = @"Private residence";
    
    Application *h = [Application findOrCreateApplicationWithPermitNumber:@"10008"
                                                                  context:self.managedObjectContext];
    h.applicant = moe;
    h.property = four;
    h.permitDescription = @"Nothing of value here.";
                                                                  
    Application *i = [Application findOrCreateApplicationWithPermitNumber:@"10009"
                                                                  context:self.managedObjectContext];
    i.applicant = curly;
    i.property = one;
    i.permitDescription = @"Hotel building.";
                                                                  
    Application *j = [Application findOrCreateApplicationWithPermitNumber:@"10010"
                                                                  context:self.managedObjectContext];
    j.applicant = [Applicant findOrCreateApplicantWithName:@"Shemp"
                                                   context:self.managedObjectContext];
    j.property = [Property findOrCreatePropertyWithAddress:@"123 5TH ST"
                                                   context:self.managedObjectContext];
    
    // set table record count label
    NSNumber *applicationCount = [Application applicationsCount:self.managedObjectContext];
    [[self labelApplicationTableCount] setStringValue: [NSString stringWithFormat:@"%@ of %@", applicationCount, applicationCount]];
}

@end
