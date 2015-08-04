#import "NSDictionary+OpinionatedExtensions.h"
#import "OCEnumerators.h"


@implementation NSDictionary (OpinionatedExtensions)

- (NSEnumerator *)associationEnumerator {
	return [[OCAssociationEnumerator alloc] initWithDictionary:self];
}

@end
