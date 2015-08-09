#import "NSObject+OpinionatedAggregating.h"
#import "OCCollectionCapabilities.h"


@implementation NSObject (OpinionatedAggregating)

- (NSNumber *)average {
	return [self average:^NSNumber *(id each) {
		return each;
	}];
}

- (NSNumber *)average:(OCNumericAggregationBlock)averageBlock {
	
	if ([self conformsToProtocol:@protocol(OCEnumerableCollection)]) {
		NSMutableArray *numbers = [NSMutableArray array];
		for (id each in [(id<OCEnumerableCollection>)self oc_collectionEnumerator]) {
			[numbers addObject:averageBlock(each)];
		}
		return [numbers valueForKeyPath:@"@avg.self"];
	}
	
	return averageBlock(self);
	
}

- (NSUInteger)count:(OCCountBlock)countBlock {
	
	if ([self conformsToProtocol:@protocol(OCEnumerableCollection)]) {
		NSEnumerator *collectionEnumerator = [(id<OCEnumerableCollection>)self oc_collectionEnumerator];
		NSUInteger count = 0;
		for (id each in collectionEnumerator) {
			if (countBlock(each)) {
				count++;
			}
		}
		return count;
	}
	
	return countBlock(self) ? 1 : 0;
	
}

- (NSNumber *)max {
	return [self valueForKeyPath:@"@max.self"];
}

- (id)max:(OCNumericAggregationBlock)maxBlock {
	
	if ([self conformsToProtocol:@protocol(OCEnumerableCollection)]) {
		id maxElement = nil;
		NSNumber *maxValue = nil;
		for (id each in [(id<OCEnumerableCollection>)self oc_collectionEnumerator]) {
			if (!maxElement) {
				maxElement = each;
				maxValue = maxBlock(each);
			} else {
				NSNumber *currentValue = maxBlock(each);
				if ([currentValue compare:maxValue] == NSOrderedDescending) {
					maxValue = currentValue;
					maxElement = each;
				}
			}
		}
		return maxElement;
	}
	
	return self;
	
}

- (NSNumber *)min {
	return [self valueForKeyPath:@"@min.self"];
}

- (id)min:(OCNumericAggregationBlock)minBlock {
	
	if ([self conformsToProtocol:@protocol(OCEnumerableCollection)]) {
		id minElement = nil;
		NSNumber *minValue = nil;
		for (id each in [(id<OCEnumerableCollection>)self oc_collectionEnumerator]) {
			if (!minElement) {
				minElement = each;
				minValue = minBlock(each);
			} else {
				NSNumber *currentValue = minBlock(each);
				if ([currentValue compare:minValue] == NSOrderedAscending) {
					minValue = currentValue;
					minElement = each;
				}
			}
		}
		return minElement;
	}
	
	return self;
	
}


- (NSNumber *)sum {
	return [self sum:^NSNumber *(id each) {
		return each;
	}];
}

- (NSNumber *)sum:(OCNumericAggregationBlock)sumBlock {
	
	if ([self conformsToProtocol:@protocol(OCEnumerableCollection)]) {
		NSMutableArray *numbers = [NSMutableArray array];
		for (id each in [(id<OCEnumerableCollection>)self oc_collectionEnumerator]) {
			[numbers addObject:sumBlock(each)];
		}
		return [numbers valueForKeyPath:@"@sum.self"];
	}
	
	return sumBlock(self);
	
}

@end
