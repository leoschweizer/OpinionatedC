#import "OCInterval.h"
#import "OCEnumerators.h"


@implementation OCInterval

- (instancetype)initWithFrom:(NSInteger)from to:(NSInteger)to by:(NSInteger)by {
	if (self = [super init]) {
		_from = from;
		_to = to;
		_by = by;
	}
	return self;
}

- (id)oc_createMutableInstanceOfMyKind {
	return [NSMutableArray array];
}

- (void)oc_addObject:(id)obj toMutableCollection:(id)collection {
	[collection addObject:obj];
}

- (id)oc_createCollectionOfMyKindFromMutableCollection:(id)collection {
	return [NSArray arrayWithArray:collection];
}

- (NSEnumerator *)oc_collectionEnumerator {
	return [self intervalEnumerator];
}

- (NSEnumerator *)intervalEnumerator {
	return [[OCIntervalEnumerator alloc] initWithInterval:self];
}

@end
