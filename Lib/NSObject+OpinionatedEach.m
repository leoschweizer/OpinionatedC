#import "NSObject+OpinionatedEach.h"
#import "OCAssociation.h"


@implementation NSObject (OpinionatedEach)

- (void)each:(OCEachBlock)eachBlock {
	[self
		eachWithIndex:^(id each, NSUInteger idx) {
			eachBlock(each);
		}
		separatedBy:nil
	];
}

- (void)eachWithIndex:(OCEachWithIndexBlock)eachBlock {
	[self eachWithIndex:eachBlock separatedBy:nil];
}

- (void)each:(OCEachBlock)eachBlock separatedBy:(OCEachSeparatorBlock)separatorBlock {
	[self
		eachWithIndex:^(id each, NSUInteger idx) {
			eachBlock(each);
		}
		separatedBy:separatorBlock
	];
}

- (void)eachWithIndex:(OCEachWithIndexBlock)eachBlock separatedBy:(OCEachSeparatorBlock)separatorBlock {
	if ([self conformsToProtocol:@protocol(NSFastEnumeration)]) {
		NSUInteger idx = 0;
		for (id each in (id<NSFastEnumeration>)self) {
			if (idx > 0) {
				if (separatorBlock) {
					separatorBlock();
				}
			}
			eachBlock(each, idx);
			idx++;
		}
	} else {
		eachBlock(self, 0);
	}
}

@end


@implementation NSDictionary (OpinionatedEach)

- (void)each:(OCEachBlock)eachBlock{
	[self
		eachWithIndex:^(id each, NSUInteger idx) {
			eachBlock(each);
		}
		separatedBy:nil
	];
}

- (void)eachWithIndex:(OCEachWithIndexBlock)eachBlock {
	[self eachWithIndex:eachBlock separatedBy:nil];
}

- (void)each:(OCEachBlock)eachBlock separatedBy:(OCEachSeparatorBlock)separatorBlock {
	[self
		eachWithIndex:^(id each, NSUInteger idx) {
			eachBlock(each);
		}
		separatedBy:separatorBlock
	];
}

- (void)eachWithIndex:(OCEachWithIndexBlock)eachBlock separatedBy:(OCEachSeparatorBlock)separatorBlock {
	NSUInteger idx = 0;
	for (id key in self) {
		id value = [self objectForKey:key];
		if (idx > 0) {
			if (separatorBlock) {
				separatorBlock();
			}
		}
		eachBlock([key asAssociationWithValue:value], idx);
	}
}

@end
