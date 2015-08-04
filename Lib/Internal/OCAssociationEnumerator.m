#import "OCAssociationEnumerator.h"
#import "OCassociation.h"


@interface OCAssociationEnumerator ()

@property (nonatomic, readwrite) NSDictionary *backingDictionary;
@property (nonatomic, readwrite) NSMutableArray *retainedAssociations;

@end


@implementation OCAssociationEnumerator

+ (instancetype)enumerateDictionary:(NSDictionary *)dictionary {
	return [[self alloc] initWithDictionary:dictionary];
}

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
	if (self = [super init]) {
		_backingDictionary = dictionary;
		_retainedAssociations = [NSMutableArray arrayWithCapacity:dictionary.count];
	}
	return self;
}

- (NSUInteger)countByEnumeratingWithState:(NSFastEnumerationState *)state objects:(__unsafe_unretained id [])buffer count:(NSUInteger)len {
	
	NSArray *keys = [self.backingDictionary allKeys];
	
	NSUInteger batchCount = 0;
	while (state->state < self.backingDictionary.count && batchCount < len) {
		id currentKey = [keys objectAtIndex:state->state];
		id currentValue = [self.backingDictionary objectForKey:currentKey];
		OCAssociation *assoc = [currentKey asAssociationWithValue:currentValue];
		[self.retainedAssociations addObject:assoc];
		buffer[batchCount] = assoc;
		state->state = state->state + 1;
		batchCount++;
	}
	
	state->itemsPtr = buffer;
	state->mutationsPtr = &state->extra[0];
	return batchCount;
	
}

@end
