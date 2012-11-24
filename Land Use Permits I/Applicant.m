//
//  Applicant.m
//  Land Use Permits I
//
//  Created by Brian Alonso on 11/22/12.
//  Copyright (c) 2012 Brian Alonso. All rights reserved.
//

#import "Applicant.h"


@implementation Applicant

@dynamic name;
@dynamic applications;

+ (Applicant *)findOrCreateApplicantWithName:(NSString *)searchName
                                     context:(NSManagedObjectContext *)moc
{
    NSArray *applicants = [self applicantsWithName:searchName
                                           context:moc];
    Applicant *result = [applicants lastObject];
    
    if (!result) {
        result = [NSEntityDescription
                  insertNewObjectForEntityForName:@"Applicant"
                  inManagedObjectContext:moc];
        NSAssert(result, @"insert failed");
        result.name = searchName;
    }
    return result;
}

+ (NSArray *)applicantsWithName:(NSString *)searchName
                        context:(NSManagedObjectContext *)moc
{
    NSManagedObjectModel *mom = moc.persistentStoreCoordinator.managedObjectModel;
    
    NSFetchRequest *applicantsNamesFetchRequest =
    [mom fetchRequestFromTemplateWithName:@"ApplicantsByName"
                    substitutionVariables:@{@"x" : searchName}];
    
    applicantsNamesFetchRequest.fetchBatchSize = 1;
    
    NSError *error = nil;
    NSArray *results = [moc executeFetchRequest:applicantsNamesFetchRequest error:&error];
    if (!results) {
        NSLog(@"%@", error.localizedDescription);
    };
    
    return results;
}

@end
