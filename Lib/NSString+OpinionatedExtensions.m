#import "NSString+OpinionatedExtensions.h"
#import "OCEnumerators.h"


@implementation NSString (OpinionatedExtensions)

- (NSEnumerator *)characterEnumerator {
	return [[OCCharacterEnumerator alloc] initWithString:self];
}

@end
