#import "OCMutableCollectionConstruction.h"


@implementation NSArray (OCMutableCollectionConstruction)

- (id)newMutableCollectionInstace {
	return [NSMutableArray array];
}

- (void)addObject:(id)obj toMutableCollection:(id)collection {
	[collection addObject:obj];
}

- (id)newCollectionFromMutableCollection:(id)collection {
	return [self.class arrayWithArray:collection];
}

@end


@implementation NSSet (OCMutableCollectionConstruction)

- (id)newMutableCollectionInstace {
	return [NSMutableSet set];
}

- (void)addObject:(id)obj toMutableCollection:(id)collection {
	[collection addObject:obj];
}

- (id)newCollectionFromMutableCollection:(id)collection {
	return [self.class setWithSet:collection];
}

@end
