#import "OCCollectionCapabilities.h"
#import "NSDictionary+OpinionatedExtensions.h"
#import "NSString+OpinionatedExtensions.h"
#import "OCAssociation.h"
#import "OCEnumerators.h"


@implementation NSArray (OCCollectionCapabilities)

- (id)oc_createMutableInstanceOfMyKind {
	return [NSMutableArray array];
}

- (NSEnumerator *)oc_collectionEnumerator {
	return [self objectEnumerator];
}

- (void)oc_addObject:(id)obj toMutableCollection:(id)collection {
	[collection addObject:obj];
}

- (id)oc_createCollectionOfMyKindFromMutableCollection:(id)collection {
	return [self.class arrayWithArray:collection];
}

@end


@implementation NSNull (OCCollectionCapabilities)

- (NSEnumerator *)oc_collectionEnumerator {
	return [[OCNullEnumerator alloc] init];
}

@end


@implementation NSDictionary (OCCollectionCapabilities)

- (id)oc_createMutableInstanceOfMyKind {
	return [NSMutableDictionary dictionary];
}

- (NSEnumerator *)oc_collectionEnumerator {
	return [self associationEnumerator];
}

- (void)oc_addObject:(id)obj toMutableCollection:(id)collection {
	OCAssociation *assoc = obj;
	[collection setObject:assoc.value forKey:assoc.key];
}

- (id)oc_createCollectionOfMyKindFromMutableCollection:(id)collection {
	return [self.class dictionaryWithDictionary:collection];
}

@end


@implementation NSSet (OCCollectionCapabilities)

- (id)oc_createMutableInstanceOfMyKind {
	return [NSMutableSet set];
}

- (NSEnumerator *)oc_collectionEnumerator {
	return [self objectEnumerator];
}

- (void)oc_addObject:(id)obj toMutableCollection:(id)collection {
	[collection addObject:obj];
}

- (id)oc_createCollectionOfMyKindFromMutableCollection:(id)collection {
	return [self.class setWithSet:collection];
}

@end


@implementation NSString (OCCollectionCapabilities)

- (id)oc_createMutableInstanceOfMyKind {
	return [NSMutableString stringWithString:@""];
}

- (NSEnumerator *)oc_collectionEnumerator {
	return [self characterEnumerator];
}

- (void)oc_addObject:(id)obj toMutableCollection:(id)collection {
	[collection appendString:obj];
}

- (id)oc_createCollectionOfMyKindFromMutableCollection:(id)collection {
	// there is no reliable way to distinguish between mutable and immutable
	// string instances; [self.class stringWithString:collection] would crash
	// with _NSCFString instances (constant strings)
	return collection;
}

@end
