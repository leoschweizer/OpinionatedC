#import "NSNumber+OpinionatedExtensions.h"
#import "OCInterval.h"
#import <stdlib.h>
#import <math.h>


@implementation NSNumber (OpinionatedExtensions)

- (NSNumber *)atRandom {
	NSInteger sign = [self integerValue] < 0 ? -1 : 1;
	uint32_t limit = abs([self intValue]);
	int rand = arc4random_uniform(limit);
	return @(sign * rand);
}

- (void)timesRepeat:(OCRepeatBlock)repeatBlock {
	[self timesRepeatWithIndex:^(NSUInteger idx) {
		repeatBlock();
	}];
}

- (void)timesRepeatWithIndex:(OCRepeatWithIndexBlock)repeatBlock {
	NSAssert([self integerValue] >= 0, @"cannot repeat things a negative number of times");
	NSUInteger count = [self unsignedIntegerValue];
	for (NSUInteger idx = 1; idx <= count; idx++) {
		repeatBlock(idx);
	}
}

- (OCInterval *)to:(NSNumber *)other {
	return [self to:other by:@1];
}

- (OCInterval *)to:(NSNumber *)other by:(NSNumber *)stepSize {
	return [[OCInterval alloc] initWithFrom:[self integerValue] to:[other integerValue] by:[stepSize integerValue]];
}

@end
