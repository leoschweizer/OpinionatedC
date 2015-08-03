#import "NSObject+OpinionatedMapping.h"
#import "OCAssociation.h"


@implementation NSObject (OpinionatedMapping)

- (id)map:(id (^)(id))mapBlock {
	return mapBlock(self);
}

@end


@implementation NSArray (OpinionatedMapping)

- (id)map:(id (^)(id))mapBlock {
	
	NSMutableArray *workingArray = [NSMutableArray arrayWithCapacity:self.count];
	
	[self enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
		id mappedElement = mapBlock(obj);
		[workingArray addObject:mappedElement];
	}];
	
	return [self.class arrayWithArray:workingArray];
	
}

@end


@implementation NSDictionary (OpinionatedMapping)

- (id)map:(id (^)(id))mapBlock {
	
	__block BOOL returnsOnlyAssociations = YES;
	NSMutableArray *workingKeys = [[NSMutableArray alloc] initWithCapacity:self.count];
	NSMutableArray *workingValues = [[NSMutableArray alloc] initWithCapacity:self.count];
	
	[self enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
		id mappedElement = mapBlock([key asAssociationWithValue:obj]);
		BOOL mappedElementIsAssociation = [mappedElement isKindOfClass:OCAssociation.class];
		returnsOnlyAssociations = returnsOnlyAssociations && mappedElementIsAssociation;
		if (returnsOnlyAssociations && mappedElementIsAssociation) {
			OCAssociation *assoc = (OCAssociation *)mappedElement;
			[workingKeys addObject:assoc.key];
			[workingValues addObject:assoc.value];
		} else {
			[workingValues addObject:mappedElement];
		}
	}];
	
	if (returnsOnlyAssociations) {
		return [self.class dictionaryWithObjects:workingValues forKeys:workingKeys];
	}
	
	return [NSArray arrayWithArray:workingValues];
	
}

@end


@implementation NSSet (OpinionatedMapping)

- (id)map:(id (^)(id))mapBlock {
	
	NSMutableSet *workingSet = [[NSMutableSet alloc] initWithCapacity:self.count];
	
	[self enumerateObjectsUsingBlock:^(id obj, BOOL *stop) {
		id mappedElement = mapBlock(obj);
		[workingSet addObject:mappedElement];
	}];
	
	return [self.class setWithSet:workingSet];
	
}

@end
