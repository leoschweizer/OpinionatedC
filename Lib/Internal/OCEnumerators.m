#import "OCEnumerators.h"
#import "OCAssociation.h"
#import "OCInterval.h"


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
	
	return [currentKey asAssociationWithValue:currentValue];
	
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


@interface OCIntervalEnumerator ()

@property (nonatomic, readonly) OCInterval *interval;
@property (nonatomic, readwrite) NSInteger index;

@end


@implementation OCIntervalEnumerator

- (instancetype)initWithInterval:(OCInterval *)interval {
	if (self = [super init]) {
		_interval = interval;
		_index = 0;
	}
	return self;
}

- (NSInteger)size {
	
	if (self.interval.by == 0) {
		return 0;
	}
	
	if (self.interval.by < 0) {
		if (self.interval.from < self.interval.to) {
			return 0;
		} else {
			return (self.interval.to - self.interval.from) / self.interval.by + 1;
		}
	} else {
		if (self.interval.to < self.interval.from) {
			return 0;
		} else {
			return (self.interval.to - self.interval.from) / self.interval.by + 1;
		}
	}
	
}

- (id)nextObject {
	NSInteger end = [self size] - 1;
	if (self.index <= end) {
		return @(self.interval.from + (self.interval.by * self.index++));
	}
	return nil;
}

@end


@implementation OCNullEnumerator

- (id)nextObject {
	return nil;
}

@end
