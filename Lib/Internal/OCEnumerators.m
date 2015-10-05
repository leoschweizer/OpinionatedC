#import "OCEnumerators.h"
#import "OCAssociation.h"
#import "OCInterval.h"


@interface OCAssociationEnumerator ()

@property (nonatomic, readonly) NSDictionary *backingDictionary;
@property (nonatomic, readonly) NSEnumerator *keyEnumerator;

@end


@implementation OCAssociationEnumerator

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
	if (self = [super init]) {
		_backingDictionary = dictionary;
		_keyEnumerator = [_backingDictionary keyEnumerator];
	}
	return self;
}

- (id)nextObject {
	
	id nextKey = [self.keyEnumerator nextObject];
	if (!nextKey) {
		return nil;
	}
	
	id nextValue = [self.backingDictionary objectForKey:nextKey];
	return [nextKey asAssociationWithValue:nextValue];
	
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


@interface OCMapTableEnumerator ()

@property (nonatomic, readonly) NSMapTable *mapTable;
@property (nonatomic, readonly) NSEnumerator *keyEnumerator;

@end


@implementation OCMapTableEnumerator

- (instancetype)initWithMapTable:(NSMapTable *)mapTable {
	if (self = [super init]) {
		_mapTable = mapTable;
		_keyEnumerator = [_mapTable keyEnumerator];
	}
	return self;
}

- (id)nextObject {
	
	id nextKey = [self.keyEnumerator nextObject];
	if (!nextKey) {
		return nil;
	}
	
	id nextValue = [self.mapTable objectForKey:nextKey];
	return [nextKey asAssociationWithValue:nextValue];
	
}

@end


@implementation OCNullEnumerator

- (id)nextObject {
	return nil;
}

@end
