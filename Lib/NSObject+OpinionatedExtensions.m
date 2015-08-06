#import "NSObject+OpinionatedExtensions.h"


@implementation NSObject (OpinionatedExtensions)

- (BOOL)isNull {
	return [self isEqual:[NSNull null]];
}

- (BOOL)isNotNull {
	return ![self isNull];
}

@end
