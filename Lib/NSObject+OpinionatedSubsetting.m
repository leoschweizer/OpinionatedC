#import "NSObject+OpinionatedSubsetting.h"


@implementation NSObject (OpinionatedSubsetting)

- (id)first {
	return self;
}

- (id<NSFastEnumeration>)first:(NSUInteger)count {
	return count > 0 ? @[self] : @[];
}

@end


@implementation NSArray (OpinionatedSubsetting)

- (id)first {
	return [self firstObject];
}

- (id<NSFastEnumeration>)first:(NSUInteger)count {
	return [self subarrayWithRange:NSMakeRange(0, MIN(count, self.count))];
}

@end
