#import "OCAssociationEnumerator.h"
#import "OCassociation.h"


@interface OCAssociationEnumerator ()

@property (nonatomic, readwrite) NSDictionary *backingDictionary;
@property (nonatomic, readwrite) NSArray *allKeys;
@property (nonatomic, readwrite) NSUInteger currentIndex;

@end


@implementation OCAssociationEnumerator

+ (instancetype)enumerateDictionary:(NSDictionary *)dictionary {
	return [[self alloc] initWithDictionary:dictionary];
}

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
	if (self = [super init]) {
		_backingDictionary = dictionary;
		_allKeys = [dictionary allKeys];
		_currentIndex = 0;
	}
	return self;
}

- (id)nextObject {
	
	if (self.currentIndex >= self.allKeys.count) {
		return nil;
	}
	
	id currentKey = [self.allKeys objectAtIndex:self.currentIndex];
	id currentValue = [self.backingDictionary objectForKey:currentKey];
	
	self.currentIndex++;
	
	return [currentKey asAssociationWithValue:currentValue];
	
}

@end
