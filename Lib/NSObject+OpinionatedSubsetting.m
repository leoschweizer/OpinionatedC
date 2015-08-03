#import "NSObject+OpinionatedSubsetting.h"


@implementation NSObject (OpinionatedSubsetting)

- (id)first {
	return self;
}

- (id)first:(NSUInteger)count {
	return count > 0 ? @[self] : @[];
}

@end


@implementation NSArray (OpinionatedSubsetting)

- (id)first {
	return [self firstObject];
}

- (id)first:(NSUInteger)count {
	return [self subarrayWithRange:NSMakeRange(0, MIN(count, self.count))];
}

@end


@implementation NSString (OpinionatedSubsetting)

- (id)first {
	return [self first:1];
}

- (id)first:(NSUInteger)count {
	return [self substringWithRange:NSMakeRange(0, MIN(count, self.length))];
}

@end
