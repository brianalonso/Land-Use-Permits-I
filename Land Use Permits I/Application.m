//
//  Application.m
//  Land Use Permits I
//
//  Created by Brian Alonso on 11/22/12.
//  Copyright (c) 2012 Brian Alonso. All rights reserved.
//

#import "Application.h"
#import "Applicant.h"


@implementation Application

@dynamic applicationDate;
@dynamic url;
@dynamic permitNumber;
@dynamic category;
@dynamic type;
@dynamic permitDescription;
@dynamic property;
@dynamic applicant;


+ (Application *)findOrCreateApplicationWithPermitNumber:(NSString *)searchName
                                                 context:(NSManagedObjectContext *)moc
{
    NSArray *applications = [self applicationsWithPermitNumber:searchName
                                           context:moc];
    Application *result = [applications lastObject];
    
    if (!result) {
        result = [NSEntityDescription
                  insertNewObjectForEntityForName:@"Application"
                  inManagedObjectContext:moc];
        NSAssert(result, @"insert failed");
        result.permitNumber = searchName;
    }
    return result;

    
}

+ (NSArray *)applicationsWithPermitNumber:(NSString *)searchName
                                  context:(NSManagedObjectContext *)moc
{
    NSManagedObjectModel *mom = moc.persistentStoreCoordinator.managedObjectModel;
    
    NSFetchRequest *applicationsWithPermitNumberFetchRequest =
    [mom fetchRequestFromTemplateWithName:@"ApplicationsByPermit"
                    substitutionVariables:@{@"x" : searchName}];
    
    applicationsWithPermitNumberFetchRequest.fetchBatchSize = 1;
    
    NSError *error = nil;
    NSArray *results = [moc executeFetchRequest:applicationsWithPermitNumberFetchRequest error:&error];
    if (!results) {
        NSLog(@"%@", error.localizedDescription);
    };
    
    return results;

}
@end
