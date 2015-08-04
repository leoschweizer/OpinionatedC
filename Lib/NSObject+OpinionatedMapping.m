#import "NSObject+OpinionatedMapping.h"
#import "OCAssociation.h"
#import "OCMutableCollectionConstruction.h"


@implementation NSObject (OpinionatedMapping)

- (id)map:(OCMapBlock)mapBlock {
	
	if ([self conformsToProtocol:@protocol(OCMutableCollectionConstruction)]) {
		id<OCMutableCollectionConstruction> this = (id<OCMutableCollectionConstruction>)self;
		id mutableCollection = [this newMutableCollectionInstace];
		for (id each in this) {
			[this addObject:mapBlock(each) toMutableCollection:mutableCollection];
		}
		return [this newCollectionFromMutableCollection:mutableCollection];
	}
	
	return mapBlock(self);
	
}

@end


@implementation NSDictionary (OpinionatedMapping)

- (id)map:(OCMapBlock)mapBlock {
	
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
