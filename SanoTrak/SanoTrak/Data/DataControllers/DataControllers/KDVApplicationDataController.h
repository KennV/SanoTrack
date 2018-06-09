/**
  KDVApplicationDataController.h
  SanoTrak

  Created by Kenn Villegas on 6/9/18.
  Copyright © 2018 Kenn Villegas. All rights reserved.
*/

#import "KDVAbstractDataController.h"
#import "SanoTrak+CoreDataModel.h"

@interface KDVApplicationDataController <T: KDVAbstractEntity*> : KDVAbstractDataController <NSFetchedResultsControllerDelegate>
/**
 Default init()
 
 @return myself
 */
-(instancetype)initAllUp;

/**
 Create a new entity of the default type in this PSK
 
 @return A NSMO ot this ClassType
 */
- (NSManagedObject *)createEntity;
//

/**
 Mark the specified entity for deletion
 
 @param e the specified entity
 */
- (void) deleteEntity:(NSManagedObject *)e;

/**
 Gets all entities of the default type
 
 @return All entities of the default type
 */
- (NSMutableArray *)getAllEntities;

/**
 Gets entities of the default type matching the predicate
 
 @param p Predicate
 @return All default types matching the predicate
 */
- (NSMutableArray *)getEntitiesMatchingPredicate:(NSPredicate *)p;

// Gets entities of the default type matching the predicate string
- (NSMutableArray *)getEntitiesMatchingPredicateString: (NSString *)predicateString, ...;

/**
 Get entities of the default type sorted by descriptor matching the predicate
 
 @param sortDescriptor Sorting Key
 @param predicate Pred Key
 @return Stuff
 */
- (NSMutableArray *)getEntitiesSortedBy:(NSSortDescriptor *) sortDescriptor matchingPredicate:(NSPredicate *)predicate;

/**
 Get entities of the specified type sorted by descriptor matching the predicate
 
 @param entityName ClassName
 @param sortDescriptor Sort Key
 @param predicate Pred Key
 @return Stuff
 */
- (NSMutableArray *)getEntities:(NSString *)entityName sortedBy:
(NSSortDescriptor *)sortDescriptor matchingPredicate:(NSPredicate *)predicate;

/**
 Get entities of the specified type sorted by descriptor matching the predicate string
 
 @param entityName e
 @param sortDescriptor s
 @param predicateString p
 @return Stuff
 */
- (NSMutableArray *)getEntities:(NSString *)entityName sortedBy:
(NSSortDescriptor *)sortDescriptor matchingPredicateString:(NSString *)predicateString, ...;

/**
 Jive Save Context
 */
//- (void)saveContext;

/**
 Saves changes to all entities managed by the object context
 */
- (void)saveEntities;

/**
 Register a related business controller object
 This causes them to use the same object context
 
 @param subController better be the right kind
 */
- (void) injectDataSubController:(KDVApplicationDataController *)subController;

@end
