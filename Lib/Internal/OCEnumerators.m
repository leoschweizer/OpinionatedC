#import "OCEnumerators.h"
#import "OCassociation.h"
#import "OCSelectorPrefix.h"


@interface OCAssociationEnumerator ()

@property (nonatomic, readonly) NSDictionary *backingDictionary;
@property (nonatomic, readonly) NSArray *allKeys;
@property (nonatomic, readwrite) NSUInteger currentIndex;

@end


@implementation OCAssociationEnumerator

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
	
	return [currentKey OC_PREFIXED(asAssociationWithValue):currentValue];
	
}

@end


@interface OCCharacterEnumerator ()

@property (nonatomic, readonly) NSString *backingString;
@property (nonatomic, readwrite) NSUInteger currentIndex;

@end


@implementation OCCharacterEnumerator

- (instancetype)initWithString:(NSString *)string {
	if (self = [super init]) {
		_backingString = string;
		_currentIndex = 0;
	}
	return self;
}

- (id)nextObject {
	
	if (self.currentIndex >= self.backingString.length) {
		return nil;
	}
	
	id current = [self.backingString substringWithRange:NSMakeRange(self.currentIndex, 1)];
	self.currentIndex++;
	return current;
	
}

@end


@implementation OCNullEnumerator

- (id)nextObject {
	return nil;
}

@end
