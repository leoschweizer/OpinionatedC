#import "NSObject+OpinionatedExtensions.h"


@implementation NSObject (OpinionatedExtensions)

- (BOOL)isNull {
	return [self isEqualTo:[NSNull null]];
}

- (BOOL)isNotNull {
	return ![self isNull];
}

@end
