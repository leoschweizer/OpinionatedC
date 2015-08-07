#import "NSNumber+OpinionatedExtensions.h"


@implementation NSNumber (OpinionatedExtensions)

- (void)timesRepeat:(OCRepeatBlock)repeatBlock {
	[self timesRepeatWithIndex:^(NSUInteger idx) {
		repeatBlock();
	}];
}

- (void)timesRepeatWithIndex:(OCRepeatWithIndexBlock)repeatBlock {
	NSAssert([self isGreaterThanOrEqualTo:@0], @"cannot repeat things a negative number of times");
	NSUInteger count = [self unsignedIntegerValue];
	for (NSUInteger idx = 1; idx <= count; idx++) {
		repeatBlock(idx);
	}
}

@end
