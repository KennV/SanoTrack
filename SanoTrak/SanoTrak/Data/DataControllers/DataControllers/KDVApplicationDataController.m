/**
  KDVApplicationDataController.m
  SanoTrak

  Created by Kenn Villegas on 6/9/18.
  Copyright © 2018 Kenn Villegas. All rights reserved.

*/

#import "KDVApplicationDataController.h"

@implementation KDVApplicationDataController

#pragma mark -

-(instancetype)initAllUp {
  if (!(self = [super init])) {
    return nil;
  }
      if (!self.PSK.description) {
          NSLog(@"Could Not Init PSCoordinator");
      }
      if (!self.MOC.description) {
          NSLog(@"Could Not Init Context");
      }
      if (!self.MOM.description) {
          NSLog(@"Could Not Init Model");
      }
  
  [self setCopyDatabaseIfNotPresent:YES];
  NSLog(@"applicationDocumentsDirectory = %@",self.applicationDocumentsDirectory);
  return self;
}

- (NSURL *)applicationDocumentsDirectory {
  // The directory the application uses to store the Core Data store file. This code uses a directory named "edu._Company._Application" in the application's documents directory.
  return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
}

#pragma mark - utilities
// Creates a new entity of the default type and adds it to the managed object context
- (NSManagedObject *)createEntity
{
  return [NSEntityDescription insertNewObjectForEntityForName:self.entityClassName inManagedObjectContext:[self MOC]];
}
// Delete the specified entity
- (void)deleteEntity:(NSManagedObject *)e  {
  [self.MOC deleteObject:e];
}
// Gets entities for the specified request
- (NSMutableArray *)getEntities:(NSString *)entityName sortedBy:(NSSortDescriptor *)sortDescriptor matchingPredicate:(NSPredicate *)predicate
{
  NSError *error = nil;
  
  // Create the request object
  NSFetchRequest *request = [[NSFetchRequest alloc] init];
  
  // Set the entity type to be fetched
  NSEntityDescription *entity = [NSEntityDescription entityForName:entityName inManagedObjectContext:[self MOC]];
  [request setEntity:entity];
  
  // Set the predicate if specified
  if (predicate) {
    [request setPredicate:predicate];
  }
  
  // Set the sort descriptor if specified
  if (sortDescriptor) {
    NSArray *sortDescriptors = [[NSArray alloc] initWithObjects:sortDescriptor, nil];
    [request setSortDescriptors:sortDescriptors];
  }
  
  // Execute the fetch
  NSMutableArray *mutableFetchResults = [[[self MOC] executeFetchRequest:request error:&error] mutableCopy];
  
  if (mutableFetchResults == nil) {
    
    // Handle the error.
  }
  
  return mutableFetchResults;
}

// Gets all entities of the default type
- (NSMutableArray *)getAllEntities
{
  return [self getEntities:self.entityClassName sortedBy:nil matchingPredicate:nil];
}

// Gets entities of the default type matching the predicate
- (NSMutableArray *)getEntitiesMatchingPredicate: (NSPredicate *)p
{
  return [self getEntities:self.entityClassName sortedBy:nil matchingPredicate:p];
}

// Gets entities of the default type matching the predicate string
- (NSMutableArray *)getEntitiesMatchingPredicateString: (NSString *)predicateString, ...;
{
  va_list variadicArguments;
  va_start(variadicArguments, predicateString);
  NSPredicate *predicate = [NSPredicate predicateWithFormat:predicateString
                                                  arguments:variadicArguments];
  va_end(variadicArguments);
  return [self getEntities:self.entityClassName sortedBy:nil matchingPredicate:predicate];
}

// Get entities of the default type sorted by descriptor matching the predicate
- (NSMutableArray *)getEntitiesSortedBy:(NSSortDescriptor *)sortDescriptor
                      matchingPredicate:(NSPredicate *)predicate
{
  return [self getEntities:self.entityClassName sortedBy:sortDescriptor matchingPredicate:predicate];
}
// Gets entities of the specified type sorted by descriptor, and matching the predicate string
- (NSMutableArray *)getEntities:(NSString *)entityName
                       sortedBy:(NSSortDescriptor *)sortDescriptor
        matchingPredicateString:(NSString *)predicateString, ...;
{
  va_list variadicArguments;
  va_start(variadicArguments, predicateString);
  NSPredicate *predicate = [NSPredicate predicateWithFormat:predicateString
                                                  arguments:variadicArguments];
  va_end(variadicArguments);
  return [self getEntities:entityName sortedBy:sortDescriptor matchingPredicate:predicate];
}

// Saves all changes (insert, update, delete) of entities
- (void)saveEntities
{
  NSError *error = nil;
  NSManagedObjectContext *managedObjectContext = self.MOC;
  if (managedObjectContext != nil) {
    if ([managedObjectContext hasChanges] && ![managedObjectContext save:&error]) {
      // Replace this implementation with code to handle the error appropriately.
      // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
      NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
      abort();
    }
  }
}


- (void) injectDataSubController:(KDVApplicationDataController *)subController
{
  subController.MOC = self.MOC;
}

@end
