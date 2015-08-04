#import "NSObject+OpinionatedMapping.h"
#import "OCAssociation.h"
#import "OCMutableCollectionConstruction.h"


@implementation NSObject (OpinionatedMapping)

- (id)map:(OCMapBlock)mapBlock {
	
	if ([self conformsToProtocol:@protocol(OCMutableCollectionConstruction)]) {
		id<OCMutableCollectionConstruction> this = (id<OCMutableCollectionConstruction>)self;
		id mutableCollection = [this oc_createMutableInstanceOfMyKind];
		for (id each in [this oc_collectionEnumerator]) {
			[this oc_addObject:mapBlock(each) toMutableCollection:mutableCollection];
		}
		return [this oc_createCollectionOfMyKindFromMutableCollection:mutableCollection];
	}
	
	return mapBlock(self);
	
}

@end
