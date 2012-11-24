//
//  Property.m
//  Land Use Permits I
//
//  Created by Brian Alonso on 11/22/12.
//  Copyright (c) 2012 Brian Alonso. All rights reserved.
//

#import "Property.h"
#import "Application.h"


@implementation Property

@dynamic address;
@dynamic latitude;
@dynamic longitude;
@dynamic applications;


+ (Property *)findOrCreatePropertyWithAddress:(NSString *)searchName
                                      context:(NSManagedObjectContext *)moc
{
    NSArray *properties = [self propertiesWithAddress:searchName
                                           context:moc];
    Property *result = [properties lastObject];
    
    if (!result) {
        result = [NSEntityDescription
                  insertNewObjectForEntityForName:@"Property"
                  inManagedObjectContext:moc];
        NSAssert(result, @"insert failed");
        result.address = searchName;
    }
    return result;

}
+ (NSArray *)propertiesWithAddress:(NSString *)searchName
                           context:(NSManagedObjectContext *)moc
{
    NSManagedObjectModel *mom = moc.persistentStoreCoordinator.managedObjectModel;
    
    NSFetchRequest *propertiesByAddressFetchRequest =
    [mom fetchRequestFromTemplateWithName:@"PropertiesByAddress"
                    substitutionVariables:@{@"x" : searchName}];
    
    propertiesByAddressFetchRequest.fetchBatchSize = 1;
    
    NSError *error = nil;
    NSArray *results = [moc executeFetchRequest:propertiesByAddressFetchRequest error:&error];
    if (!results) {
        NSLog(@"%@", error.localizedDescription);
    };
    
    return results;
}
@end
