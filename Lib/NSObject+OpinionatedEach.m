#import "NSObject+OpinionatedEach.h"
#import "OCAssociation.h"


@implementation NSObject (OpinionatedEach)

- (void)each:(OCEachBlock)eachBlock {
	if ([self conformsToProtocol:@protocol(NSFastEnumeration)]) {
		for (id each in (id<NSFastEnumeration>)self) {
			eachBlock(each);
		}
	} else {
		eachBlock(self);
	}
}

- (void)eachWithIndex:(OCEachWithIndexBlock)eachBlock {
	if ([self conformsToProtocol:@protocol(NSFastEnumeration)]) {
		NSUInteger idx = 0;
		for (id each in (id<NSFastEnumeration>)self) {
			eachBlock(each, idx);
			idx++;
		}
	} else {
		eachBlock(self, 0);
	}
}

- (void)each:(OCEachBlock)eachBlock separatedBy:(OCEachSeparatorBlock)separatorBlock {
	if ([self conformsToProtocol:@protocol(NSFastEnumeration)]) {
		BOOL isFirst = YES;
		for (id each in (id<NSFastEnumeration>)self) {
			if (isFirst) {
				isFirst = NO;
			} else {
				separatorBlock();
			}
			eachBlock(each);
		}
	} else {
		eachBlock(self);
	}
}

@end


@implementation NSDictionary (OpinionatedEach)

- (void)each:(OCEachBlock)eachBlock{
	for (id key in self) {
		id value = [self objectForKey:key];
		eachBlock([key asAssociationWithValue:value]);
	}
}

- (void)eachWithIndex:(OCEachWithIndexBlock)eachBlock {
	NSUInteger idx = 0;
	for (id key in self) {
		id value = [self objectForKey:key];
		eachBlock([key asAssociationWithValue:value], idx);
		idx++;
	}
}

- (void)each:(OCEachBlock)eachBlock separatedBy:(OCEachSeparatorBlock)separatorBlock {
	BOOL isFirst = YES;
	for (id key in self) {
		id value = [self objectForKey:key];
		if (isFirst) {
			isFirst = NO;
		} else {
			separatorBlock();
		}
		eachBlock([key asAssociationWithValue:value]);
	}
}

@end
