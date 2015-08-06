#import "NSObject+OpinionatedEnumerating.h"
#import "OCAssociation.h"
#import "OCMutableCollectionConstruction.h"


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
	if ([self conformsToProtocol:@protocol(OCMutableCollectionConstruction)]) {
		NSUInteger idx = 0;
		for (id each in [(id<OCMutableCollectionConstruction>)self oc_collectionEnumerator]) {
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
	
	if ([self conformsToProtocol:@protocol(OCMutableCollectionConstruction)]) {
		for (id __attribute__((unused))each in [(id<OCMutableCollectionConstruction>)self oc_collectionEnumerator]) {
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
