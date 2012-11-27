//
//  Property.h
//  Land Use Permits I
//
//  Created by Brian Alonso on 11/22/12.
//  Copyright (c) 2012 Brian Alonso. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Application;

@interface Property : NSManagedObject

@property (nonatomic, copy) NSString * address;
@property (nonatomic, retain) NSNumber * latitude;
@property (nonatomic, retain) NSNumber * longitude;
@property (nonatomic, retain) NSNumber * propertyValue;
@property (nonatomic, retain) NSSet *applications;
@end

@interface Property (CoreDataGeneratedAccessors)

- (void)addApplicationsObject:(Application *)value;
- (void)removeApplicationsObject:(Application *)value;
- (void)addApplications:(NSSet *)values;
- (void)removeApplications:(NSSet *)values;

+ (Property *)findOrCreatePropertyWithAddress:(NSString *)searchName
                                      context:(NSManagedObjectContext *)moc;
+ (NSArray *)propertiesWithAddress:(NSString *)searchName
                           context:(NSManagedObjectContext *)moc;
@end
