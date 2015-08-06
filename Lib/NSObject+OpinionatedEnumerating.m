#import "NSObject+OpinionatedEnumerating.h"
#import "OCAssociation.h"
#import "OCCollectionCapabilities.h"


@implementation NSObject (OpinionatedEnumeration)

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
	if ([self conformsToProtocol:@protocol(OCEnumerableCollection)]) {
		NSUInteger idx = 0;
		for (id each in [(id<OCEnumerableCollection>)self oc_collectionEnumerator]) {
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

- (BOOL)isEmpty {
	
	if ([self respondsToSelector:@selector(count)]) {
		return [(id)self count] == 0;
	}
	
	if ([self respondsToSelector:@selector(length)]) {
		return [(id)self length] == 0;
	}
	
	if ([self conformsToProtocol:@protocol(OCEnumerableCollection)]) {
		for (id __attribute__((unused))each in [(id<OCEnumerableCollection>)self oc_collectionEnumerator]) {
			return NO;
		}
		return YES;
	}
	
	return NO;
	
}

- (BOOL)isNotEmpty {
	return ![self isEmpty];
}

@end
