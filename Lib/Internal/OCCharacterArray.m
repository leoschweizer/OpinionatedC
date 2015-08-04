#import "OCCharacterArray.h"
#import "OpinionatedMacros.h"


@interface OCCharacterArray ()

@property (nonatomic, readwrite) NSString *backingString;

@end


@implementation OCCharacterArray

+ (instancetype)characterArrayWithString:(NSString *)aString {
	return [[self alloc] initWithString:aString];
}

- (instancetype)initWithString:(NSString *)aString {
	if (self = [super init]) {
		_backingString = aString;
	}
	return self;
}

- (NSUInteger)count {
	return self.backingString.length;
}

- (id)objectAtIndex:(NSUInteger)index {
	return [self.backingString substringWithRange:NSMakeRange(index, 1)];
}

- (id)copyWithZone:(NSZone *)zone {
	NotYetImplemented();
}

- (id)mutableCopyWithZone:(NSZone *)zone {
	NotYetImplemented();
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
	NotYetImplemented();
}

- (void)encodeWithCoder:(NSCoder *)aCoder {
	NotYetImplemented();
}

- (BOOL)isEqualToArray:(NSArray *)otherArray {
	if (![otherArray isKindOfClass:self.class]) {
		return NO;
	}
	OCCharacterArray *other = (OCCharacterArray *)otherArray;
	return [other.backingString isEqualToString:self.backingString];
}

@end
