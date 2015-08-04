#import "OCMutableCollectionConstruction.h"
#import "NSDictionary+OpinionatedExtensions.h"
#import "OCAssociation.h"


@implementation NSArray (OCMutableCollectionConstruction)

- (id)newMutableCollectionInstace {
	return [NSMutableArray array];
}

- (NSEnumerator *)collectionEnumerator {
	return [self objectEnumerator];
}

- (void)addObject:(id)obj toMutableCollection:(id)collection {
	[collection addObject:obj];
}

- (id)newCollectionFromMutableCollection:(id)collection {
	return [self.class arrayWithArray:collection];
}

@end


@implementation NSDictionary (OCMutableCollectionConstruction)

- (id)newMutableCollectionInstace {
	return [NSMutableDictionary dictionary];
}

- (NSEnumerator *)collectionEnumerator {
	return [self associationEnumerator];
}

- (void)addObject:(id)obj toMutableCollection:(id)collection {
	OCAssociation *assoc = obj;
	[collection setObject:assoc.value forKey:assoc.key];
}

- (id)newCollectionFromMutableCollection:(id)collection {
	return [self.class dictionaryWithDictionary:collection];
}

@end


@implementation NSSet (OCMutableCollectionConstruction)

- (id)newMutableCollectionInstace {
	return [NSMutableSet set];
}

- (NSEnumerator *)collectionEnumerator {
	return [self objectEnumerator];
}

- (void)addObject:(id)obj toMutableCollection:(id)collection {
	[collection addObject:obj];
}

- (id)newCollectionFromMutableCollection:(id)collection {
	return [self.class setWithSet:collection];
}

@end
