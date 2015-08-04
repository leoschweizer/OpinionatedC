#import "NSDictionary+OpinionatedExtensions.h"
#import "OCAssociationEnumerator.h"


@implementation NSDictionary (OpinionatedExtensions)

- (id<NSFastEnumeration>)associations {
	return [OCAssociationEnumerator enumerateDictionary:self];
}

@end
