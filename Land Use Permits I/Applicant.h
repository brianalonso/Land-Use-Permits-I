//
//  Applicant.h
//  Land Use Permits I
//
//  Created by Brian Alonso on 11/22/12.
//  Copyright (c) 2012 Brian Alonso. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Applicant : NSManagedObject

@property (nonatomic, copy) NSString * name;
@property (nonatomic, retain) NSSet *applications;
@end

@interface Applicant (CoreDataGeneratedAccessors)

- (void)addApplicationsObject:(NSManagedObject *)value;
- (void)removeApplicationsObject:(NSManagedObject *)value;
- (void)addApplications:(NSSet *)values;
- (void)removeApplications:(NSSet *)values;


+ (Applicant *)findOrCreateApplicantWithName:(NSString *)searchName
                                     context:(NSManagedObjectContext *)moc;

+ (NSArray *)applicantsWithName:(NSString *)searchName
                        context:(NSManagedObjectContext *)moc;

@end
