//
//  Application.h
//  Land Use Permits I
//
//  Created by Brian Alonso on 11/22/12.
//  Copyright (c) 2012 Brian Alonso. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Applicant;

@interface Application : NSManagedObject

@property (nonatomic, retain) NSDate * applicationDate;
@property (nonatomic, copy) NSString * url;
@property (nonatomic, copy) NSString * permitNumber;
@property (nonatomic, copy) NSString * category;
@property (nonatomic, copy) NSString * type;
@property (nonatomic, copy) NSString * permitDescription;
@property (nonatomic, retain) NSManagedObject *property;
@property (nonatomic, retain) Applicant *applicant;

+ (Application *)findOrCreateApplicationWithPermitNumber:(NSString *)searchName
                                                 context:(NSManagedObjectContext *)moc;
+ (NSArray *)applicationsWithPermitNumber:(NSString *)searchName
                                  context:(NSManagedObjectContext *)moc;
@end
