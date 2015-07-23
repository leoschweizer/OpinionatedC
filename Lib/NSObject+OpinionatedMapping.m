#import "NSObject+OpinionatedMapping.h"


@implementation NSObject (OpinionatedMapping)

- (id)map:(id (^)(id))mapBlock {
	return mapBlock(self);
}

@end


@implementation NSArray (OpinionatedMapping)

- (id)map:(id (^)(id))mapBlock {
	NSMutableArray *workingArray = [NSMutableArray arrayWithCapacity:self.count];
	[self enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
		id mappedElement = mapBlock(obj);
		[workingArray addObject:mappedElement];
	}];
	return [self.class arrayWithArray:workingArray];
}

@end
