#import "NSDictionary+OpinionatedExtensions.h"
#import "OCEnumerators.h"
#import "OCAssociation.h"


@implementation NSDictionary (OpinionatedExtensions)

- (NSEnumerator *)associationEnumerator {
	return [[OCAssociationEnumerator alloc] initWithDictionary:self];
}

- (id)at:(id)aKey ifAbsent:(OCAbsentBlock)aBlock {
	id value = [self objectForKey:aKey];
	return value ?: aBlock();
}

- (id)at:(id)aKey ifPresent:(OCPresentBlock)aBlock {
	id value = [self objectForKey:aKey];
	return value ? aBlock(value) : nil;
}

- (BOOL)includesKey:(id)aKey {
	return [self objectForKey:aKey] != nil;
}

- (BOOL)includesValue:(id)aValue {
	return [[self allValues] containsObject:aValue];
}

@end


@implementation NSMutableDictionary (OpinionatedExtensions)

- (OCAssociation *)add:(OCAssociation *)anAssociation {
	[self setObject:anAssociation.value forKey:anAssociation.key];
	return anAssociation;
}

- (id)at:(id)aKey put:(id)aValue {
	[self setObject:aValue forKey:aKey];
	return aValue;
}

- (id)at:(id)aKey ifAbsentPut:(OCAbsentBlock)aBlock {
	return [self at:aKey ifAbsent:^id{
		return [self at:aKey put:aBlock()];
	}];
}

@end
