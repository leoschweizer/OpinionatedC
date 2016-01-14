#import "OCEnumerableMockCollection.h"


@implementation OCEnumerableMockCollection

- (NSEnumerator *)oc_collectionEnumerator {
	return [@[@1, @2, @3] objectEnumerator];
}

@end
