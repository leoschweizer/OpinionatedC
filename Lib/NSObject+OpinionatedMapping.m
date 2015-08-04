#import "NSObject+OpinionatedMapping.h"
#import "OCAssociation.h"
#import "OCMutableCollectionConstruction.h"


@implementation NSObject (OpinionatedMapping)

- (id)map:(OCMapBlock)mapBlock {
	
	if ([self conformsToProtocol:@protocol(OCMutableCollectionConstruction)]) {
		id<OCMutableCollectionConstruction> this = (id<OCMutableCollectionConstruction>)self;
		id mutableCollection = [this newMutableCollectionInstace];
		for (id each in [this collectionEnumerator]) {
			[this addObject:mapBlock(each) toMutableCollection:mutableCollection];
		}
		return [this newCollectionFromMutableCollection:mutableCollection];
	}
	
	return mapBlock(self);
	
}

@end
