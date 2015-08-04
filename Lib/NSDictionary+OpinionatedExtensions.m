#import "NSDictionary+OpinionatedExtensions.h"
#import "OCAssociationEnumerator.h"


@implementation NSDictionary (OpinionatedExtensions)

- (NSEnumerator *)associationEnumerator {
	return [OCAssociationEnumerator enumerateDictionary:self];
}

@end
