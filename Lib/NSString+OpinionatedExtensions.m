#import "NSString+OpinionatedExtensions.h"
#import "OCCharacterArray.h"


@implementation NSString (OpinionatedExtensions)

- (NSArray *)characters {
	return [OCCharacterArray characterArrayWithString:self];
}

@end
