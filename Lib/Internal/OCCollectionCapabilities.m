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


@implementation NSMapTable (OCCollectionCapabilities)

- (id)oc_createMutableInstanceOfMyKind {
	return [[NSMapTable alloc] initWithKeyPointerFunctions:self.keyPointerFunctions valuePointerFunctions:self.valuePointerFunctions capacity:self.count];
}

- (NSEnumerator *)oc_collectionEnumerator {
	return [[OCMapTableEnumerator alloc] initWithMapTable:self];
}

- (void)oc_addObject:(id)obj toMutableCollection:(id)collection {
	NSMapTable *mapTable = collection;
	OCAssociation *association = obj;
	[mapTable setObject:association.value forKey:association.key];
}

- (id)oc_createCollectionOfMyKindFromMutableCollection:(id)collection {
	// there are no mutable/immutable variants of NSMapTable, so it is
	// safe to just return colleciton here
	return collection;
}

@end


@implementation NSPointerArray (OCCollectionCapabilities)

- (void)oc_addObject:(id)object {
	[self addPointer:(__bridge void *)object];
}

- (id)oc_createMutableInstanceOfMyKind {
	return [NSPointerArray pointerArrayWithPointerFunctions:self.pointerFunctions];
}

- (NSEnumerator *)oc_collectionEnumerator {
	return [self.allObjects objectEnumerator];
}

- (void)oc_addObject:(id)obj toMutableCollection:(id)collection {
	NSPointerArray *other = collection;
	[other oc_addObject:obj];
}

- (id)oc_createCollectionOfMyKindFromMutableCollection:(id)collection {
	// there are no mutable/immutable variants of NSPointerArray, so it is
	// safe to just return colleciton here
	return collection;
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
