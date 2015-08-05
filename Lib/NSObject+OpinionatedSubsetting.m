#import "NSObject+OpinionatedSubsetting.h"
#import "OCMutableCollectionConstruction.h"
#import "OCAssociation.h"


@implementation NSObject (OpinionatedSubsetting)

- (id)detect:(OCFilterBlock)detectBlock {
	
	if ([self conformsToProtocol:@protocol(OCMutableCollectionConstruction)]) {
		NSEnumerator *collectionEnumerator = [(id<OCMutableCollectionConstruction>)self oc_collectionEnumerator];
		for (id each in collectionEnumerator) {
			if (detectBlock(each)) {
				return each;
			}
		}
		return nil;
	}
	
	return detectBlock(self) ? self : nil;
	
}

- (id)first {
	return self;
}

- (id)first:(NSUInteger)count {
	return count > 0 ? @[self] : @[];
}

- (id)reject:(OCFilterBlock)rejectBlock {
	return [self select:^BOOL(id each) {
		return !rejectBlock(each);
	}];
}

- (id)select:(OCFilterBlock)selectBlock {
	return selectBlock(self) ? self : nil;
}

@end


@implementation NSArray (OpinionatedSubsetting)

- (id)first {
	return [self firstObject];
}

- (id)first:(NSUInteger)count {
	return [self subarrayWithRange:NSMakeRange(0, MIN(count, self.count))];
}

- (id)select:(OCFilterBlock)selectBlock {
	NSIndexSet *indices = [self indexesOfObjectsPassingTest:^BOOL(id obj, NSUInteger idx, BOOL *stop) {
		return selectBlock(obj);
	}];
	return [self.class arrayWithArray:[self objectsAtIndexes:indices]];
}

@end


@implementation NSDictionary (OpinionatedSubsetting)

- (id)select:(OCFilterBlock)selectBlock {
	NSMutableArray *keys = [NSMutableArray array];
	NSMutableArray *values = [NSMutableArray array];
	for (id key in self) {
		id value = [self objectForKey:key];
		if (selectBlock([key asAssociationWithValue:value])) {
			[keys addObject:key];
			[values addObject:value];
		}
	}
	return [self.class dictionaryWithObjects:values forKeys:keys];
}

@end


@implementation NSSet (OpinionatedSubsetting)

- (id)select:(OCFilterBlock)selectBlock {
	return [self.class setWithSet:[self objectsPassingTest:^BOOL(id obj, BOOL *stop) {
		return selectBlock(obj);
	}]];
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
