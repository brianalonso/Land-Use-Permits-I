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
@dynamic issueDate;
@dynamic appliedDate;
@dynamic decisionDate;
@dynamic url;
@dynamic permitNumber;
@dynamic category;
@dynamic type;
@dynamic permitDescription;
@dynamic property;
@dynamic applicant;

#pragma mark -
#pragma mark awakeFromInsert method

-(void)awakeFromInsert
{
    self.applicationDate = [NSDate dateWithTimeIntervalSinceNow:-1.*(rand()%1000)*(60.*60.*24.)];
    self.decisionDate = [NSDate dateWithTimeIntervalSinceNow:-1.*(rand()%1000)*(60.*60.*24.)];
    self.appliedDate = [NSDate dateWithTimeIntervalSinceNow:-1.*(rand()%1000)*(60.*60.*24.)];
    self.issueDate = [NSDate dateWithTimeIntervalSinceNow:-1.*(rand()%1000)*(60.*60.*24.)];
    self.url = @"https://data.seattle.gov/Permitting/Land-Use-Permits/uyyd-8gak";
}

#pragma mark -
#pragma mark Class methods
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

+ (NSNumber *)applicationsCount:(NSManagedObjectContext *)moc
{
    NSManagedObjectModel *mom = moc.persistentStoreCoordinator.managedObjectModel;
    
    NSFetchRequest *applicationsCountFetchRequest =
    [mom fetchRequestTemplateForName:@"ApplicationsCount"];
    
    NSError *error = nil;
    NSArray *results = [moc executeFetchRequest:applicationsCountFetchRequest error:&error];
    if (!results) {
        NSLog(@"%@", error.localizedDescription);
    };
    
    return [NSNumber numberWithDouble:[results count]];
}

@end
